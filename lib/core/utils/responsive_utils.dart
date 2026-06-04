import 'package:flutter/material.dart';

class ResponsiveUtils {
  ResponsiveUtils._();

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double horizontalPadding(BuildContext context) {
    final width = screenWidth(context);
    if (width >= 1024) return width * 0.15;
    if (width >= 600) return 32.0;
    return 16.0;
  }

  static double categoryCardSize(BuildContext context) {
    final width = screenWidth(context);
    if (width >= 600) return 130.0;
    return 100.0;
  }

  static double productCardWidth(BuildContext context) {
    final width = screenWidth(context);
    if (width >= 600) return 200.0;
    return 160.0;
  }

  static double bannerHeight(BuildContext context) {
    final width = screenWidth(context);
    if (width >= 600) return 240.0;
    return 180.0;
  }

  static int categoryGridCount(BuildContext context) {
    final width = screenWidth(context);
    if (width >= 1024) return 6;
    if (width >= 600) return 4;
    return 3;
  }
}
