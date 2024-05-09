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
  bool loading = true;
  DetailSurahResponse? detailSurah;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    getDataSurah();
  }

  void getDataSurah() async {
    try {
      var response = await Dio()
          .get('https://equran.id/api/v2/surat/${widget.surah.nomor}');
      print(response.data);
      setState(() {
        loading = false;
        detailSurah = DetailSurahResponse.fromJson(response.data);
      });
    } catch (e) {
      print(e);
      setState(() {
        loading = false;
        errorMessage = e.toString();
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.surah.namaLatin}'),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(
                  child: Text(
                    "Error loading data: $errorMessage",
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (detailSurah != null) ...[
                        if (detailSurah!.data != null) ...[
                          Text(
                              "Nama Surah: ${detailSurah!.data!.nama} || ${widget.surah.namaLatin}",
                              style: TextStyle(fontSize: 18)),
                          Text("Arti: ${detailSurah!.data!.arti}",
                              style: TextStyle(fontSize: 18)),
                          Text("Jumlah Ayat: ${detailSurah!.data!.jumlahAyat}",
                              style: TextStyle(fontSize: 18)),
                          if (detailSurah!.data!.ayat != null &&
                              detailSurah!.data!.ayat!.isNotEmpty)
                            Expanded(
                              child: ListView.builder(
                                itemCount: detailSurah!.data!.ayat!.length,
                                itemBuilder: (context, index) {
                                  final ayah = detailSurah!.data!.ayat![index];
                                  return ListTile(
                                    title: Text(
                                      ayah.teksArab ??
                                          'Teks Arab tidak tersedia',
                                      style: TextStyle(fontSize: 16),
                                      textAlign: TextAlign.right,
                                    ),
                                    subtitle: Text(
                                      ayah.teksIndonesia ??
                                          'Teks Indonesia tidak tersedia',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  );
                                },
                              ),
                            ),
                        ]
                      ] else
                        Text("Data tidak tersedia",
                            style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
    );
  }
}
