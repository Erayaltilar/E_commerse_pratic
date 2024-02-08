import 'package:e_commerse_pratik/core/consts/color/color_consts.dart';
import 'package:e_commerse_pratik/core/consts/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    this.icon,
    this.press,
  }) : super(key: key);

  final String? icon;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: ProjectSizes.xxxsmall),
        padding: EdgeInsets.all(ProjectSizes.xxxsmall),
        height: ProjectSizes.xsmall,
        width: ProjectSizes.xsmall,
        decoration: const BoxDecoration(
          color: ProjectColors.kPrimaryLightColor,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          icon!,
        ),
      ),
    );
  }
}
