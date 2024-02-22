import 'dart:ui';

class TBColor {
  TBColor._();
  static _TBAppColor app = _TBAppColor();
  static _TBAppBarColor appBar = _TBAppBarColor();
  static _TBButtonColor button = _TBButtonColor();
  static _TBRatingColor rating = _TBRatingColor();
  static _TBTextInputColor textInput = _TBTextInputColor();
}

class _TBAppBarColor {
  final greenGradientColor = Color(0xFF2AE0B1);
  final blueGradientColor = Color(0xFF048FF1);
}

class _TBAppColor {
  final lightBlue = Color(0xFF34A4E3);
  final lightBlueGrey = Color(0xFFC9D2DE);
  final grey = Color(0xFF7B828A);
  final backgroundColor = Color(0xFFF8F8F8);
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

class _TBTextInputColor {
  final grey = const Color(0xFF7B828A);
  final black = const Color(0xFF181E25);
  final purple = const Color(0xFF7E44F8);
  final red = const Color(0xFFFF4242);
  final disabledFillColor = const Color(0xFFF3F4F8);
  final lightGrey = const Color(0xFFC9D2DE);
}
