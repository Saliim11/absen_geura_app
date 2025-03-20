import 'package:absen_geura/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserData(UserModel user) async {
    try {
      await _firestore.collection('users_AG').doc(user.uid).set(user.toMap());
    } catch (e) {
      print('Error saving user data: $e');
    }
  }
}