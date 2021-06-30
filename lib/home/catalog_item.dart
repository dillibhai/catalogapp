import 'package:catalogapp/home/catalog_image.dart';
import 'package:catalogapp/model/cart.dart';
import 'package:catalogapp/model/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(context.accentColor).make(),
              catalog.desc.text.make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  AddToCart(catalog: catalog),
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          final _catalog = CatalogModel();
          final _cart = CartModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            context.theme.buttonColor,
          ),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isInCart ? Icon(Icons.done) : "Add to Cart".text.make(),
    );
  }
}
