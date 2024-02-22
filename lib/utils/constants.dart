class TBDimensions {
  TBDimensions._();
  static _TBButtonDimensions button = _TBButtonDimensions();
  static _TBAppDimensions app = _TBAppDimensions();
  static _TBIconDimensions icon = _TBIconDimensions();
  static _TBSectionDimensions section = _TBSectionDimensions();
  static _TBRatingDimensions rating = _TBRatingDimensions();
  static _TBAppBarDimensions appBar = _TBAppBarDimensions();
  static _TBProductCardDimensions productCard = _TBProductCardDimensions();
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

class _TBProductCardDimensions {
  final contentPadding = 12.0;
  final borderRadius = 12.0;
  final imageBorderWidth = 1.0;
  final imageBorderRadius = 8.0;
  final imageSize = 79.0;
  final circularIndicatorSize = 20.0;
  final circularIndicatorWidth = 3.0;
}
