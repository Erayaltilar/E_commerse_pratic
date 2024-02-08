import 'package:e_commerse_pratik/core/consts/color/color_consts.dart';
import 'package:e_commerse_pratik/core/consts/image/image_path.dart';
import 'package:e_commerse_pratik/core/consts/size/size.dart';
import 'package:e_commerse_pratik/core/consts/style/text_styles.dart';
import 'package:e_commerse_pratik/core/enums/text_font_enum.dart';
import 'package:e_commerse_pratik/core/widgets/custom_button.dart';
import 'package:e_commerse_pratik/core/widgets/custom_input_field_widget.dart';
import 'package:e_commerse_pratik/core/widgets/custom_topbar_widget.dart';
import 'package:e_commerse_pratik/core/widgets/views/custom_view.dart';
import 'package:e_commerse_pratik/feature/auth/forgotpassword/view/forgot_password_view.dart';
import 'package:e_commerse_pratik/feature/auth/login/viewmodel/login_vm.dart';
import 'package:e_commerse_pratik/feature/auth/signup/signup_view.dart';
import 'package:e_commerse_pratik/feature/auth/signup/widgets/social_card.dart';
import 'package:e_commerse_pratik/feature/screens/body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  final LoginVM? viewModel;
  static String routeName = "/login";
  const LoginView({super.key, this.viewModel});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginVM? viewModel;

  @override
  void didUpdateWidget(covariant LoginView oldWidget) {
    super.didUpdateWidget(oldWidget);

    viewModel = widget.viewModel;
  }

  @override
  void initState() {
    super.initState();
    viewModel = widget.viewModel;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return CustomView(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: ProjectSizes.xxxsmall),
          const TopBarWidget(topbarTitle: "Login", isBackButton: true),
          SizedBox(height: ProjectSizes.xxxsmall),
          ListTile(
            title: const Text(
              "Register Account",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              "Sign in with your email and password  \nor continue with social media",
              style: ProjectTextStyles.get(
                  font: TextFont.small,
                  weight: TextWeight.regular,
                  color: ProjectColors.kSecondaryColor),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: ProjectSizes.xsmall),
          CustomTextField(
            fillColor: Colors.transparent,
            controller: email,
            hintText: "Email",
            prefixIconPath: ImagePath.email.path,
            fontSize: TextFont.small,
            textInputAction: TextInputAction.next,
          ),
          CustomTextField(
            fillColor: Colors.transparent,
            controller: password,
            hintText: "Password",
            prefixIconPath: ImagePath.lock.path,
            fontSize: TextFont.small,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: ProjectSizes.xxxsmall),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              const Text("Remeber Me"),
              SizedBox(
                width: ProjectSizes.xsmall,
              ),
              InkWell(
                child: const Text("Forgot Password"),
                onTap: () =>
                    Navigator.pushNamed(context, ForgotPasswordView.routeName),
              ),
            ],
          ),
          SizedBox(height: ProjectSizes.xxxsmall),
          SizedBox(
            height: ProjectSizes.xsmall,
            child: DefaultButton(
              text: "Login",
              press: () {
                if (email.text == "admin" && password.text == "admin") {
                  Navigator.pushNamed(context, BodyView.routeName);
                } else {
                  print("Hatalı giriş");
                }
              },
            ),
          ),
          SizedBox(height: ProjectSizes.xsmall),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialCard(
                icon: ImagePath.google.path,
                press: () {},
              ),
              SocialCard(
                icon: ImagePath.facebook.path,
                press: () {},
              ),
              SocialCard(
                icon: ImagePath.twitter.path,
                press: () {},
              ),
            ],
          ),
          SizedBox(height: ProjectSizes.xxxsmall),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account ? "),
              SizedBox(
                width: ProjectSizes.xxxsmall,
              ),
              InkWell(
                child: TextButton(
                    child: const Text("Sign in"),
                    onPressed: () =>
                        Navigator.pushNamed(context, SignupView.routeName)),
              )
            ],
          )
        ],
      ),
    ));
  }
}
