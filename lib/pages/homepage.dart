import 'dart:convert';
import 'package:catalogapp/home/catalog-header.dart';
import 'package:catalogapp/home/catalog_list.dart';
import 'package:catalogapp/model/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: Vx.m32,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CatalogHeader(),
          // ignore: unnecessary_null_comparison
          if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            CatalogList().expand()
          else
            Center(
              child: CircularProgressIndicator().centered().centered(),
            ),
          // "Catalog App".text.xl4.bold.color(MyTheme.darkBluishColor).make(),
          // "Trending products".text.xl.make(),
        ]),
      ),
    )
        //   padding: const EdgeInsets.all(16.0),
        //   child: ListView.builder(
        //     itemCount: CatalogModel.items.length,
        //     itemBuilder: (context, index) {
        //       return ItemWidget(
        //         item: CatalogModel.items[index],
        //       );
        //     },
        //   ),
        // ),
        // drawer: MyDrawer(),
        );
  }
}



