import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:junub/view/menu1.dart';
import 'package:junub/view/menu2.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  List<dynamic> listJson = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // getData();
  }

  // void getData() async {
  //   try {
  //     var response = await Dio().get('https://fakestoreapi.com/products');
  //     print(response);
  //     setState(() {
  //       listJson = response.data;
  //       isLoading = false;
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  void onBoxTap(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Menu1()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Menu2()),
        );
        break;
      default:
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Screen belum ada"),
              content: Text("Screen untuk Menu ${index + 1} belum ada."),
              actions: <Widget>[
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Rabu , 5-8-2024",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(20),
                ),
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 6,
              ),
              SizedBox(height: 30),
              // Grid view of menu items
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: List.generate(8, (index) {
                    return GestureDetector(
                      onTap: () => onBoxTap(index),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(index == 0 ? "Al-Qur'an" : "Menu ${index + 1}"),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
