import 'package:flutter/material.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/view/experiance.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/view/reviewpage.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ShowalertStars {
  double rating = 0.0;
  ShowalertStars();
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
