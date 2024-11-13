import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[

        BottomNavigationBarItem(
          icon: Icon(Icons.manage_search),
          label: 'Log',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.key),
          label: 'Key',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Theme.of(context).disabledColor,
      onTap: onTap,
    );
  }
}
