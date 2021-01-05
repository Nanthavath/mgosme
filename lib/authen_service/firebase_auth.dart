import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  ///Sign With Email Account
  Future<String> signInWithEmail(String email, String password) async {
    try {
      UserCredential credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user.uid;
    } on FirebaseAuthException catch (e) {
      if (e.message == 'user-not-found') {
        return ('User not found');
      } else {
        return ('wrong password');
      }
    }
  }

  ///Create Account with email and password
  Future<User> createAccountWithEmail(String email, String password) async {
    try {
      UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseException catch (ex) {
      print(ex);
      return null;
    }
  }

  ///SignIn With Mobile Number
  // Future<User> signUpWithNumberPhone(String phone, BuildContext context) async {
  //   User userId;
  //   TextEditingController pinController = TextEditingController();
  //   await _firebaseAuth.verifyPhoneNumber(
  //     phoneNumber: phone,
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       // var result = await _firebaseAuth.signInWithCredential(credential);
  //       // User user = result.user;
  //     },
  //     verificationFailed: (FirebaseException exception) {
  //       print(exception);
  //     },
  //     codeSent: (String verificationId, int resentToken) {
  //       showDialog(
  //         context: context,
  //         builder: (context) {
  //           return AlertDialog(
  //             title: Text(
  //               'ລະຫັດ OTP',
  //             ),
  //             content: Container(
  //               height: 100,
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.stretch,
  //                 children: [
  //                   TextField(
  //                     controller: pinController,
  //                     decoration:
  //                         InputDecoration(isDense: true, hintText: 'ລະຫັດ PIN'),
  //                   ),
  //                   SizedBox(
  //                     height: 10,
  //                   ),
  //                   RaisedButton(
  //                     color: Colors.blue,
  //                     child:
  //                         Text('ສົ່ງ', style: TextStyle(color: Colors.white)),
  //                     onPressed: () async {
  //                       var smsCode = pinController.text;
  //                       PhoneAuthCredential phoneAuthCredential =
  //                           PhoneAuthProvider.credential(
  //                               verificationId: verificationId,
  //                               smsCode: smsCode);
  //                       var result = await _firebaseAuth
  //                           .signInWithCredential(phoneAuthCredential);
  //                       userId = result.user;

  //                       if (userId != null) {
  //                         Navigator.of(context).push(
  //                           CupertinoPageRoute(
  //                             builder: (context) => PasswordPage(),
  //                           ),
  //                         );
  //                       }
  //                     },
  //                   )
  //                 ],
  //               ),
  //             ),
  //           );
  //         },
  //       );
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  //   return userId;
  // }

  /// SignIn With Google account

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return _firebaseAuth.signInWithCredential(credential);
  }

  ///verifyPhoneNumber

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<User> getUser() async {
    User user = await _firebaseAuth.currentUser;
    return user;
  }
}
