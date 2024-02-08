import 'package:e_commerse_pratik/core/consts/color/color_consts.dart';
import 'package:e_commerse_pratik/core/consts/image/image_path.dart';
import 'package:e_commerse_pratik/core/consts/size/size.dart';
import 'package:e_commerse_pratik/core/consts/style/text_styles.dart';
import 'package:e_commerse_pratik/core/enums/text_font_enum.dart';
import 'package:e_commerse_pratik/feature/auth/forgotpassword/viewmodel/forgot_password_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class EmailCardWidget extends StatefulWidget {
  const EmailCardWidget({super.key, required this.mail});
  final String mail;
  final changeEmailText = "Değiştir";

  @override
  State<EmailCardWidget> createState() => _EmailCardWidgetState();
}

class _EmailCardWidgetState extends State<EmailCardWidget> {
  late ForgotPasswordVm viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = context.read<ForgotPasswordVm>();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: ProjectColors.kPrimaryColor),
        ),
        child: Container(
          margin: ProjectSizes.xxxsmallEdgeInsets,
          width: ProjectSizes.long,
          child: Column(
            children: [
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    ImagePath.email.path,
                    height: TextFont.headline.getValue(),
                  ),
                  SizedBox(
                    width: 1.h,
                  ),
                  Flexible(
                    child: Text(
                      context.read<ForgotPasswordVm>().emailController.text,
                      style: ProjectTextStyles.get(
                        font: TextFont.title2,
                        weight: TextWeight.medium,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    viewModel.pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text(
                    widget.changeEmailText,
                    style: ProjectTextStyles.get(
                      color: ProjectColors.kPrimaryColor,
                      font: TextFont.headline,
                      weight: TextWeight.regular,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
