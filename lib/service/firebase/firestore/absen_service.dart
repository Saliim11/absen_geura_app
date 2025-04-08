import 'package:absen_geura/models/absen_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AbsenService {
  final CollectionReference _absenByUser = FirebaseFirestore.instance.collection("AG_absen_by_user");
  final CollectionReference _absenAll = FirebaseFirestore.instance.collection("AG_absen_all");

  Future<void> saveAbsen(AbsenModel absen, String role) async {
    DateTime dateTime = absen.waktuHadir.toDate();
    String tgl = DateFormat('dd MMM yyyy').format(dateTime);
    try {
      await _absenAll
          .doc(tgl)
          .collection(role)
          .doc(absen.uid)
          .set(absen.toMap());

    } catch (e) {
      print("Error saving absen: $e");
      rethrow;
    }
  }

  Future<void> saveAbsenByUser(AbsenModel absen) async {
    DateTime dateTime = absen.waktuHadir.toDate();
    String tgl = DateFormat('dd MMM yyyy').format(dateTime);
    try {
      await _absenByUser
          .doc(absen.uid)
          .collection("absen")
          .doc(tgl)
          .set(absen.toMap());

    } catch (e) {
      print("Error saving absen: $e");
      rethrow;
    }
  }
  


}