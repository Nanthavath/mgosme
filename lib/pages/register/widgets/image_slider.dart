import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final List<AssetImage> img = [
    AssetImage('images/banner1.png'),
    AssetImage('images/banner1.png'),
    AssetImage('images/banner1.png'),
    AssetImage('images/banner1.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
       height: 200,
        child: Carousel(
          images: img,
          boxFit: BoxFit.contain,
          dotSize: 5.0,
          dotSpacing: 15.0,
          dotColor: Colors.white70,
          indicatorBgPadding: 5.0,
          showIndicator: true,
          dotBgColor: Colors.transparent,
        ),
      ),
    );
  }
}
