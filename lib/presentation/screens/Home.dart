import 'package:flutter/material.dart';
import 'package:odc_day_one/presentation/views/HomeWidget.dart';
import 'package:odc_day_one/presentation/views/News_Widget.dart';
import 'package:odc_day_one/presentation/views/SettingsWidget.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetsList = [
      HomeWidget(),
      const NewsCardItem(),
      const SettingsWidget(),
    ];
    return SafeArea(
      child: Scaffold(
        body: widgetsList[_currentIndex],
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: (index) => setState(() => _currentIndex = index),

          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              activeColor: Colors.deepOrange,
              inactiveColor: Colors.grey,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.newspaper),
              title: const Text('News'),
              activeColor: Colors.deepOrange,
              inactiveColor: Colors.grey,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              
              icon: const Icon(Icons.settings),
              title: const Text('Settings'),
              activeColor: Colors.deepOrange,
              inactiveColor: Colors.grey,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
