import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:junub/models/surah_quran.dart';
import 'package:junub/screen/Al-Quran/detail-surah.dart';

class Menu1 extends StatefulWidget {
  const Menu1({super.key});

  @override
  State<Menu1> createState() => _Menu1State();
}

class _Menu1State extends State<Menu1> {
  List<Surah> listSurah = [];
  bool loading = true;

  void getDataSurah() async {
    try {
      var response = await Dio().get('https://equran.id/api/v2/surat');
      List<dynamic> data = response.data['data']; // Akses array dalam 'data'
      setState(() {
        listSurah = data.map((json) => Surah.fromJson(json)).toList();
        loading = false; // Setel loading menjadi false setelah data dimuat
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getDataSurah();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yuk membaca Al-Qur'an"),
      ),
      body: !loading
          ? ListView.builder(
              itemCount: listSurah.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(listSurah[index].nama),
                  subtitle: Text(listSurah[index].namaLatin),
                  trailing: Text("Jumla: ${listSurah[index].jumlahAyat}"),
                  onTap: () {
                    print("Ini adalah surah nomor ${listSurah[index].nomor}");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailSurah(surah: listSurah[index]),
                      ),
                    );
                  },
                );
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
