import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_dialog/flutter_progress_dialog.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/profile_page.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/view/about.dart';
import 'package:mgosme/pages/logins/switch_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        return ProgressDialog(
          child: MaterialApp(
            theme: ThemeData(
              fontFamily: 'NotoSansLao',
            ),
            title: 'Mgo',
            //home: CreateJob(),
            home: Profiles(),
            //home: More(),
            //home: UserHomePage(),
          ),
        );
      },
    );
  }
}
