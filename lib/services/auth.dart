import 'package:firebase_auth/firebase_auth.dart';


class AuthService {

  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User> get user {
    return _auth.authStateChanges();
      
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();

      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

    // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
