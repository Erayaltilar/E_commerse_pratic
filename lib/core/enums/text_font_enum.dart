import 'package:flutter/material.dart';

enum TextFont { title2, title1, title, headline, subtitle, body, small }

enum TextWeight {
  bold,
  semibold,
  medium,
  regular,
}

extension TextFontExtention on TextFont {
  double getValue() {
    return switch (this) {
      TextFont.title2 => 28,
      TextFont.title1 => 26,
      TextFont.title => 24,
      TextFont.headline => 22,
      TextFont.subtitle => 20,
      TextFont.body => 18,
      TextFont.small => 14,
    };
  }
}

extension TextWeightExtention on TextWeight {
  FontWeight get value {
    return switch (this) {
      TextWeight.bold => FontWeight.w700,
      TextWeight.semibold => FontWeight.w600,
      TextWeight.medium => FontWeight.w500,
      TextWeight.regular => FontWeight.w400,
    };
  }
}
