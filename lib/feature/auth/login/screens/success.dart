import 'package:e_commerse_pratik/core/widgets/custom_topbar_widget.dart';
import 'package:e_commerse_pratik/core/widgets/views/custom_view.dart';
import 'package:flutter/material.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomView(
      child: Column(
        children: [
          TopBarWidget(topbarTitle: "Success", isBackButton: true),
        ],
      ),
    );
  }
}
