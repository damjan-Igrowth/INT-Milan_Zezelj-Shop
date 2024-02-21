class TBDimensions {
  TBDimensions._();
  static _TBButtonDimensions button = _TBButtonDimensions();
  static _TBAppDimensions app = _TBAppDimensions();
  static _TBIconDimensions icon = _TBIconDimensions();
  static _TBSectionDimensions section = _TBSectionDimensions();
  static _TBRatingDimensions rating = _TBRatingDimensions();
  static _TBAppBarDimensions appBar = _TBAppBarDimensions();
  static _TBCardDimensions card = _TBCardDimensions();
  static _TBAlertDimensions alert = _TBAlertDimensions();
  static _TBGaleryDimensions galery = _TBGaleryDimensions();
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

class _TBSectionDimensions {
  final titlePadding = 12.0;
}

class _TBRatingDimensions {
  final gapSize = 2.0;
  final size = 15.0;
}

class _TBAppBarDimensions {
  final iconSize = 32.0;
  final borderRadius = 12.0;
  final titleFontSize = 20.0;
  final specialTitleFontSize = 23.33;
}

class _TBAlertDimensions {
  final iconSize = 24.0;
  final contentPadding = 16.0;
  final titlePadding = 12.0;
  final borderRadius = 16.0;
}

class _TBCardDimensions {
  final contentPadding = 16.0;
  final contentHeaderPadding = 16.0;
  final borderRadius = 12.0;
}

class _TBGaleryDimensions {
  final viewportFraction = 0.9;
  final imagePadding = 8.0;
  final imageBorderRadius = 16.0;
  final verticalPadding = 20.0;
}
