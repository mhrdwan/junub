import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Menu1 extends StatefulWidget {
  const Menu1({super.key});

  @override
  State<Menu1> createState() => _Menu1State();
}

class _Menu1State extends State<Menu1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Halaman Menu 1",
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
