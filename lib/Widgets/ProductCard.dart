import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String img;
  const ProductCard({required this.name, required this.img});

  void _addToCart(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        '$name added to your cart',
        style: TextStyle(
            color: Colors.blueAccent,
            fontSize: MediaQuery.of(context).size.width * 0.038),
      ),
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView(
        children: [
          Image.network(
            img,
            // calculate the dimensions based on the screen size
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width / 10,
          ),
          Row(
            children: [
              Text(
                context.tr(name),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.042),
              ),
              Spacer(),
              IconButton(
                  onPressed: () => _addToCart(context),
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.blueAccent,
                  ))
            ],
          )
        ],
      ),
    );
    ;
  }
}
