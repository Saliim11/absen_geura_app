import 'package:absen_geura/models/user_model.dart';
import 'package:absen_geura/service/firebase/firestore/user_service.dart';
import 'package:absen_geura/service/shared_preferences/prefs_handler.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  void ambilUser(String uid) async {
    _user = await UserService().getUserData(uid);
    if (_user != null) {
      print("Nama: ${_user!.name}");
      print("Email: ${_user!.email}");
      print("Role: ${_user!.role}");
      PrefsHandler.saveRole(_user!.role);
      notifyListeners();
    }
  }
}