import 'package:e_commerse_pratik/core/consts/color/color_consts.dart';
import 'package:e_commerse_pratik/core/consts/size/size.dart';
import 'package:e_commerse_pratik/core/consts/style/text_styles.dart';
import 'package:e_commerse_pratik/core/enums/text_font_enum.dart';
import 'package:flutter/material.dart';

class ForgotPasswordListTile extends StatefulWidget {
  final String title;
  final String subtitle;
  const ForgotPasswordListTile(
      {super.key, required this.title, required this.subtitle});

  @override
  State<ForgotPasswordListTile> createState() => _ForgotPasswordListTileState();
}

class _ForgotPasswordListTileState extends State<ForgotPasswordListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: EdgeInsets.only(bottom: ProjectSizes.xxxsmall),
        child: Text(
          widget.title,
          style: ProjectTextStyles.get(
            color: ProjectColors.kTextColor,
            font: TextFont.title,
            weight: TextWeight.medium,
          ),
        ),
      ),
      contentPadding: EdgeInsets.zero,
      subtitle: Text(
        widget.subtitle,
        style: ProjectTextStyles.get(
            font: TextFont.subtitle,
            color: ProjectColors.kTextColor,
            weight: TextWeight.regular),
      ),
    );
  }
}
