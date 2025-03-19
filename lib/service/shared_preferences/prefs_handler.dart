import 'package:shared_preferences/shared_preferences.dart';

class PrefsHandler {
  static const String _emailUser = "eUser";

  static void saveId(String email){
    SharedPreferences.getInstance().then((value) {
      value.setString(_emailUser, email);
    });
  }

  static Future getEmail() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString(_emailUser) ?? "";
    return email;
  }

  static void removeEmail() {
    SharedPreferences.getInstance().then((value) {
      value.remove(_emailUser);
    });
  }
}