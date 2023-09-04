import 'package:firebase_auth/firebase_auth.dart';

class FireBase {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<dynamic> SignUp(
      String email, String password, String user_name) async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await auth.currentUser!.updateDisplayName(user_name);
      await auth.currentUser!.reload();
      if (user.user != null) {
        return user.user;
      }
    } on FirebaseException catch (e) {
      if (e.code == "email-already-in-use") {
        return "Email Already Used";
      } else if (e.code == "invalid-email") {
        return "Invalid Email";
      } else if (e.code == "weak-password") {
        return "Weak Password";
      }
    }
  }

  Future<dynamic> SignIn(String email, String password) async {
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (user.user != null) {
        return user.user;
      }
    } on FirebaseException catch (e) {
      return e.message;
      // if (e.code == "email-already-in-use") {
      //   return "Email Already Used";
      // } else if (e.code == "invalid-email") {
      //   return "Invalid Email";
      // } else if (e.code == "weak-password") {
      //   return "Weak Password";
      // }
    }
  }

  Future<void> SignOut() async {
    await auth.signOut();
  }
}
