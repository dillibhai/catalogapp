import 'package:catalogapp/model/catalog.dart';

class CartModel {
  late CatalogModel _catalog;

  final List<String> _itemIds = [];
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

//get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

//get total price
  num get totalPricce =>
      items.fold(0, (total, current) => total + current.price);

  //add item
  void add(Item item) {
    _itemIds.add(item.id);
  }
//add item

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
