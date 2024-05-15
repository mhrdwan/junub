import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppBar appBar;

  const Header({Key? key, required this.title, required this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.green
          ], // Ubah warna gradient sesuai keinginan Anda
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: AppBar(
        title: Text(title),
        backgroundColor:
            Colors.transparent, // Gunakan warna transparan untuk AppBar
        elevation: 0, // Hilangkan bayangan AppBar
        actions: <Widget>[
          // Add any actions you want in the app bar
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
