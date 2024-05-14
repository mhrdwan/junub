import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:junub/api/JadwalSholat/getJadwalSholatHarian.dart';
import 'package:junub/models/JadwalSholat/ListSemuaKota/ListSholatHarian.dart';
import 'package:junub/screen/Al-Quran/menu1.dart';
import 'package:junub/screen/Asmaul-Husna/asmaulHusna_screen.dart';
import 'package:junub/screen/Waktu-Sholat/waktu_sholat_screen.dart';
import 'package:junub/screen/hadist/hadist_screen.dart';
import 'package:junub/screen/menu2.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

ListSholatHarian? listSholatHarian;

class _DashboardViewState extends State<DashboardView> {
  String getFormattedDate() {
    DateTime now = DateTime.now();
    return DateFormat('EEEE, dd MMMM yyyy  ').format(now);
  }

  List<dynamic> listJson = [];
  bool isLoading = true;
  void fetchSholatData() async {
    var data = await getSholat();
    print(data);
    setState(() {
      listSholatHarian = ListSholatHarian.fromJson(data);
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchSholatData();
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
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HadistScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WaktuSholat()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AsmaulHusnaScreen()),
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
    for (int i = 0; i < 5; i++) {
      containerList.add(
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black)),
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 8,
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          15), // Adjust the radius as needed
                      child: Image.asset(
                        'assets/icons/sejadah.jpg',
                        fit: BoxFit.cover,
                        height: 50, // Adjust the height as needed
                        width: 50, // Adjust the width as needed
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 16,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sholat 5 Waktu"),
                        Text("Progres"),
                        Text("1/5")
                      ],
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    const Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_circle_right),
                        ],
                      ),
                    )
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
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     listSholatHarian?.jadwal.tanggal ?? "",
      //     style: const TextStyle(
      //         color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
      //   ),
      // ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 6,
                      child: Stack(
                        children: [
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Dzuhur",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  listSholatHarian?.jadwal.dzuhur ?? "",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                // SizedBox(
                                //   height: 8,
                                // ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.location_on),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      "${listSholatHarian?.daerah.toString() ?? "loading"}, ${listSholatHarian?.lokasi.toString() ?? "loading"}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
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
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Center(
                                    child: index == 0
                                        ? Image.asset(
                                            'assets/icons/alquran.png',
                                            fit: BoxFit.cover,
                                          )
                                        : (index == 1
                                            ? Image.asset(
                                                'assets/icons/tanganDoa.jpg',
                                                fit: BoxFit.cover,
                                              )
                                            : (index == 3
                                                ? Image.asset(
                                                    'assets/icons/sejadah.jpg',
                                                    scale: 0.1,
                                                    fit: BoxFit.cover,
                                                  )
                                                : (index == 4
                                                    ? Image.asset(
                                                        'assets/icons/allah.jpg',
                                                        scale: 0.1,
                                                        fit: BoxFit.cover)
                                                    : (index == 2
                                                        ? Image.asset(
                                                            'assets/icons/hadist.jpg',
                                                            scale: 0.1,
                                                            fit: BoxFit.cover)
                                                        : const Icon(
                                                            Icons
                                                                .mosque, // Contoh menggunakan ikon bintang
                                                            color: Colors
                                                                .white, // Warna ikon
                                                            size:
                                                                24, // Ukuran ikon
                                                          )))))),
                              ),
                              const SizedBox(height: 8),
                              Text(index == 0
                                  ? "Al-Qur'an"
                                  : (index == 1
                                      ? "Do'a-Doa"
                                      : (index == 2
                                          ? "Hadis't"
                                          : (index == 3
                                              ? "Waktu Sholat"
                                              : (index == 4
                                                  ? "Asmaul"
                                                  : "Menu ${index + 1}"))))),
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
