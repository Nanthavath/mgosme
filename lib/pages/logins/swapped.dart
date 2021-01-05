import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mgosme/pages/home/home_page.dart';

import 'login_page.dart';

class Swapped extends StatefulWidget {
  @override
  _SwappedState createState() => _SwappedState();
}

User currentUser;

class _SwappedState extends State<Swapped> {
  @override
  void initState() {
    currentUser = FirebaseAuth.instance.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUser != null) {
      return HomePage();
    }
    return LoginPage();
  }
}

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AuthBloc, AuthState>(
//       builder: (context, state) {
//         if (state is AuthInitialState) {
//           return Scaffold(
//             body: Center(
//               child: Text('Loading...'),
//             ),
//           );
//         } else if (state is AuthenticatedState) {
//           return HomePage();
//         } else if (state is UnAuthenticatedState) {
//           return LoginPage();
//         }
//         return LoginPage();
//       },
//     );
//   }
// }
