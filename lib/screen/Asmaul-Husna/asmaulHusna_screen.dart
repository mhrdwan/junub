import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:junub/models/AsmaulHusna/AsmaulHusndaModel.dart';

class AsmaulHusnaScreen extends StatefulWidget {
  const AsmaulHusnaScreen({super.key});

  @override
  State<AsmaulHusnaScreen> createState() => _AsmaulHusnaScreenState();
}

AsmaulHusnaModel? stateAsmaulHusna;

class _AsmaulHusnaScreenState extends State<AsmaulHusnaScreen> {
  void getData() async {
    try {
      var response = await Dio().get('https://api.myquran.com/v2/husna/semua');
      setState(() {
        stateAsmaulHusna = AsmaulHusnaModel.fromJson(response.data);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asmaul Husna'),
      ),
      body: stateAsmaulHusna == null
          ? Center(child: CircleAvatar())
          : ListView.builder(
              itemCount: stateAsmaulHusna?.data?.length,
              itemBuilder: (context, index) {
                final stateAsmaulHusnass = stateAsmaulHusna!.data![index];
                return ListTile(
                  title: Text(
                      '${stateAsmaulHusnass.id}. ${stateAsmaulHusnass?.latin} ${stateAsmaulHusnass?.arab}'),
                  subtitle: Text(' ${stateAsmaulHusnass?.indo}'),
                );
              }),
    );
  }
}
