import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_shop/views/widgets/ProductCard.dart';
import 'package:flutter/material.dart';

class ProductDisplay extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'Name': 'redragon_mouse',
      'Image':
          'https://www.redragonzone.com/cdn/shop/products/M908_grande-1_450x450.png?v=1559726657'
    },
    {
      'Name': 'redragon_mouse',
      'Image':
          'https://www.redragonzone.com/cdn/shop/files/RedragonK1INGM7241KHzWiredGamingMouse_1_450x450.png?v=1723687505'
    },
    {
      'Name': 'redragon_mouse',
      'Image':
          'https://www.redragonzone.com/cdn/shop/files/M991-RGB-1_450x450.png?v=1686365390'
    },
    {
      'Name': 'redragon_mouse',
      'Image':
          'https://www.redragonzone.com/cdn/shop/files/M991-RGB-1_450x450.png?v=1686365390'
    },
    {
      'Name': 'redragon_mouse',
      'Image':
          'https://www.redragonzone.com/cdn/shop/files/M991-RGB-1_450x450.png?v=1686365390'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            context.tr('our_products'),
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.065,
                fontWeight: FontWeight
                    .bold), // calculate the font size depending on the screen size
          ),
        ),
        Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing:
                        12), // adjust number of cardds in each row and space between rows and columns
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                      name: product['Name']!.tr(), img: product['Image']!);
                }))
      ],
    );
  }
}
