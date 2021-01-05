import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BannerSlider extends StatefulWidget {
  @override
  _BannerSliderState createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final List<String> _imgList = [
    'images/banner1.png',
    'images/intro_banner.png',
    'images/mgo_logo.png',
  ];

  int _current;

  @override
  void initState() {
    _current = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: _buildBanner(),
        ),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildBanner() {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.3,
        child: CarouselSlider(
          options: CarouselOptions(
              height: 110,
              aspectRatio: 1.873,
              viewportFraction: 1.0,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          items: _imgList
              .map(
                (item) => Image.asset(
                  item,
                  fit: BoxFit.cover,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  _buildIndicator() => Positioned(
        bottom: 5,
        left: 150,
        child: Row(
          children: _imgList.map((url) {
            int index = _imgList.indexOf(url);
            return Container(
              width: 8,
              height: _current == index ? 8 : 1,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                shape: _current == index ? BoxShape.circle : BoxShape.rectangle,
                color: Colors.transparent,
              ),
            );
          }).toList(),
        ),
      );
}
