import 'package:ecommerce_shop/Widgets/ProductCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotOffers extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'Name': 'Redragon Mouse',
      'Image':
          'https://www.redragonzone.com/cdn/shop/products/M908_grande-1_450x450.png?v=1559726657'
    },
    {
      'Name': 'Redragon Mouse',
      'Image':
          'https://www.redragonzone.com/cdn/shop/files/RedragonK1INGM7241KHzWiredGamingMouse_1_450x450.png?v=1723687505'
    },
    {
      'Name': 'Redragon Mouse',
      'Image':
          'https://www.redragonzone.com/cdn/shop/files/M991-RGB-1_450x450.png?v=1686365390'
    },
    {
      'Name': 'Redragon Mouse',
      'Image':
          'https://www.redragonzone.com/cdn/shop/files/M991-RGB-1_450x450.png?v=1686365390'
    },
    {
      'Name': 'Redragon Mouse',
      'Image':
          'https://www.redragonzone.com/cdn/shop/files/M991-RGB-1_450x450.png?v=1686365390'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text('Hot Offers', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal, // make it scrollable horizontally
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ProductCard(
                      name: product['Name']!,
                      img: product['Image']!,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
