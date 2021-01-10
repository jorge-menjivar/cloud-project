import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

class AuthenticationService {
  Future<String> signIn(
      {String email, String password, FirebaseAuth auth}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      print('Signed in');
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp(
      {String email, String password, FirebaseAuth auth}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
