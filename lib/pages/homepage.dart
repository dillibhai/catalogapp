import 'package:catalogapp/model/catalog.dart';
import 'package:catalogapp/widget/drawer.dart';
import 'package:catalogapp/widget/item-widget.dart';
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
        body: ListView.builder(
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: CatalogModel.items[index],
              );
            }));
  }
}
