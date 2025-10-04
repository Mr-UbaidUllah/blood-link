import 'package:flutter/material.dart';

class SizeUtils {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  static final SizeUtils _instance = SizeUtils._internal();

  factory SizeUtils() {
    return _instance;
  }

  SizeUtils._internal();

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }

  static double getProportionateScreenHeight(double inputHeight) {
    return (inputHeight / 812.0) * screenHeight;
  }

  static double getProportionateScreenWidth(double inputWidth) {
    return (inputWidth / 375.0) * screenWidth;
  }

  static double fontSize(double size) {
    return (size / 375.0) * screenWidth;
  }

  static SizedBox heightSizeBox(double height) {
    return SizedBox(height: getProportionateScreenHeight(height));
  }

  static SizedBox widthSizeBox(double width) {
    return SizedBox(width: getProportionateScreenWidth(width));
  }

  static double height(double value) {
    return getProportionateScreenHeight(value);
  }

  static double width(double value) {
    return getProportionateScreenWidth(value);
  }

  static bool get isSmallScreen => screenWidth < 360;
  static bool get isMediumScreen => screenWidth >= 360 && screenWidth < 400;
  static bool get isLargeScreen => screenWidth >= 400;

  static double getResponsiveValue({
    required double small,
    required double medium,
    required double large,
  }) {
    if (isSmallScreen) return getProportionateScreenWidth(small);
    if (isMediumScreen) return getProportionateScreenWidth(medium);
    return getProportionateScreenWidth(large);
  }
}
