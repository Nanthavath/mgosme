import 'package:flutter/material.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/widgets/back_button.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            _cover(),
            _profile(),
            BackButtons(),
          ],
        ),
      ),
    );
  }

  _cover() {
    return Container(
      color: Colors.blue,
      height: 200,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  'https://www.eta.co.uk/wp-content/uploads/2012/09/Cycling-by-water-resized-min.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: _cameraButton(
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  _cameraButton({VoidCallback onTap}) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(right: 10, bottom: 10),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
            border: Border.all(color: Colors.white)),
        child: Icon(
          Icons.camera_alt,
        ),
      ),
      onTap: onTap,
    );
  }

  _profile() {
    return Container(
      margin: EdgeInsets.only(top: 150),
        
      color: Colors.blue,
      child: Center(
        child: Stack(
          children: [
            Container(
              color: Colors.amber,
              width: 100,
              height: 100,
            ),
            Align(
              alignment: Alignment.center,
              child: _cameraButton(),
            ),
          ],
        ),
      ),
    );
  }
}
