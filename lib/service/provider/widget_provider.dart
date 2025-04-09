import 'package:absen_geura/utils/data/roles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WidgetProvider with ChangeNotifier {
  // visibility password register
  bool _isVisibleReg = true;
  bool get isVisibleReg => _isVisibleReg;

  void changeVisibleReg(){
    _isVisibleReg = !_isVisibleReg;
    notifyListeners();
  } 

  // visibility password login
  bool _isVisibleLog = true;
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


  TextEditingController _selectedDate = new TextEditingController();
  TextEditingController get selectedDate => _selectedDate;

  void pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat("dd MMM yyyy").format(pickedDate);
      _selectedDate.text = formattedDate;
      notifyListeners();
    }
  }

  
}