class TBDimensions {
  TBDimensions._();
  static _TBButtonDimensions button = _TBButtonDimensions();
  static _TBAppDimensions app = _TBAppDimensions();
  static _TBIconDimensions icon = _TBIconDimensions();
  static _TBSectionDimensions section = _TBSectionDimensions();
  static _TBRatingDimensions rating = _TBRatingDimensions();
  static _TBAppBarDimensions appBar = _TBAppBarDimensions();
  static _TBPickerListDimensions pickerList = _TBPickerListDimensions();
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

class _TBPickerListDimensions {
  final borderRadius = 16.0;
  final headerPadding = 20.0;
  final iconSize = 20.0;
  final itemContentSpacing = 20.0;
  final itemContentHorizontalPadding = 20.0;
  final itemContentVerticalPadding = 16.0;
}
