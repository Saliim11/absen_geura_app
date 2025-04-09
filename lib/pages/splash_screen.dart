import 'package:absen_geura/service/provider/user_provider.dart';
import 'package:absen_geura/service/shared_preferences/prefs_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () async{
      String uid = await PrefsHandler.getId();
      String role = await PrefsHandler.getRole();
      if (uid.isEmpty || uid == "") {
        Navigator.pushReplacementNamed(context, "/login");
      } else {
        context.read<UserProvider>().ambilUser(uid);

        if (role == "admin") {
          Navigator.pushReplacementNamed(context, "/admin");
        } else {
          //kirim uid secara langsung
          Navigator.pushReplacementNamed(context, "/", arguments: uid);
        }
      }
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "AbsenGeuraa",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Colors.black
          ),
        ),
      ),
    );
  }
}