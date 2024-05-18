import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:junub/models/Hadist/hadist_model.dart';
import 'package:junub/screen/hadist/detailHadist_screen.dart';

class HadistScreen extends StatefulWidget {
  const HadistScreen({super.key});

  @override
  State<HadistScreen> createState() => _HadistScreenState();
}

class _HadistScreenState extends State<HadistScreen> {
  ModelHadist? hadistData;

  void getDataHadist() async {
    try {
      var response = await Dio().get('https://api.hadith.gading.dev/books');
      // Deserialisasi data menggunakan factory dari ModelHadist
      setState(() {
        hadistData = ModelHadist.fromJson(response.data);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getDataHadist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Hadist'),
      ),
      body: hadistData == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: hadistData!.data?.length ?? 0,
              itemBuilder: (context, index) {
                final hadist = hadistData!.data![index];
                return ListTile(
                  title: Text(hadist.name ?? 'Unknown'),
                  subtitle: Text('Total: ${hadist.available} Hadist'),
                  onTap: () {
                    print('klik');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailHadist(detailHadist: hadist),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
