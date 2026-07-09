import 'package:flutter/material.dart';

extension ResponsiveContext on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  bool get isMobile => width < 720;
  bool get isTablet => width >= 720 && width < 1100;
  bool get isDesktop => width >= 1100;

  /// Max content container width (8-pt aligned)
  double get maxContentWidth {
    if (isMobile) return width;
    if (isTablet) return 960;
    return 1280;
  }

  /// Horizontal page padding — mobile-first, 8-pt system
  EdgeInsets get pagePadding => EdgeInsets.symmetric(
    horizontal: isMobile ? 24 : (isTablet ? 48 : 64),
  );

  /// Section vertical rhythm
  double get sectionSpacing => isMobile ? 80 : 120;

  double get sectionPaddingV => isMobile ? 64 : 96;
}
