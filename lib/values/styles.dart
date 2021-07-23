part of 'values.dart';

class Styles {


  static TextStyle customTextStyle({
    Color color = AppColors.primaryColor,
    FontWeight fontWeight = FontWeight.w600,
    double fontSize = Sizes.TEXT_SIZE_14,
    FontStyle fontStyle: FontStyle.normal,
  }) {
    return GoogleFonts.bebasNeue(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }

  static TextStyle customTextStyle2({
    Color color = AppColors.secondaryColor,
    FontWeight fontWeight = FontWeight.w600,
    double fontSize = Sizes.TEXT_SIZE_16,
    FontStyle fontStyle: FontStyle.normal,
  }) {
    return GoogleFonts.bebasNeue(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }

  static TextStyle customTextStyle3({
    Color color = AppColors.secondaryColor,
    FontWeight fontWeight = FontWeight.w600,
    double fontSize = Sizes.TEXT_SIZE_16,
    FontStyle fontStyle: FontStyle.normal,
  }) {
    return GoogleFonts.dancingScript(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }

  static TextStyle customTextStyle4({
    Color color = AppColors.secondaryColor,
    FontWeight fontWeight = FontWeight.w600,
    double fontSize = Sizes.TEXT_SIZE_16,
    FontStyle fontStyle: FontStyle.normal,
  }) {
    return GoogleFonts.notoSerif(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }
}
