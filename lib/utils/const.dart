import 'package:flutter/material.dart';

mixin Const {
  static const appName = 'BBird Invoice';
  static const appDescription = 'An invoicing application for BowerBird App\'s accounting department.';
  static const packageName = 'com.bowerbird.invoice';
  static const minSDKVersion = '21';
  //
  static const buttonRadius = 100.0;
  static const buttonBorderRadius = BorderRadius.all(Radius.circular(buttonRadius));
  static const cardBorderRadius = BorderRadius.all(Radius.circular(cardRadius));
  static const cardRadius = 8.0;
  static const chipRadius = 20.0;
  static const chipBorderRadius = BorderRadius.all(Radius.circular(chipRadius));
  static const inputPadding = EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0);
  static const inputBorderRadius = 5.0;
  static const fontFamily = 'Spartan';
}
