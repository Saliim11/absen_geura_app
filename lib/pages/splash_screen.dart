import 'package:absen_geura/service/shared_preferences/prefs_handler.dart';
import 'package:flutter/material.dart';

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
      String email = await PrefsHandler.getEmail();
      if (email.isEmpty || email == "") {
        Navigator.pushReplacementNamed(context, "/login");
      } else {
        Navigator.pushReplacementNamed(context, "/");
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