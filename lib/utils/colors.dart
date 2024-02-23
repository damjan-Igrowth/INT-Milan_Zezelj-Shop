import 'dart:ui';

class TBColor {
  TBColor._();
  static _TBAppColor app = _TBAppColor();
  static _TBAppBarColor appBar = _TBAppBarColor();
  static _TBButtonColor button = _TBButtonColor();
  static _TBRatingColor rating = _TBRatingColor();
  static _TBCardColor card = _TBCardColor();
}

class _TBAppBarColor {
  final greenGradientColor = const Color(0xFF2AE0B1);
  final blueGradientColor = const Color(0xFF048FF1);
}

class _TBAppColor {
  final lightBlue = const Color(0xFF34A4E3);
  final lightBlueGrey = const Color(0xFFC9D2DE);
  final grey = const Color(0xFF7B828A);
  final backgroundColor = const Color(0xFFF8F8F8);
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

class _TBCardColor {
  final red = const Color(0XFFE33434);
  final green = const Color(0XFF43C16E);
  final black = const Color(0xFF121212);
  final lightBlue = const Color(0xFF34A4E3);
}
