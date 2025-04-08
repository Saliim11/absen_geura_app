import 'package:shared_preferences/shared_preferences.dart';

class PrefsHandler {
  static const String _idUser = "idUser";
  static const String _roleUser = "roleUser";

  static void saveId(String uid){
    SharedPreferences.getInstance().then((value) {
      value.setString(_idUser, uid);
    });
  }

  static Future getId() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String uid = prefs.getString(_idUser) ?? "";
    return uid;
  }
  
  static void saveRole(String role){
    SharedPreferences.getInstance().then((value) {
      value.setString(_roleUser, role);
    });
  }

  static Future getRole() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String role = prefs.getString(_roleUser) ?? "";
    return role;
  }

  static void removeUser() {
    SharedPreferences.getInstance().then((value) {
      value.remove(_idUser);
      value.remove(_roleUser);
    });
  }
}