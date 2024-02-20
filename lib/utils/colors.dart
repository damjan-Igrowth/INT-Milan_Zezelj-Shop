import 'dart:ui';

class TBColor {
  TBColor._();

  static _TBAppColor app = _TBAppColor();
  static _TBButtonColor button = _TBButtonColor();
  static _TBRatingColor rating = _TBRatingColor();
}

class _TBAppColor {
  final lightBlue = const Color(0xFF34A4E3);
  final lightBlueGrey = const Color(0xFFC9D2DE);
  final grey = const Color(0xFF7B828A);
}

class _TBButtonColor {
  final borderColor = const Color(0xFFCFCFCF);
}

class _TBRatingColor {
  final yellow = const Color(0xFFFFC046);
  final grey = const Color(0xFFC0C0C0);
  final gradientColors = [
    const Color(0xFFFFC046),
    const Color(0xFFFFC046),
    const Color(0xFFC0C0C0)
  ];
}
