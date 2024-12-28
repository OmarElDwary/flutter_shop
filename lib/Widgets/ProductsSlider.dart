
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsSlider extends StatelessWidget {
  // const Slider({super.key});

  final List<String> products = [
      'https://www.redragonzone.com/cdn/shop/products/M908_grande-1_450x450.png?v=1559726657',
      'https://www.redragonzone.com/cdn/shop/files/RedragonK1INGM7241KHzWiredGamingMouse_1_450x450.png?v=1723687505',
      'https://www.redragonzone.com/cdn/shop/files/M991-RGB-1_450x450.png?v=1686365390',
      'https://www.redragonzone.com/cdn/shop/files/M991-RGB-1_450x450.png?v=1686365390',
      'https://www.redragonzone.com/cdn/shop/files/M991-RGB-1_450x450.png?v=1686365390'
  ];
  @override
  Widget build(BuildContext context) {
    return PageView(
      children:
        products.map((product) {
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage(product), fit: BoxFit.cover,)
              ),
            ),
          );
        }).toList(),
    );
  }
}
