import 'dart:io';

import 'package:absen_geura/models/absen_model.dart';
import 'package:absen_geura/service/firebase/firestore/absen_service.dart';
import 'package:absen_geura/service/firebase/storage/storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class AbsenProvider with ChangeNotifier {
  final StorageService _storageService = StorageService();
  final AbsenService _absenService = AbsenService();
  
  File? _image;
  bool _isLoading = false;

  File? get image => _image;
  bool get isLoading => _isLoading;


  // Fungsi untuk mengambil gambar dari kamera
  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      
      _image = File(pickedFile.path);
      notifyListeners();
    }
  }

  // Fungsi untuk menyimpan absen ke Firestore
  Future<void> submitAbsen(BuildContext context) async {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Silakan ambil gambar terlebih dahulu!')),
      );
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      // Ambil informasi user dari Firebase Auth
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception('User tidak ditemukan');

      // Upload gambar ke Firebase Storage
      String? imageUrl = await _storageService.uploadImage(_image!, user.uid);
      if (imageUrl == null) throw Exception('Gagal mengunggah gambar');

      // Waktu absen dan status
      Timestamp waktuHadir = Timestamp.now();
      String status = waktuHadir.toDate().hour < 8 ? 'Hadir' : 'Telat';

      // Buat instance dari AbsenModel
      AbsenModel absen = AbsenModel(
        uid: user.uid,
        waktuHadir: waktuHadir,
        imageUrl: imageUrl,
        status: status,
      );

      // Simpan data ke Firestore
      await _absenService.saveAbsen(absen);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Absen berhasil! Status: $status')),
      );

      // Tutup dialog
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      _isLoading = false;
      _image = null;
      notifyListeners();
    }
  }

  void refresh() => notifyListeners();
}
