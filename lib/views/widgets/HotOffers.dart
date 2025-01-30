import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotOffers extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'Name': 'redragon_mouse',
      'Image':
          'https://www.redragonzone.com/cdn/shop/products/M908_grande-1_450x450.png?v=1559726657',
      'specs': ['fps7200', 'wireless', 'buttons8'],
      'Price': '820'
    },
    {
      'Name': 'redragon_mouse',
      'Image':
          'https://www.redragonzone.com/cdn/shop/files/RedragonK1INGM7241KHzWiredGamingMouse_1_450x450.png?v=1723687505',
      'specs': ['fps7200', 'wireless', 'buttons8'],
      'Price': '820'
    },
    {
      'Name': 'redragon_mouse',
      'Image':
          'https://www.redragonzone.com/cdn/shop/products/M908_grande-1_450x450.png?v=1559726657',
      'specs': ['fps7200', 'wireless', 'buttons8'],
      'Price': '820'
    },
    {
      'Name': 'redragon_mouse',
      'Image':
          'https://www.redragonzone.com/cdn/shop/products/M908_grande-1_450x450.png?v=1559726657',
      'specs': ['fps7200', 'wireless', 'buttons8'],
      'Price': '820'
    },
    {
      'Name': 'redragon_mouse',
      'Image':
          'https://www.redragonzone.com/cdn/shop/products/M908_grande-1_450x450.png?v=1559726657',
      'specs': ['fps7200', 'wireless', 'buttons8'],
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
                          context.tr(product['Name']) ?? 'No Offer',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20,),
                        ...?product['specs']?.map((spec) =>
                          Row(
                            children: [
                              Text(context.tr(spec))
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
