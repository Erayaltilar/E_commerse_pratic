import 'dart:async';

import 'package:e_commerse_pratik/core/base/viewmodels/base_view_model.dart';
import 'package:e_commerse_pratik/feature/auth/forgotpassword/view/forgor_password_new_password_view.dart';
import 'package:e_commerse_pratik/feature/auth/forgotpassword/view/forgot_password_code_view.dart';
import 'package:e_commerse_pratik/feature/auth/forgotpassword/view/forgot_password_mail_view.dart';
import 'package:flutter/material.dart';

class ForgotPasswordVm extends BaseViewModel {
  final PageController pageController = PageController(keepPage: true);

  final TextEditingController emailController = TextEditingController();

  int _currentPage = 0;
  int get currentPage => _currentPage;
  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }

  bool _isMatched = false;
  bool get isMatched => _isMatched;
  set isMatched(bool value) {
    _isMatched = value;
    notifyListeners();
  }

  final List<Widget> pages = [
    FPEmail(),
    const FPCode(),
    const FPNewPassword(),
  ];

  @override
  FutureOr<void> init() {
    print("ForgotPasswordVm init");
  }
}
