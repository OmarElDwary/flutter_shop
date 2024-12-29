import 'package:ecommerce_shop/Widgets/ProductCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotOffers extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'Name': 'Redragon Mouse',
      'Image':
          'https://www.redragonzone.com/cdn/shop/products/M908_grande-1_450x450.png?v=1559726657',
      'Specs': ['7200 FPS, Wireless, 8 buttons'],
      'Price': '820'
    },
    {
      'Name': 'Redragon Mouse',
      'Image':
          'https://www.redragonzone.com/cdn/shop/files/RedragonK1INGM7241KHzWiredGamingMouse_1_450x450.png?v=1723687505',
      'Specs': ['7200 FPS, Wireless, 8 buttons'],
      'Price': '820'
    },
    {
      'Name': 'Redragon Mouse',
      'Image':
          'https://www.redragonzone.com/cdn/shop/products/M908_grande-1_450x450.png?v=1559726657',
      'Specs': ['7200 FPS, Wireless, 8 buttons'],
      'Price': '820'
    },
    {
      'Name': 'Redragon Mouse',
      'Image':
          'https://www.redragonzone.com/cdn/shop/products/M908_grande-1_450x450.png?v=1559726657',
      'Specs': ['7200 FPS, Wireless, 8 buttons'],
      'Price': '820'
    },
    {
      'Name': 'Redragon Mouse',
      'Image':
          'https://www.redragonzone.com/cdn/shop/products/M908_grande-1_450x450.png?v=1559726657',
      'Specs': ['7200 FPS, Wireless, 8 buttons'],
      'Price': '820'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          itemCount: products.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 7),
              child: Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height /3,
                    child: Image.network(
                      product['Image'] ??
                          'https://www.redragonzone.com/cdn/shop/products/M908_grande-1_450x450.png?v=1559726657',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height /3,
                      child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Text(
                          product['Name'] ?? 'No Offer',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20,),
                        ...?product['Specs']?.map((spec) =>
                          Column(
                            children: [
                              Text(spec)
                            ],
                          )
                        )
                      ],
                    ),
                  ))
                ],
              ),
            );
          }),
    );
  }
}
