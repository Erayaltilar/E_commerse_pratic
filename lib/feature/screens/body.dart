import 'package:e_commerse_pratik/core/extensions/context_extension.dart';
import 'package:e_commerse_pratik/core/widgets/custom_topbar_widget.dart';
import 'package:e_commerse_pratik/core/widgets/views/custom_view.dart';
import 'package:e_commerse_pratik/feature/screens/gmap/map_view.dart';
import 'package:e_commerse_pratik/feature/screens/homepage/homepage_view.dart';
import 'package:flutter/material.dart';

class BodyView extends StatefulWidget {
  const BodyView({super.key});
  static String routeName = "/body";

  @override
  State<BodyView> createState() => _BodyViewState();
}

class _BodyViewState extends State<BodyView> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePageView(),
    const Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    const MapView(),
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomView(
        child: Column(
      children: [
        const TopBarWidget(
          isBackButton: true,
          topbarTitle: "Ana Sayfa",
        ),
        SizedBox(
            height: context.height * 0.8,
            child: _widgetOptions.elementAt(_selectedIndex)),
        BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Store',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Map',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ],
    ));
  }
}
