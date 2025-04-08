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

  Future<UserModel?> getUserData(String uid) async {
  try {
    DocumentSnapshot doc = await _firestore.collection('users_AG').doc(uid).get();

    if (doc.exists) {
      // Convert data Firestore ke UserModel
      return UserModel.fromMap(doc.data() as Map<String, dynamic>);
    } else {
      print("User tidak ditemukan di Firestore");
      return null;
    }
  } catch (e) {
    print("Error getting user data: $e");
    return null;
  }
}
}