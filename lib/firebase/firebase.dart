import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
class NewUser {
  final String uid;
  NewUser({@required this.uid});
}
class AuthBase {
  NewUser _userFromFirebase(User user) {
    return NewUser(uid: user.uid);
  }

  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final authResult = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(authResult.user);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      final authResult = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(authResult.user);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return;
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}