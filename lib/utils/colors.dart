import 'dart:ui';

class TBColor {
  TBColor._();
  static _TBAppColor app = _TBAppColor();
  static _TBAppBarColor appBar = _TBAppBarColor();
  static _TBButtonColor button = _TBButtonColor();
  static _TBRatingColor rating = _TBRatingColor();
  static _TBAlertColor alert = _TBAlertColor();
  static _TBCardColor card = _TBCardColor();
  static _TBTextInputColor textInput = _TBTextInputColor();
  static _TBPickeListColor pickerList = _TBPickeListColor();
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

class _TBAlertColor {
  final red = const Color(0xFFDA0000);
  final lightRed = const Color(0xFFFAD1D1);
  final green = const Color(0xFF18B815);
  final lightGreen = const Color(0xFFD1FADF);
}

class _TBCardColor {
  final red = const Color(0XFFE33434);
  final green = const Color(0XFF43C16E);
  final black = const Color(0xFF121212);
  final lightBlue = const Color(0xFF34A4E3);
  final border = const Color(0xFFF3F3F3);
}

class _TBTextInputColor {
  final grey = const Color(0xFF7B828A);
  final black = const Color(0xFF181E25);
  final purple = const Color(0xFF7E44F8);
  final red = const Color(0xFFFF4242);
  final disabledFillColor = const Color(0xFFF3F4F8);
  final lightGrey = const Color(0xFFC9D2DE);
  final lightBlue = const Color(0xFF34A4E3);
}

class _TBPickeListColor {
  final black = const Color(0xFF181E25);
  final lightBlue = const Color(0xFF34A4E3);
  final grey = const Color(0xFF8C8C8C);
  final selectedItemBackground = const Color(0xFFE1F4FF);
}
