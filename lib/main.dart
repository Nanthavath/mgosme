import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_dialog/flutter_progress_dialog.dart';
import 'package:mgosme/pages/logins/switch_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
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
            home: SwitchPage(),
            //home: More(),
            //home: UserHomePage(),
          ),
        );
      },
    );
  }
}

