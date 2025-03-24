import 'package:cloud_firestore/cloud_firestore.dart';

class AbsenModel {
  final String uid;
  final Timestamp waktuHadir;
  final String imageUrl;
  final String status;

  AbsenModel({
    required this.uid,
    required this.waktuHadir,
    required this.imageUrl,
    required this.status,
  });

  // Convert model ke Map untuk disimpan di Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'waktu_hadir': waktuHadir,
      'image_url': imageUrl,
      'status': status,
    };
  }

  // Buat dari Map (jika ingin mengambil data dari Firestore)
  factory AbsenModel.fromMap(Map<String, dynamic> map) {
    return AbsenModel(
      uid: map['uid'],
      waktuHadir: map['waktu_hadir'],
      imageUrl: map['image_url'],
      status: map['status'],
    );
  }
}