import 'package:flutter/material.dart';

class Menu2 extends StatefulWidget {
  const Menu2({super.key});

  @override
  State<Menu2> createState() => _Menu2State();
}

class _Menu2State extends State<Menu2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Halaman Menu 2",
        ),
      ),
      body: Center(
        child: Center(
          child: Text('Menu 2'),
        ),
      ),
    );
  }
}
