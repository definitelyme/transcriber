library bottomsheet_close_button.dart;

import 'package:transcriber/core/presentation/index.dart';
import 'package:flutter/material.dart';
import 'package:transcriber/utils/utils.dart';

/// A stateless widget to render BottomsheetCloseButton.
class BottomsheetCloseButton extends StatelessWidget {
  final bool isLoading;
  final bool showLoader;
  final Widget? trailing;
  final Widget? middle;

  const BottomsheetCloseButton({
    Key? key,
    this.isLoading = false,
    this.showLoader = false,
    this.trailing,
    this.middle,
  }) : super(key: key);

  Widget get _leading => Padding(
        padding: EdgeInsets.symmetric(horizontal: Utils.isPlatform(material: 0.01.w, cupertino: sidePadding)!),
        child: Utils.isPlatform(
          material: Center(
            child: AdaptiveToolbar.materialToolbarAction(
              tooltip: 'Close',
              onPressed: navigator.pop,
              icon: Icons.arrow_back,
              backgroundColor: Palette.transparent,
            ),
          ),
          cupertino: AdaptiveButton(
            text: 'Close',
            materialData: (d) => d.copyWith(
              elevation: 0.0,
              width: 0.1.w,
              splashColor: Utils.resolveColor(Colors.grey.shade300, dark: Colors.grey.shade800),
            ),
            cupertinoData: (d) => d.copyWith(height: 0.04.h),
            fontSize: 18.5.sp,
            padding: EdgeInsets.zero,
            backgroundColor: Utils.resolveColor(Colors.transparent),
            textColor: Palette.primary,
            onPressed: navigator.pop,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _leading,
          //
          if (middle != null) ...[
            Flexible(child: middle!),
            //
            // if (trailing == null && !(showLoader && isLoading)) Utils.nothing,
          ],
          //
          if (trailing != null) trailing!,
          //
          if (trailing == null)
            Visibility(
              visible: showLoader && isLoading,
              replacement: Visibility(
                visible: false,
                maintainSize: true,
                maintainState: true,
                maintainInteractivity: true,
                maintainAnimation: true,
                child: _leading,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: SizedBox(
                    height: 0.06.w,
                    width: 0.06.w,
                    child: const CircularProgressBar.adaptive(strokeWidth: 2),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
