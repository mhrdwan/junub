import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:junub/models/detail_persurah.dart';
import 'package:junub/models/surah_quran.dart';

class DetailSurah extends StatefulWidget {
  final Surah surah;
  const DetailSurah({super.key, required this.surah});

  @override
  State<DetailSurah> createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  bool loading = true; // State untuk menunjukkan loading
  detailSuratModel? detailSurat; // Variabel untuk menyimpan detail surat

  @override
  void getDataSurah() async {
    try {
      var response = await Dio()
          .get('https://equran.id/api/v2/surat/${widget.surah.nomor}');
      // Parsing data dari API ke model detailSuratModel
      detailSurat = detailSuratModel.fromJson(response.data);
      setState(() {
        loading = false; // Set loading menjadi false setelah data dimuat
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getDataSurah(); // Memanggil method getDataSurah saat init state
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.surah.namaLatin),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Menggunakan data detailSurat untuk menampilkan informasi
                  Text(detailSurat?.data.nama ?? '',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(detailSurat?.data.namaLatin ?? '',
                      style: TextStyle(fontSize: 18)),
                  Text("Jumlah Ayat: ${detailSurat?.data.jumlahAyat ?? ''}"),
                  // Menampilkan teks dan terjemahan ayat jika ada
                  Expanded(
                    child: ListView.builder(
                      itemCount: detailSurat?.data.ayat.length ?? 0,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                              detailSurat?.data.ayat[index].teksArab ?? ''),
                          subtitle: Text(
                              detailSurat?.data.ayat[index].teksIndonesia ??
                                  ''),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
