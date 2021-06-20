import 'package:catalogapp/widget/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Catalog app', style: TextStyle(color: Colors.black)),
      ),
      drawer: MyDrawer(),
      body: Center(child: Text('home page')),
    );
  }
}
