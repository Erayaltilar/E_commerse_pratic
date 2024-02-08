import 'package:e_commerse_pratik/feature/screens/homepage/widgets/categories.dart';
import 'package:e_commerse_pratik/feature/screens/homepage/widgets/discount_banner.dart';
import 'package:e_commerse_pratik/feature/screens/homepage/widgets/home_header.dart';
import 'package:e_commerse_pratik/feature/screens/homepage/widgets/special_offer.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  late GoogleMapController mapController;
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeader(),
            DiscountBanner(),
            Categories(),
            SpecialOffers(),
          ],
        ),
      ),
    );
  }
}
