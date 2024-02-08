import 'package:e_commerse_pratik/core/consts/image/image_path.dart';
import 'package:e_commerse_pratik/feature/screens/homepage/widgets/icn_button_with_counter.dart';
import 'package:e_commerse_pratik/feature/screens/homepage/widgets/search_field.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SearchField(),
        IconBtnWithCounter(svgSrc: ImagePath.cart.path, press: () {}),
        IconBtnWithCounter(
          svgSrc: ImagePath.bill.path,
          numOfitem: 3,
          press: () {},
        ),
      ],
    );
  }
}
