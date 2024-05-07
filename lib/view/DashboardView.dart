import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Mandi Junub",
        style: TextStyle(color: Colors.black, fontSize: 15),
      ),
    );
  }
}
