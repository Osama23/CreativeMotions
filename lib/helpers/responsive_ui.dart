
class ResponsiveWidget{

  static bool isScreenLarge(double width, double pixel) {
    return width * pixel >= 1080;
  }

  static bool isScreenMedium(double width, double pixel) {
    return width * pixel < 1080 && width * pixel >=720;
  }

  static bool isScreenSmall(double width, double pixel) {
    return width * pixel <= 720;
  }
}