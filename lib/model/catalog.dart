import 'dart:convert';

class CatalogModel {
  static List<Item> items = [
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

  Item copyWith({
    String? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      price: map['price'],
      color: map['color'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }

  static formMap(item) {}

  // static formMap(item) {}
}
