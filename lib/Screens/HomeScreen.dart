import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_shop/Widgets/HotOffers.dart';
import 'package:ecommerce_shop/Widgets/ProductsDisplay.dart';
import 'package:ecommerce_shop/Widgets/ProductsSlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Locale currentLocale = Locale('en');
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          actions: [
            IconButton(onPressed: () {
              if (context.locale == Locale('en')) {
                context.setLocale(Locale('ar'));
                currentLocale = Locale('ar');
              } else {
                context.setLocale(Locale('en'));
                currentLocale = Locale('en');
              }
            }, icon: Icon(Icons.language))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: ProductsSlider(),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ProductDisplay(),
              ),
              SizedBox(height: 10),
              Text(context.tr('hot_offers'), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: HotOffers(),
              )
            ],
          ),),
        ).animate().fadeIn(duration: 4.seconds)
    );
  }
}
