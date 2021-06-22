class CatalogModel {
  static final items = [
    Item(
        id: "Product001",
        name: 'iPhone 12 Pro',
        desc: 'Apple iPhone 12th generation',
        price: 999,
        color: "#33505a",
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc'),
    Item(
        id: "Product002",
        name: 'Xiomi MI 11i 5G Pro',
        desc: 'Xiomi Android 12th generation',
        price: 999,
        color: "#33505a",
        image:
            'https://au.etoren.com/upload/images/0.36786500_1621660693_xiaomi-mi-11i-5g-dual-sim-256gb-white-8gb-ram.jpg'),
    Item(
        id: "Product003",
        name: 'Nokia A1 Pro',
        desc: 'Apple Nokia 12th generation',
        price: 999,
        color: "#33505a",
        image:
            'https://img.gkbcdn.com/s3/p/2019-03-07/nokia-9-pureview-5-99-inch-6gb-128gb-smartphone-blue-1571988977587.jpg'),
    Item(
        id: "Product004",
        name: 'Samsung note 11 Pro',
        desc: 'Android 12th generation',
        price: 999,
        color: "#33505a",
        image:
            'https://img1.ibay.com.mv/is1/full/2021/05/item_3353112_289.jpg'),
  ];
}

class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });
}
