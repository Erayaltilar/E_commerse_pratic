import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

enum SpaceType {
  none,
  xxxsmall,
  xxsmall,
  xsmall,
  small,
  medium,
  long,
}

extension SpaceTypeExtension on SpaceType {
  double get value {
    return switch (this) {
      SpaceType.long => 50.h,
      SpaceType.medium => 45.h,
      SpaceType.small => 15.h,
      SpaceType.xsmall => 7.h,
      SpaceType.xxsmall => 5.h,
      SpaceType.xxxsmall => 2.5.h,
      SpaceType.none => 0,
    };
  }
}

EdgeInsets getSpaceSymmetric(SpaceType horizontal, SpaceType vertical) {
  double horizontalValue = horizontal.value;
  double verticalValue = vertical.value;
  return EdgeInsets.symmetric(
      horizontal: horizontalValue, vertical: verticalValue);
}

class ProjectSizes {
  static double long = 50.h;
  static double medium = 45.h;
  static double small = 15.h;
  static double xsmall = 7.h;
  static double xxsmall = 5.h;
  static double xxxsmall = 2.5.h;

  static EdgeInsets get screenEdgeInsets =>
      EdgeInsets.symmetric(horizontal: xxxsmall, vertical: 0);

  static EdgeInsets get xsmallEdgeInsets =>
      EdgeInsets.symmetric(vertical: xsmall, horizontal: xsmall);

  static EdgeInsets get xxxsmallEdgeInsets =>
      EdgeInsets.symmetric(vertical: xxxsmall, horizontal: xxxsmall);
}
