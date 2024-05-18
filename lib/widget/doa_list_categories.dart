import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:junub/models/Doa/doa_category.dart';

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
    return _categories.isEmpty
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              final category = _categories[index];
              return ListTile(
                leading:
                    Icon(Icons.category), // Placeholder untuk ikon kategori
                title: Text(category.title),
                trailing: Text('${category.count}'),
              );
            },
          );
  }
}
