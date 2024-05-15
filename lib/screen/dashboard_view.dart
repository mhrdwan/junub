import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:junub/constants.dart';
import 'package:junub/screen/Al-Quran/menu1.dart';
import 'package:junub/screen/menu2.dart';
import 'package:junub/screen/Doa/main.dart';
import 'package:junub/screen/Wudu/main.dart';

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
          MaterialPageRoute(builder: (context) => const MainDoa()),
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

  List<Widget> createContainerList(BuildContext context) {
    List<Widget> containerList = [];
    for (int i = 0; i < 3; i++) {
      containerList.add(
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green[600],
                borderRadius: BorderRadius.circular(20),
              ),
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 8,
              child: const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text('data'),
                    // Text('data'),
                    // Text('data'),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    return containerList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "ini hari tanggal bulan tahun",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(20),
                ),
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 6,
              ),
            ),
            const SizedBox(height: 30),
            // Grid view of menu items
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
                          child: const Center(
                            child: Icon(
                              Icons.mosque, // Contoh menggunakan ikon bintang
                              color: Colors.white, // Warna ikon
                              size: 24, // Ukuran ikon
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(index == 0
                            ? "Al-Qur'an"
                            : (index == 1 ? "Do'a-Doa" : "Menu ${index + 1}")),
                      ],
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                'Tugas Kamu',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...createContainerList(context),
          ],
        ),
      ),
    );
  }
}
