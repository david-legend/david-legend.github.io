part of values;

class Borders {
  static const BorderSide defaultPrimaryBorder =
      BorderSide(width: Sizes.WIDTH_0, style: BorderStyle.none);

  static const InputBorder defaultInputBorder  = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(Sizes.RADIUS_0)),
    borderSide: BorderSide(
      color: AppColors.white,
      width: 0.0,
      style: BorderStyle.none,
    ),
  );

  static customOutlineInputBorder({
    double borderRadius = Sizes.RADIUS_12,
    Color color = AppColors.grey,
    double width = Sizes.WIDTH_1,
    BorderStyle style = BorderStyle.solid,
  }) {

    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      borderSide: BorderSide(
        color: color,
        width: width,
        style: style,
      ),
    );
  }

  static customUnderlineInputBorder({
    Color color = AppColors.grey,
    double width = Sizes.WIDTH_1,
    BorderStyle style = BorderStyle.solid,
  }) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: width,
        style: style,
      ),
    );
  }
}
