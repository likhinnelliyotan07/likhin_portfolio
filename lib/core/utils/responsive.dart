import 'package:flutter/material.dart';

extension ResponsiveContext on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  bool get isMobile => width < 720;
  bool get isTablet => width >= 720 && width < 1100;
  double get maxContentWidth => isMobile ? width : 1180;
  EdgeInsets get pagePadding => EdgeInsets.symmetric(
    horizontal: isMobile ? 20 : 40,
    vertical: isMobile ? 18 : 28,
  );
}
