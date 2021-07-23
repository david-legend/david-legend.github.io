part of values;

class Gradients {
  static const Gradient primaryGradient = RadialGradient(
    center: Alignment.centerRight,
//    focalRadius: 1.0,
    radius: 1.0,
    colors: [
      AppColors.accentColor,
      AppColors.primaryColor,
    ],
  );

  static const Gradient try1 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    stops: [0.5, 1.0],
    colors: [
      Color(0xFF43cea2),
      Color(0xFF185a9d),
    ],
  );

  static const Gradient try2 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    stops: [0.5, 1.0],
    colors: [
      Color(0xFFc33764),
      Color(0xFF1d2671),
    ],
  );
}
