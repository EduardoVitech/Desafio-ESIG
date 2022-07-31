import 'package:flutter/material.dart';

class ButtonNavigationBarHomePage extends StatelessWidget {
  final int selectedIndex;
  final Function(int)? onItemTapped;

  const ButtonNavigationBarHomePage({
    super.key,
    required this.selectedIndex,
    this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(selectedIndex == 0 ? Icons.home : Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon:
              Icon(selectedIndex == 1 ? Icons.favorite : Icons.favorite_border),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(selectedIndex == 2 ? Icons.person : Icons.person_outline),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: const Color.fromARGB(255, 121, 15, 252),
      onTap: onItemTapped,
    );
  }
}
