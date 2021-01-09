import 'package:flutter/material.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/widgets/next_buttton.dart';

class Education extends StatefulWidget {
  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Container(
                child: TextField(),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: NextButtons(

                  onPressed: (){},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
