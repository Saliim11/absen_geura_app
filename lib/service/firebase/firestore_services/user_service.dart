import 'package:absen_geura/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserData(UserModel user) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('users_AG').doc(user.uid).get();

      if (!doc.exists) {
        await _firestore.collection('users_AG').doc(user.uid).set(user.toMap());
        print("Berhasil simpan data user baru");
      } else {
        print("sudah ada akun jadi nda buat baru");
      }

    } catch (e) {
      print('Error saving user data: $e');
    }
  }
}