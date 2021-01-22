import 'package:flutter/material.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/view/experiance.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/view/reviewspage.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/widgets/showdialog.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ShowalertStars {
  TextEditingController comment = TextEditingController();
  double rating = 0.0;
  ShowalertStars();
  String editcomment;

  showbottomsheetwidget({BuildContext context}) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
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
                    SizedBox(height: 15),
                    stars_giver(context: context, readonly: false, size: 40),
                    SizedBox(height: 20),
                    Container(
                      width: 300,
                      child: TextField(
                        maxLines: 5,
                        maxLength: 100,
                        controller: comment,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              // borderSide: BorderSide.none
                            ),
                            contentPadding: EdgeInsets.only(
                                right: 20, left: 20, top: 10, bottom: 10),
                            isDense: true,
                            hintText: 'ຄຳເຫັນ'),
                        onChanged: (value) {
                          editcomment = value;
                        },
                      ),
                    ),
                    //  SizedBox(height: 10),
                    Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)),
                      child: FlatButton(
                        onPressed: () {
                          if (editcomment == null || editcomment == '') {
                            CustomAlertDialogStars().alertDialog(
                                context: context,
                                icon: Icons.error_outline,
                                title: 'ຜິດຜາດ',
                                message: 'ກະລູນາຕື່ມຂໍ້ມູນ');
                          } else if (rating == 0.0) {
                            CustomAlertDialogStars().alertDialog(
                                context: context,
                                icon: Icons.error_outline,
                                title: 'ຜິດຜາດ',
                                message: 'ກະລູນາໄຫ້ດາວ');
                          } else {
                            print('count = $rating');
                            print('$editcomment');
                          }
                        },
                        child: Text(
                          'ຕົກລົງ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 390),
                  ],
                ),
              ),
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
                      print(textcommentt().textcomments(context: context));
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
