part of 'adaptive_dropdown.dart';

class _CupertinoPicker<Model> extends StatefulWidget {
  final String? Function(Model)? text;
  final Widget? Function(Model)? child;
  final Color? backgroundColorDark;
  final Color? backgroundColorLight;
  final double diameterRatio;
  final Color? dropdownColor;
  final Model groupValue;
  final double? height;
  final Color? hintColor;
  final double? hintFontSize;
  final FontWeight? hintFontWeight;
  final double? itemFontSize;
  final FontWeight? itemFontWeight;
  final List<Model> items;
  final bool looping;
  final double magnification;
  final int maxLines;
  final double offAxisFraction;
  final ValueChanged<Model>? onSelectedChanged;
  final Widget? selectionOverlay;
  final bool useMagnifier;

  const _CupertinoPicker({
    Key? key,
    required this.items,
    required this.groupValue,
    this.height,
    this.onSelectedChanged,
    this.magnification = 1.1,
    this.looping = false,
    this.useMagnifier = true,
    this.diameterRatio = 1.07,
    this.dropdownColor,
    this.offAxisFraction = 0.0,
    this.selectionOverlay = const CupertinoPickerDefaultSelectionOverlay(),
    this.backgroundColorDark,
    this.backgroundColorLight,
    this.hintColor,
    this.hintFontSize,
    this.hintFontWeight,
    this.maxLines = 1,
    this.itemFontSize,
    this.itemFontWeight,
    this.text,
    this.child,
  }) : super(key: key);

  @override
  State<_CupertinoPicker<Model>> createState() => _CupertinoPickerState<Model>();
}

class _CupertinoPickerState<Model> extends State<_CupertinoPicker<Model>> {
  late int _selectedItemIndex;

  late FixedExtentScrollController scrollController;

  @override
  void initState() {
    scrollController = FixedExtentScrollController(initialItem: widget.groupValue != null ? widget.items.indexOf(widget.groupValue!) : 0);
    try {
      _selectedItemIndex = widget.items.indexOf(widget.groupValue ?? widget.items[0]);
    } catch (_) {
      _selectedItemIndex = 0;
    }
    super.initState();
  }

  Color get _backgroundDark => widget.backgroundColorDark ?? CupertinoColors.darkBackgroundGray;
  Color get _backgroundLight => widget.backgroundColorLight ?? CupertinoColors.lightBackgroundGray;
  double get _height => widget.height ?? 0.35.h;
  double get fontSize => widget.itemFontSize ?? 14;

  String? _text(Model? item) {
    if (item != null) {
      if (widget.text != null) {
        return widget.text?.call(item);
      } else {
        return _kPlaceholder;
      }
    } else {
      return _kPlaceholder;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: Stack(
        children: [
          CupertinoPicker(
            scrollController: scrollController,
            itemExtent: kMinInteractiveDimensionCupertino,
            backgroundColor: widget.dropdownColor ?? Utils.resolveColor(_backgroundLight, dark: _backgroundDark, ctx: context),
            magnification: widget.magnification,
            looping: widget.looping,
            useMagnifier: widget.useMagnifier,
            diameterRatio: widget.diameterRatio,
            offAxisFraction: widget.offAxisFraction,
            selectionOverlay: widget.selectionOverlay,
            onSelectedItemChanged: (index) => setState(() => _selectedItemIndex = index),
            children: widget.items.mapIndexed((i, item) =>
                widget.child?.call(item) ??
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: sidePadding),
                    child: AdaptiveText(
                      '${_text(item)}',
                      maxLines: widget.maxLines,
                      overflow: TextOverflow.ellipsis,
                      softWrap: widget.maxLines != 1,
                      fontSize: i == _selectedItemIndex ? fontSize + 2 : fontSize,
                      fontWeight: i == _selectedItemIndex ? FontWeight.w600 : widget.itemFontWeight,
                    ),
                  ),
                )),
          ),
          //
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(top: 0.01.w, right: 0.01.w),
              child: CupertinoButton(
                borderRadius: 8.br,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                onPressed: () {
                  try {
                    final selected = widget.items[_selectedItemIndex];
                    Navigator.pop(context, selected);
                  } catch (_) {
                    Navigator.pop(context);
                  }
                },
                child: const AdaptiveText(
                  'Done',
                  maxLines: 1,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  textColor: Palette.primaryColor,
                  textColorDark: Palette.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
