import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:junub/models/Hadist/detailHadist_model.dart';
import 'package:junub/models/Hadist/hadist_model.dart';

class DetailHadist extends StatefulWidget {
  final DatasModel detailHadist; // Change this to DatasModel
  const DetailHadist({super.key, required this.detailHadist});
  @override
  State<DetailHadist> createState() => _DetailHadistState();
}

class _DetailHadistState extends State<DetailHadist> {
  DetailHadistModel? detailHadistData;
  bool loading = false;
  void getDetailHadist() async {
    loading = true;
    try {
      String namaHadist = Uri.encodeComponent(widget.detailHadist.id!);
      var response = await Dio()
          .get('https://api.hadith.gading.dev/books/$namaHadist?range=1-50');
      print(response);
      setState(() {
        detailHadistData = DetailHadistModel.fromJson(response.data);
      });
      loading = false;
    } catch (e) {
      print(e);
      loading = false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetailHadist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.detailHadist.name!),
      ),
      body: detailHadistData == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: detailHadistData?.data?.hadiths.length,
              itemBuilder: (context, index) {
                final hadistDetails = detailHadistData!.data;
                return ListTile(
                  title: Text(hadistDetails?.hadiths[index].arab ?? "error"),
                  subtitle: Text(hadistDetails?.hadiths[index].id ?? "error"),
                  onTap: () {
                    print('klik');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         DetailHadist(detailHadist: hadist),
                    //   ),
                    // );
                  },
                );
              },
            ),
    );
  }
}
