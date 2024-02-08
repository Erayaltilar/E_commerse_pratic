import 'package:e_commerse_pratik/core/base/views/base_view.dart';
import 'package:e_commerse_pratik/core/consts/image/image_path.dart';
import 'package:e_commerse_pratik/core/consts/size/size.dart';
import 'package:e_commerse_pratik/core/widgets/custom_input_field_widget.dart';
import 'package:e_commerse_pratik/feature/auth/forgotpassword/viewmodel/forgot_password_vm.dart';
import 'package:e_commerse_pratik/feature/auth/forgotpassword/widget/forgot_password_text_widget.dart';
import 'package:flutter/material.dart';

class FPNewPassword extends StatefulWidget {
  const FPNewPassword({super.key});

  @override
  State<FPNewPassword> createState() => _FPNewPasswordState();
}

class _FPNewPasswordState extends State<FPNewPassword> {
  final TextEditingController controller = TextEditingController();

  final TextEditingController controller2 = TextEditingController();

  final String title = "Yeni Şifre";

  final String subtitle =
      "Aşşağıdaki alanları doldurarak yeni şifrenizi belirleyebilirsiniz";

  final String hintText = "Şifre";

  final String hintText2 = "Şifre Tekrar";

  @override
  Widget build(BuildContext context) {
    return BaseView(
      vmBuilder: (context) => ForgotPasswordVm(),
      builder: (context, viewModel) {
        return _buildScreen(context, viewModel);
      },
    );
  }

  Widget _buildScreen(BuildContext context, ForgotPasswordVm viewModel) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ForgotPasswordListTile(title: title, subtitle: subtitle),
          SizedBox(height: SpaceType.xxsmall.value),
          CustomTextField(
            controller: controller,
            prefixIconPath: ImagePath.lock.path,
            hintText: hintText,
            fillColor: Colors.transparent,
            width: ProjectSizes.long,
            suffixIcon: Icons.remove_red_eye_outlined,
          ),
          CustomTextField(
            controller: controller2,
            prefixIconPath: ImagePath.lock.path,
            hintText: hintText2,
            width: ProjectSizes.long,
            fillColor: Colors.transparent,
            suffixIcon: Icons.remove_red_eye_outlined,
            onChanged: (value) {
              if (controller.text == controller2.text) {
                viewModel.isMatched = true;
                print("Şifreler eşleşti");
                print(viewModel.isMatched);
              } else {
                viewModel.isMatched = false;
                print("Şifreler eşleşmedi");
              }
            },
          ),
        ],
      ),
    );
  }
}
