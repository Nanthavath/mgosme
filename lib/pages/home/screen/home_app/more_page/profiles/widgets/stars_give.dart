import 'package:flutter/material.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/view/experiance.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/view/reviewpage.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ShowalertStars {
  double rating = 0.0;
  ShowalertStars();
  showbottomsheetwidget({BuildContext context}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            // height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit_outlined, size: 30),
                    SizedBox(width: 10),
                    Text("ແກ້ໄຂ", style: TextStyle(fontSize: 25)),
                  ],
                ),
                SizedBox(height: 30),
                ShowalertStars()
                    .stars_giver(context: context, readonly: false, size: 50),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey)),
                        contentPadding: EdgeInsets.only(right: 20, left: 20),
                        hintText: 'ຄຳເຫັນ'),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30)),
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'ຕົກລົງ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  showstars({BuildContext context}) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Column(
                children: [
                  Text(
                    'ໄຫ້ຄະແນນ!',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  stars_giver(context: context, readonly: false, size: 40)
                ],
              ),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('ຍົກເລີກ'),
                  ),
                  FlatButton(
                    onPressed: ({String value}) {
                      print('count = $rating');
                      print(textcomment().textcomments(context: context));
                    },
                    child: Text('ຕົກລົງ'),
                  ),
                ],
              ),
            ));
  }

  stars_giver({BuildContext context, bool readonly, double size}) {
    return Container(
      child: SmoothStarRating(
        color: Colors.yellow,
        borderColor: Colors.yellow,
        starCount: 5,
        isReadOnly: readonly,
        size: size,
        spacing: 0.0,
        rating: rating,
        onRated: (value) {
          rating = value;
        },
      ),
    );
  }

  stars_const(
      {BuildContext context, bool readonly, double size, double ratingstars}) {
    return Container(
      child: SmoothStarRating(
        color: Colors.yellow,
        borderColor: Colors.yellow,
        starCount: 5,
        isReadOnly: readonly,
        size: size,
        spacing: 0.0,
        rating: ratingstars,
      ),
    );
  }
}
