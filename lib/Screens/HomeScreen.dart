import 'package:ecommerce_shop/Widgets/HotOffers.dart';
import 'package:ecommerce_shop/Widgets/ProductsDisplay.dart';
import 'package:ecommerce_shop/Widgets/ProductsSlider.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          title: Text(
            'Techno Shop',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                child: ProductsSlider(),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                child: ProductDisplay(),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: HotOffers(),
              )
            ],
          ),),
        ),
      ),
    );
  }
}
