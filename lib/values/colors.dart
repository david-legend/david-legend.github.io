part of values;

class AppColors {
  static const double primaryColorOpacity = 0.1;

  static const Color primaryColor = Color(0xFF0E1319);
  static const Color secondaryColor = Color(0xFFEBEBEB);
  static const Color accentColor = Color(0xFF5F6E80);
  static const Color accentColor2 = Color(0xFF000000);
  static const Color accentColor3 = Color(0xff75809C);
  static const Color complimentColor1 = Color(0xff64FFDA);
  static const Color complimentColor2 = Color(0xffCCD7F5);

//  static const Color primaryColor = Color(0xFFE19269);
//  static const Color secondaryColor = Color(0xFFFFFFFF);
//  static const Color accentColor = Color(0xFFF8F4F0);
//  static const Color accentColor2 = Color(0xFF000000);

//  static const Color primaryColor = Color(0xFF805b5f);
//  static const Color secondaryColor = Color(0xFFFee9e9);
//  static const Color accentColor = Color(0xFFF8F4F0);
//  static const Color accentColor2 = Color(0xFF000000);

  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFFD8D9DA);
  static const Color grey100 = Color(0xFFEBEBEB);
  static const Color grey200 = Color(0xFFE3E3E3);
  static const Color grey300 = Color(0xFFB6B7B9);
  static const Color grey250 = Color(0xFFCACBCD);

  static const Color grey400 = Color(0xFFBEBEBE);
  static const Color grey450 = Color(0xFFB7B8BD);

  static const Color cream = Color(0xFFEBEBEC);
  static const Color cream500 = Color(0xFFC7C9CA);
  static const Color fadedGrey = Color(0xFF7B8186);
  static const Color cream700 = Color(0xFFB5B8BC);
//  static const Color cream700 = Color(0xFFB5B8BC);

  static const Color deepBlue100 = Color(0xFF5F6E80);
  static const Color deepBlue200 = Color(0xFF546478);
  static const Color deepBlue250 = Color(0xFF566C7F);

  static const Color deepBlue450 = Color(0xFF303E48);
  static const Color deepBlue500 = Color(0xFF000B2D);
  static const Color deepBlue700 = Color(0xFF141A21);
  static const Color deepBlue800 = Color(0xFF242D36);
  static const Color deepBlue900 = Color(0xFF020A13);

  static const Color bodyText1 = Color(0xFF8393A1);

  static Color colorWithOpacity({
    Color color = AppColors.primaryColor,
    double opacity = 0.5,
  }) {
    return color.withOpacity(opacity);
  }
}
