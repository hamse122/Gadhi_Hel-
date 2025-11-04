import 'package:flutter/material.dart';
import '../main.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key, required this.currentIndex, required this.onTap});
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      backgroundColor: Colors.white,
      indicatorColor: GaadhiHelApp.primaryColor.withOpacity(0.08),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.comment_outlined), selectedIcon: Icon(Icons.comment), label: 'About'),
        NavigationDestination(icon: Icon(Icons.place_outlined), selectedIcon: Icon(Icons.place), label: 'Map'),
        NavigationDestination(icon: Icon(Icons.directions_car_outlined), selectedIcon: Icon(Icons.directions_car), label: 'Find ride'),
        NavigationDestination(icon: Icon(Icons.contact_page_outlined), selectedIcon: Icon(Icons.contact_page), label: 'Contact'),
      ],
    );
  }
}

