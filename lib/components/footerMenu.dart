// lib/footer_menu.dart

import 'package:flutter/material.dart';

class FooterMenu extends StatelessWidget {
  final Function(int) onTap;

  FooterMenu({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: onTap,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Kalender',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notif',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Setting',
        ),
      ],
    );
  }
}
