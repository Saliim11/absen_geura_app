import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("AbsenGeura"),
      ),
      body: Center(
        child: Text("Hello World"),
      ),
    );
  }
}