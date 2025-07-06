
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<String> signupUserAsEmployee({
    required String email,
    required String password,
    required String name,
    required String gender,
    required String phone,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          name.isNotEmpty &&
          gender.isNotEmpty &&
          phone.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        await _firestore.collection("users").doc(cred.user!.uid).set({
          'name': name,
          'uid': cred.user!.uid,
          'email': email,
          'gender': gender,
          'phone': phone,
          'type': 'employee',
        });

        res = "success";
      } else {
        res = "Please fill in all fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  static Future<String> signupUserAsCompany({
    required String email,
    required String password,
    required String companyName,
    required String phone,
    required String linkedin,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          companyName.isNotEmpty &&
          phone.isNotEmpty &&
          linkedin.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        await FirebaseFirestore.instance
            .collection('companies')
            .doc(cred.user!.uid)
            .set({
          'companyName': companyName,
          'email': email,
          'linkedin': linkedin,
          'uid': cred.user!.uid,
          'createdAt': FieldValue.serverTimestamp(),
          'type': 'company',
        });

        res = "success";
      } else {
        res = "Please fill in all fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  static Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Future<String> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return 'Sign in aborted';
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
      await _auth.signInWithCredential(credential);

      final User? user = userCredential.user;

      if (user != null) {
        final userDoc =
        await _firestore.collection('users').doc(user.uid).get();

        if (!userDoc.exists) {
          await _firestore.collection("users").doc(user.uid).set({
            'name': user.displayName ?? '',
            'email': user.email ?? '',
            'uid': user.uid,
            'photoUrl': user.photoURL ?? '',
            'provider': 'google',
          });
        }

        return "success";
      } else {
        return "Something went wrong";
      }
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Authentication error";
    } catch (e) {
      return e.toString();
    }
  }


}
