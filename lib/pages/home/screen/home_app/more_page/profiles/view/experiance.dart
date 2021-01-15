import 'package:flutter/material.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/widgets/popup_menu.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/widgets/stars_give.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Experiancepage extends StatefulWidget {
  @override
  _ExperiancepageState createState() => _ExperiancepageState();
}

class _ExperiancepageState extends State<Experiancepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text(
              'page2',
              style: TextStyle(fontSize: 50),
            )
          ],
        ),
      ),
    );
  }
}
