library font_manager.dart;

import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:dynamic_cached_fonts/dynamic_cached_fonts.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:isolate_handler/isolate_handler.dart';
import 'package:transcriber/core/data/index.dart';
import 'package:transcriber/utils/utils.dart';

part 'font_manager.hive.dart';

@HiveType(typeId: 2)
class FontManager extends HiveObject {
  static final IsolateHandler _isolateHandler = IsolateHandler();

  static const String ios = 'SanFrancisco';
  static const String android = 'Lato';
  static String family = Utils.isPlatform(material: android, cupertino: ios)!;
  static const String folder = 'fonts';

  static const List<String> _latoFontsList = [
    'Lato-Black.ttf',
    'Lato-BlackItalic.ttf',
    'Lato-Bold.ttf',
    'Lato-BoldItalic.ttf',
    'Lato-Italic.ttf',
    'Lato-Light.ttf',
    'Lato-LightItalic.ttf',
    'Lato-Regular.ttf',
    'Lato-Thin.ttf',
    'Lato-ThinItalic.ttf',
  ];

  static const List<String> _sanFranciscoFontsList = [
    'SF-Pro-Display-BlackItalic.otf',
    'SF-Pro-Display-BoldItalic.otf',
    'SF-Pro-Display-HeavyItalic.otf',
    'SF-Pro-Display-LightItalic.otf',
    'SF-Pro-Display-MediumItalic.otf',
    'SF-Pro-Display-RegularItalic.otf',
    'SF-Pro-Display-SemiboldItalic.otf',
    'SF-Pro-Display-ThinItalic.otf',
    'SF-Pro-Display-UltralightItalic.otf',
    'SF-Pro-Text-Bold.otf',
    'SF-Pro-Text-BoldItalic.otf',
    'SF-Pro-Text-Heavy.otf',
    'SF-Pro-Text-HeavyItalic.otf',
    'SF-Pro-Text-Light.otf',
    'SF-Pro-Text-LightItalic.otf',
    'SF-Pro-Text-Medium.otf',
    'SF-Pro-Text-MediumItalic.otf',
    'SF-Pro-Text-Regular.otf',
    'SF-Pro-Text-RegularItalic.otf',
    'SF-Pro-Text-Semibold.otf',
    'SF-Pro-Text-SemiboldItalic.otf',
    'SFNSDisplay-Black.otf',
    'SFNSDisplay-Bold.otf',
    'SFNSDisplay-Heavy.otf',
    'SFNSDisplay-Light.otf',
    'SFNSDisplay-Medium.otf',
    'SFNSDisplay-Regular.otf',
    'SFNSDisplay-Semibold.otf',
    'SFNSDisplay-Thin.otf',
    'SFNSDisplay-Ultralight.otf',
    'SFNSText-Bold.otf',
    'SFNSText-BoldItalic.otf',
    'SFNSText-Heavy.otf',
    'SFNSText-HeavyItalic.otf',
    'SFNSText-Light.otf',
    'SFNSText-LightItalic.otf',
    'SFNSText-Medium.otf',
    'SFNSText-MediumItalic.otf',
    'SFNSText-Regular.otf',
    'SFNSText-RegularItalic.otf',
    'SFNSText-Semibold.otf',
    'SFNSText-SemiboldItalic.otf',
    'SFUIText-Regular.otf',
  ];

  static List<String> get _fontsList => Utils.isPlatform(material: _latoFontsList, cupertino: _sanFranciscoFontsList)!;

  @HiveField(0)
  final String _fontFamily;

  @HiveField(1)
  final List<String> _urls;

  FontManager(this._fontFamily, this._urls);

  factory FontManager.create({required String family, List<String> urls = const []}) => FontManager(family, urls);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FontManager && other._fontFamily == _fontFamily;
  }

  @override
  int get hashCode => _fontFamily.hashCode;

  static Future<void> _cacheFontFamily(dynamic _obj, {required String family}) async {
    final data = jsonDecode('$_obj');
    final urls = (data?['urls'] as List?)?.map((e) => '$e').toList();

    if (urls != null && urls.isNotEmpty) {
      final _family = data['family'] as String? ?? family;

      await DynamicCachedFonts.family(urls: urls, fontFamily: _family).load();
      // DynamicCachedFonts.cacheFontStream(url);
    }

    try {
      _isolateHandler.kill(_generateIsolateName(family));
    } catch (e) {
      debugPrint('Error killing isolate: ${_generateIsolateName(family)}: $e');
    }
  }

  static String _generateIsolateName(String fontFamily) => 'font_manager_isolate_$fontFamily';

  static Future<FontManager> _getFontMetadata(String family) async {
    final downloadUrls = _fontsList.map((e) => 'https://res.cloudinary.com/dgfaureva/raw/upload/$folder/$family/$e').toList();

    final font = FontManager.create(family: family, urls: downloadUrls);

    if (font.isInBox) {
      await font.save();
    } else {
      await HiveClient.fontsBox?.add(font);
    }

    return font;
  }

  static void _loadFontFamily(Map<String, dynamic> context) {
    final messenger = HandledIsolate.initialize(context);

    messenger.listen((data) async {
      final family = data['family'] as String?;
      final folder = data['folder'] as String?;

      assert(family != null && folder != null, 'Font family & Font folder must not be null');

      await HiveClient.initialize();

      var font = HiveClient.fontsBox?.values.firstOrNull((i) => i._fontFamily == family);

      font ??= await _getFontMetadata(family!);

      final map = font._urls.map((url) => DynamicCachedFonts.canLoadFont(url));
      final result = await Future.wait(map, eagerError: true);
      final needsCaching = result.any((e) => e == false);

      if (needsCaching) {
        messenger.send(jsonEncode({'urls': font._urls, 'family': font._fontFamily}));
      } else {
        messenger.send({});
        Future.delayed(const Duration(seconds: 1), messenger.dispose);
      }
    });
  }

  static void loadFontFamily(String family, {String folder = FontManager.folder}) {
    StreamSubscription<dynamic>? _errorSubscription;
    final errorPort = ReceivePort();

    _errorSubscription ??= errorPort.listen((msg) {
      debugPrint('An error occured in Isolate: ${_generateIsolateName(family)}');
      _errorSubscription?.cancel();
      _isolateHandler.kill(_generateIsolateName(family));
    });

    _isolateHandler.spawn(
      _loadFontFamily,
      name: _generateIsolateName(family),
      onReceive: (val) => _cacheFontFamily(val, family: family),
      errorsAreFatal: true,
      onError: errorPort.sendPort,
      debugName: _generateIsolateName(family),
      onInitialized: () => _isolateHandler.send(
        {'family': family, 'folder': folder},
        to: _generateIsolateName(family),
      ),
    );
  }

  static void registerAdapter() => Hive.registerAdapter(FontManagerAdapter());
}
