import 'package:absen_geura/utils/data/roles.dart';
import 'package:flutter/material.dart';

class WidgetProvider with ChangeNotifier {
  // visibility password register
  bool _isVisibleReg = false;
  bool get isVisibleReg => _isVisibleReg;

  void changeVisibleReg(){
    _isVisibleReg = !_isVisibleReg;
    notifyListeners();
  } 

  // visibility password login
  bool _isVisibleLog = false;
  bool get isVisibleLog => _isVisibleLog;

  void changeVisibleLog(){
    _isVisibleLog = !_isVisibleLog;
    notifyListeners();
  }

  // item dropdown role;
  String _selectedRole = rolesList.first;
  String get selectedRole => _selectedRole;

  void pickRole(String value){
    _selectedRole = value;
    notifyListeners();
  }
}