import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:junub/models/Doa/doa_category.dart';
import 'package:junub/widget/Card/card_featured.dart';

class DoaListCategories extends StatefulWidget {
  const DoaListCategories({Key? key}) : super(key: key);

  @override
  _DoaListCategoriesState createState() => _DoaListCategoriesState();
}

class _DoaListCategoriesState extends State<DoaListCategories> {
  List<DoaCategory> _categories = [];

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    final String response =
        await rootBundle.loadString('lib/data/doa_categories.json');
    final List<dynamic> data = jsonDecode(response);
    setState(() {
      _categories = data.map((json) => DoaCategory.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('List of Prayer Categories'),
      ),
      body: _categories.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _getCrossAxisCount(screenWidth),
                childAspectRatio: _getChildAspectRatio(screenWidth),
              ),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                return CardFeatured(
                  title: category.title,
                  description: 'Total: ${category.count} doa',
                  actionFunction: () {},
                  widthFactor:
                      1.0, // Faktor lebar diatur ke 1.0 karena GridView akan menangani lebar
                );
              },
            ),
    );
  }

  int _getCrossAxisCount(double screenWidth) {
    if (screenWidth < 600) {
      return 2; // Untuk layar yang lebih kecil, gunakan dua kolom
    } else if (screenWidth < 900) {
      return 3; // Untuk layar yang sedang, gunakan tiga kolom
    } else {
      return 4; // Untuk layar yang lebih besar, gunakan empat kolom
    }
  }

  double _getChildAspectRatio(double screenWidth) {
    // Rasio aspek child bisa disesuaikan sesuai kebutuhan.
    // Misalnya, jika tinggi card tetap, kita bisa mengatur rasio aspek berdasarkan lebar.
    if (screenWidth < 600) {
      return (screenWidth / 2) / 200; // Dua kolom
    } else if (screenWidth < 900) {
      return (screenWidth / 3) / 200; // Tiga kolom
    } else {
      return (screenWidth / 4) / 200; // Empat kolom
    }
  }
}
