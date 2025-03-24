import 'package:absen_geura/models/absen_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AbsenService {
  final CollectionReference _firestore = FirebaseFirestore.instance.collection("absen_by_user_AG");

  Future<void> saveAbsen(AbsenModel absen) async {
    try {
      await _firestore
          .doc(absen.uid)
          .collection("absen")
          .add(absen.toMap());

    } catch (e) {
      print("Error saving absen: $e");
      rethrow;
    }
  }


}