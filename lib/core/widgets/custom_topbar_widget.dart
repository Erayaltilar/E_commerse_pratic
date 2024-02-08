import 'package:e_commerse_pratik/core/consts/color/color_consts.dart';
import 'package:e_commerse_pratik/core/consts/style/text_styles.dart';
import 'package:e_commerse_pratik/core/enums/text_font_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_commerse_pratik/core/consts/image/image_path.dart';
import 'package:sizer/sizer.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget(
      {super.key, this.onTap, this.topbarTitle, this.isBackButton});
  final Function? onTap;
  final String? topbarTitle;
  final bool? isBackButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap == null) {
          Navigator.pop(context);
        } else {
          onTap!.call();
        }
      },
      child: Row(
        children: [
          isBackButton != null && isBackButton!
              ? SvgPicture.asset(
                  ImagePathExtension(ImagePath.prev).path,
                )
              : Container(),
          SizedBox(
            width: 17.h,
          ),
          Expanded(
            child: Text(
              topbarTitle != null ? topbarTitle! : "",
              style: ProjectTextStyles.get(
                  font: TextFont.body, color: ProjectColors.kSecondaryColor),
            ),
          )
        ],
      ),
    );
  }
}
