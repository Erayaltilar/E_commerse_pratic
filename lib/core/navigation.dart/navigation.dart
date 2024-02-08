import 'package:e_commerse_pratik/feature/auth/forgotpassword/view/forgot_password_view.dart';
import 'package:e_commerse_pratik/feature/auth/login/screens/login_view.dart';
import 'package:e_commerse_pratik/feature/auth/signup/signup_view.dart';
import 'package:e_commerse_pratik/feature/screens/body.dart';
import 'package:e_commerse_pratik/feature/onboard/onboard_view.dart';
import 'package:flutter/widgets.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  OnBoardView.routeName: (context) => OnBoardView(),
  SignupView.routeName: (context) => const SignupView(),
  LoginView.routeName: (context) => const LoginView(),
  ForgotPasswordView.routeName: (context) => ForgotPasswordView(),
  BodyView.routeName: (context) => const BodyView(),
};
