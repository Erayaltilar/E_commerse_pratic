import 'package:e_commerse_pratik/core/consts/color/color_consts.dart';
import 'package:e_commerse_pratik/core/enums/text_font_enum.dart';
import 'package:flutter/material.dart';

String family = 'Montserrat';

class ProjectTextStyles {
  static TextStyle get({
    required TextFont font,
    Color? color,
    double? height,
    TextDecoration? decoration,
    TextWeight? weight = TextWeight.bold,
  }) =>
      TextStyle(
        color: color ?? ProjectColors.kPrimaryColor,
        fontSize: font.getValue(),
        fontFamily: family,
        height: height,
        fontWeight: weight!.value,
        decoration: decoration,
        decorationColor: color,
      );
}
