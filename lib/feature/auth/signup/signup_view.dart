import 'package:e_commerse_pratik/core/consts/color/color_consts.dart';
import 'package:e_commerse_pratik/core/consts/image/image_path.dart';
import 'package:e_commerse_pratik/core/consts/size/size.dart';
import 'package:e_commerse_pratik/core/consts/style/text_styles.dart';
import 'package:e_commerse_pratik/core/enums/text_font_enum.dart';
import 'package:e_commerse_pratik/core/widgets/custom_button.dart';
import 'package:e_commerse_pratik/core/widgets/custom_input_field_widget.dart';
import 'package:e_commerse_pratik/core/widgets/custom_topbar_widget.dart';
import 'package:e_commerse_pratik/core/widgets/views/custom_view.dart';
import 'package:e_commerse_pratik/feature/auth/signup/widgets/social_card.dart';
import 'package:e_commerse_pratik/feature/screens/body.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SignupView extends StatefulWidget {
  static String routeName = "/signup";

  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController name = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController adress = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomView(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 2.h),
              const TopBarWidget(
                isBackButton: true,
                topbarTitle: "Sign up",
              ),
              SizedBox(height: 2.h),
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
                  "Complete your details \nor continue with social media",
                  style: ProjectTextStyles.get(
                      font: TextFont.small,
                      weight: TextWeight.regular,
                      color: ProjectColors.kSecondaryColor),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 4.h),
              Column(
                children: [
                  CustomTextField(
                    fillColor: Colors.transparent,
                    controller: name,
                    hintText: "Email",
                    fontSize: TextFont.small,
                    textInputAction: TextInputAction.next,
                  ),
                  CustomTextField(
                    fillColor: Colors.transparent,
                    controller: lastName,
                    hintText: "Password",
                    fontSize: TextFont.small,
                    textInputAction: TextInputAction.next,
                  ),
                  CustomTextField(
                    fillColor: Colors.transparent,
                    controller: phoneNumber,
                    hintText: "Re-enter Password",
                    fontSize: TextFont.small,
                    textInputAction: TextInputAction.next,
                  ),
                ],
              ),
              SizedBox(height: ProjectSizes.xxxsmall),
              SizedBox(
                height: ProjectSizes.xsmall,
                child: DefaultButton(
                  text: "Continue",
                  press: () {
                    Navigator.pushNamed(context, BodyView.routeName);
                  },
                ),
              ),
              SizedBox(height: ProjectSizes.xsmall),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: ImagePath.facebook.path,
                    press: () {},
                  ),
                  SocialCard(
                    icon: ImagePath.google.path,
                    press: () {},
                  ),
                  SocialCard(
                    icon: ImagePath.twitter.path,
                    press: () {},
                  ),
                ],
              ),
              SizedBox(height: ProjectSizes.xxsmall),
              Text(
                "Forgot Password",
                style: ProjectTextStyles.get(
                    font: TextFont.small,
                    weight: TextWeight.regular,
                    color: ProjectColors.kSecondaryColor),
              ),
              Text(
                "By continuing your confirm that you agree \nwith our Term and Condition",
                style: ProjectTextStyles.get(
                    font: TextFont.small,
                    weight: TextWeight.regular,
                    color: ProjectColors.kSecondaryColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
