import 'package:flutter/material.dart';
import 'package:tourism/page/route.dart';
import 'package:tourism/page/spot.dart';

import '../ui/bottom_navigation.dart';
import 'home.dart';

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  DisplayState createState() => DisplayState();
}

class DisplayState extends State<Display> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    const RoutePage(),
    const HomePage(),
    const SpotPage(),
  ];

  void navigateTo(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _selectedIndex,
        onTap: navigateTo,
      ),
    );
  }
}
