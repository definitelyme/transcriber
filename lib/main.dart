import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transcriber/app.dart';
import 'package:transcriber/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // This app is designed only to work vertically, so we limit
  // orientations to portrait up and down.
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  // Setup Environmental variables & Service provider
  await BuildEnvironment.init();

  runApp(const AppView());
}
