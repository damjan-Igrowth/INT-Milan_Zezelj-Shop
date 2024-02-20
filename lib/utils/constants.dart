class TBDimensions {
  TBDimensions._();
  static _TBButtonDimensions button = _TBButtonDimensions();
  static _TBAppDimensions app = _TBAppDimensions();
  static _TBIconDimensions icon = _TBIconDimensions();
}

class _TBButtonDimensions {
  final borderRadius = 12.0;
  final minimumHeight = 56.0;
  final horizontalPadding = 24.0;
  final verticalPadding = 8.0;
}

class _TBAppDimensions {
  final screenMarginSize = 16.0;
  final circularIndicatorWidth = 2.0;
}

class _TBIconDimensions {
  final size = 24.0;
}

const double kButtonBorderRadius = 12.0;
const double kButtonHeight = 56.0;
const double kEdgeInsetSize = 16.0;
const double kIconSize = 24.0;
const double kCircularIndicatorWidth = 2.0;
const double kAppBarIconSize = 32.0;
const double kAppBarBorderRadius = 12.0;
const double kAppBarTitleFontSize = 20.0;
