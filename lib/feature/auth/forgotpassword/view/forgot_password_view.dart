import 'package:e_commerse_pratik/core/base/views/base_view.dart';
import 'package:e_commerse_pratik/core/consts/size/size.dart';
import 'package:e_commerse_pratik/core/widgets/custom_button.dart';
import 'package:e_commerse_pratik/core/widgets/custom_topbar_widget.dart';
import 'package:e_commerse_pratik/core/widgets/views/custom_view.dart';
import 'package:e_commerse_pratik/feature/auth/login/screens/login_view.dart';
import 'package:flutter/material.dart';

import '../viewmodel/forgot_password_vm.dart';

class ForgotPasswordView extends StatelessWidget {
  static String routeName = "/forgotPassword";
  ForgotPasswordView({super.key});

  final List<String> buttonTitles = ["Kodu Gönder", "Doğrula", "Değiştir"];

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
    return CustomView(
      child: SizedBox.expand(
        child: Column(
          children: [
            const TopBarWidget(isBackButton: true),
            Expanded(
              child: PageView.builder(
                controller: viewModel.pageController,
                itemCount: viewModel.pages.length,
                onPageChanged: (index) {
                  viewModel.currentPage = index;
                },
                itemBuilder: (context, index) {
                  return viewModel.pages[index];
                },
              ),
            ),
            DefaultButton(
              press: () {
                FocusScope.of(context).unfocus();
                switch (viewModel.currentPage.toInt()) {
                  case 0:
                    viewModel.pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                    break;
                  case 1:
                    viewModel.pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                    break;
                  case 2:
                    /* viewModel.pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease); */
                    if (viewModel.isMatched) {
                      print("Password Matched");
                      Navigator.pushNamed(context, LoginView.routeName);
                    } else {
                      print("Password Not Matched");
                    }
                    break;
                }
              },
              text: buttonTitles[viewModel.currentPage.toInt()],
            ),
            SizedBox(height: SpaceType.xxsmall.value),
          ],
        ),
      ),
    );
  }
}
