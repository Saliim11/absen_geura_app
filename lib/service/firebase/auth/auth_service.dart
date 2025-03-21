import 'package:absen_geura/models/user_model.dart';
import 'package:absen_geura/pages/auth_screen/widgets/warning_dialog.dart';
import 'package:absen_geura/service/encrypt/encrypt.dart';
import 'package:absen_geura/service/firebase/firestore/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      // Mulai proses sign-in
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return null; // User membatalkan login
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Buat credential dari Google token
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Login ke Firebase
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      final user = userCredential.user!;
      
      // Buat instance UserModel
      UserModel userModel = UserModel(
        uid: user.uid,
        name: user.displayName ?? '',
        email: user.email ?? '',
        password: '',
        phone: user.phoneNumber ?? '',
        city: '',
        role: 'default'
      );

      // Simpan ke Firestore
      await UserService().saveUserData(userModel);

      return user;
    } on FirebaseAuthException catch (e) {
      print('Error: ${e.message}');
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } on FirebaseAuthException catch (e){
      // hideLoadingDialog(context);
      if (e.code == 'invalid-email') {
        showWarningAuth(context, 'Benerin dulu nulis emailnya.');
      } else if (e.code == 'user-not-found') {
        showWarningAuth(context, 'yakin itu akunnya?');
      } else if (e.code == 'wrong-password') {
        showWarningAuth(context, 'Ini bukan password yg benar.');
      } else if (e.code == 'user-disabled') {
        showWarningAuth(context, 'Akun dinonaktifkan.');
      } else if (e.code == 'too-many-requests') {
        showWarningAuth(context, 'Terlaluan banyak salah pas login, nanti lagi nyobanya.');
      } else {
        showWarningAuth(context, 'Error: ${e.message}');
      }
      return null;
    }
  }

  Future<User?> registerWithEmailAndPassword(BuildContext context, String email, String password, String name, String phone, String city, String role) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      String encryptedPass = encryptPassword(password);
      UserModel userModel = UserModel(uid: user!.uid, name: name, email: email, password: encryptedPass, phone: phone, city: city, role: role);
      await UserService().saveUserData(userModel);

      return user;
    } on FirebaseAuthException catch (e){
      // hideLoadingDialog(context);
      if (e.code == 'invalid-email') {
        showWarningAuth(context, 'Format email tidak valid.');
      } else if (e.code == 'email-already-in-use') {
        showWarningAuth(context, 'Udah keduluan yang lain emailnya.');
      } else if (e.code == 'weak-password') {
        showWarningAuth(context, 'Bagusin lagi passwordnya.');
      } else if (e.code == 'operation-not-allowed') {
        showWarningAuth(context, 'Metode login email/password tidak diaktifkan.');
      } else {
        showWarningAuth(context, 'Error: ${e.message}');
      }
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}