import 'package:absen_geura/pages/auth_screen/widgets/loading_widget.dart';
import 'package:absen_geura/pages/auth_screen/widgets/warning_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmailAndPassword(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e){
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

  Future<User?> registerWithEmailAndPassword(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e){
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
  }
}