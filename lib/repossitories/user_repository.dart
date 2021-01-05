import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  FirebaseAuth firebaseAuth;
  UserRepository() {
    this.firebaseAuth = FirebaseAuth.instance;
  }
  Future<User> createUser(String email, String password) async {
    try {
      var result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseException catch (exception) {
      throw Exception(exception.toString());
    }
  }

  Future<UserCredential> signInUser(String email, String password) async {
    var result = firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return result;
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<bool> isSignedIn() async {
    var currentUser = firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<User> getCurrentUser() async {
    return firebaseAuth.currentUser;
  }
}
