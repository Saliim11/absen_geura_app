import 'package:absen_geura/service/firebase/auth_service.dart';
import 'package:absen_geura/service/shared_preferences/prefs_handler.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("AbsenGeura"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hello World"),
            ElevatedButton(
              onPressed: () async{
                await _authService.signOut();
                PrefsHandler.removeEmail();
                Navigator.pushReplacementNamed(context, "/login");
              }, 
              child: Text("Sign Out")
            )
          ],
        ),
      ),
    );
  }
}