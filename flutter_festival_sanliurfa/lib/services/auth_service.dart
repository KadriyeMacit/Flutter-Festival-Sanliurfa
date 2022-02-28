import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmail(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return user.user;
  }

  signOut() async {
    return await _auth.signOut();
  }

  Future<User?> createPerson(
    String email,
    String password,
  ) async {
    var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);

    return user.user;
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
