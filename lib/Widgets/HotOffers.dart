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
        child: Column(children: [
          Text('Hot Offers',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
          Column(
            children: products.map((product) {
              return Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image.network(
                      product['Image']!,
                      width: 50,
                      height: 50,
                    ),
                    Spacer(),
                    Text(product['Name']!)
                  ],
                ),
              );
            }).toList(),
          )
        ]));
  }
}
