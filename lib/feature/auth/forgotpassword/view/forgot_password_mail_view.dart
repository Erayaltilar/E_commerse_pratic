import 'package:e_commerse_pratik/core/consts/image/image_path.dart';
import 'package:e_commerse_pratik/core/consts/size/size.dart';
import 'package:e_commerse_pratik/core/enums/text_font_enum.dart';
import 'package:e_commerse_pratik/core/widgets/custom_input_field_widget.dart';
import 'package:e_commerse_pratik/feature/auth/forgotpassword/viewmodel/forgot_password_vm.dart';
import 'package:e_commerse_pratik/feature/auth/forgotpassword/widget/forgot_password_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FPEmail extends StatelessWidget {
  FPEmail({super.key});
  final TextEditingController controller = TextEditingController();
  final String forgotPasswordText = "Email";
  final String title = "Şifremi Unuttum";
  final String subtitle =
      "Şifrenizi yenilemek için gereken doğrulama kodunu göndereceğimiz e-posta adresinizi aşşağıdaki alana giriniz.";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ForgotPasswordListTile(title: title, subtitle: subtitle),
          SizedBox(height: SpaceType.xxsmall.value),
          SizedBox(
            height: SpaceType.small.value,
            child: CustomTextField(
              fillColor: Colors.transparent,
              controller: context.read<ForgotPasswordVm>().emailController,
              hintText: forgotPasswordText,
              prefixIconPath: ImagePath.email.path,
              fontSize: TextFont.small,
            ),
          ),
        ],
      ),
    );
  }
}
