import 'package:flutter/material.dart';
import 'package:junub/widget/header.dart';
import 'package:junub/widget/doa_list.dart';

class MainDoa extends StatefulWidget {
  const MainDoa({Key? key}) : super(key: key);

  @override
  _MainDoaState createState() => _MainDoaState();
}

class _MainDoaState extends State<MainDoa> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(title: 'Doa', appBar: AppBar()),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Categories'),
              Tab(text: 'MyDua'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // Search form
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            labelText: 'Cari Doa',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      // DoaList
                      Center(child: Text('Category content')),
                    ],
                  ),
                ), // Categories content
                Center(child: Text('MyDua content')), // MyDua content
              ],
            ),
          ),
        ],
      ),
    );
  }
}
