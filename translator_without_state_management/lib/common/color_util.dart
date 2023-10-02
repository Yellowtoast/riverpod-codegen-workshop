import 'dart:ui';

class ColorUtil {
  static const Color grayScale12 = Color.fromRGBO(12, 12, 12, 1);
  static const Color grayScale48 = Color.fromRGBO(48, 48, 48, 1);
  static const Color grayScale74 = Color.fromRGBO(74, 74, 74, 1);
  static const Color grayScale164 = Color.fromRGBO(164, 164, 164, 1);
  static const Color grayScale222 = Color.fromRGBO(222, 222, 222, 1);

  static Color grayScale(int scale) {
    return Color.fromRGBO(scale, scale, scale, 1);
  }
}
