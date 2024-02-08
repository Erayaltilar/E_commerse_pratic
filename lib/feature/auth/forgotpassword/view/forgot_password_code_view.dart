import 'package:e_commerse_pratik/core/consts/color/color_consts.dart';
import 'package:e_commerse_pratik/core/consts/size/size.dart';
import 'package:e_commerse_pratik/core/consts/style/text_styles.dart';
import 'package:e_commerse_pratik/core/enums/text_font_enum.dart';
import 'package:e_commerse_pratik/feature/auth/forgotpassword/widget/email_card_widget.dart';
import 'package:e_commerse_pratik/feature/auth/forgotpassword/widget/forgot_password_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

class FPCode extends StatefulWidget {
  const FPCode({super.key});

  @override
  State<FPCode> createState() => _FPCodeState();
}

class _FPCodeState extends State<FPCode> {
  final TextEditingController codeController = TextEditingController();
  final String forgotPasswordText = "Email";
  final String title = "Kodu Doğrula";
  final String subtitle =
      "E-posta adresinize gelen doğrulama kodunu aşşağıdaki alana giriniz.";
  final String mail = "eray.altilar@hotmail.com";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ForgotPasswordListTile(title: title, subtitle: subtitle),
          SizedBox(height: SpaceType.xxxsmall.value),
          EmailCardWidget(mail: mail),
          SizedBox(height: SpaceType.xxsmall.value),
          PinCodeTextField(
            appContext: context,
            controller: codeController,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            length: 4,
            keyboardType: TextInputType.number,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            textStyle: ProjectTextStyles.get(font: TextFont.title2),
            showCursor: false,
            pastedTextStyle: ProjectTextStyles.get(font: TextFont.title2),
            cursorColor: ProjectColors.kPrimaryColor,
            enableActiveFill: true,
            pinTheme: PinTheme(
              fieldWidth: 16.w,
              fieldHeight: 14.w,
              borderRadius: BorderRadius.circular(12),
              activeColor: ProjectColors.kSecondaryColor,
              disabledColor: ProjectColors.kSecondaryColor,
              shape: PinCodeFieldShape.box,
              selectedColor: ProjectColors.kPrimaryLightColor,
              inactiveColor: Colors.transparent,
              activeFillColor: Colors.transparent,
              inactiveFillColor: ProjectColors.kPrimaryLightColor,
              selectedFillColor: ProjectColors.kPrimaryLightColor,
            ),
            onChanged: (value) {
              /* if (codeController.text.length == 4) {
                verifyCodeEvent();
              } */
            },
          ),
        ],
      ),
    );
  }
}
