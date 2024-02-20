import 'dart:ui';

class TBColor {
  TBColor._();
  static _TBAppColor app = _TBAppColor();
  static _TBAppBarColor appBar = _TBAppBarColor();
  static _TBButtonColor button = _TBButtonColor();
}

class _TBAppBarColor {
  final greenGradientColor = Color.fromRGBO(42, 244, 177, 1);
  final blueGradientColor = Color.fromRGBO(4, 143, 241, 1);
}

class _TBAppColor {
  final lightBlue = Color(0xFF34A4E3);
  final lightBlueGrey = Color(0xFFC9D2DE);
  final grey = Color(0xFF7B828A);
  final backgroundColor = Color(0xFFF8F8F8);
}

class _TBButtonColor {
  final borderColor = Color(0xFFCFCFCF);
}
