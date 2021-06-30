import 'package:catalogapp/home/catalog_item.dart';
import 'package:catalogapp/model/catalog.dart';
import 'package:catalogapp/pages/details.dart';
import 'package:flutter/material.dart';

class CatalogList extends StatelessWidget {
  CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Details(catalog: catalog))),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}
