import 'package:absen_geura/pages/auth_screen/widgets/loading_widget.dart';
import 'package:absen_geura/service/firebase/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                // showLoadingDialog(context);
                User? user = await authService.registerWithEmailAndPassword(
                  context,
                  emailController.text,
                  passwordController.text,
                  nameController.text
                );
                // hideLoadingDialog(context);
                if (user != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Registrasi Berhasil!')),
                  );

                  Navigator.pushReplacementNamed(context, "/login");
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}