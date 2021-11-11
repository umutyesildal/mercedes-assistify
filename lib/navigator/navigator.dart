import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:template/favoritePage/favoritePage.dart';
import 'package:template/landingPage/landingPage.dart';
import 'package:template/settingsPage/settingsPage.dart';

class MainNavigator extends StatefulWidget {
  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    LandingPage(),
    FavoritePage(),
    SettingsMain(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      extendBody: true,
      bottomNavigationBar: NavigationBar(
        activeButtonFlexFactor: 100,
        inactiveButtonsFlexFactor: 100,
        activeIconColor: Colors.white,
        inactiveIconColor: Colors.grey,
        backgroundColor: Colors.black,
        backgroundOpacity: 0.7,
        selectedIndex: _selectedIndex,
        onTabChange: _onItemTapped,
        // showActiveButtonText: false,
        navigationBarButtons: const <NavigationBarButton>[
          NavigationBarButton(
            icon: Icons.home,
            backgroundColor: Colors.transparent,
          ),
          NavigationBarButton(
            icon: Icons.favorite,
            backgroundColor: Colors.transparent,
          ),
          NavigationBarButton(
            icon: Icons.settings,
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
