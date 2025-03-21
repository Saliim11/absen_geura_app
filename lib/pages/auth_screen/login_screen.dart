import 'package:absen_geura/pages/auth_screen/widgets/loading_widget.dart';
import 'package:absen_geura/pages/auth_screen/widgets/warning_dialog.dart';
import 'package:absen_geura/service/firebase/auth_service.dart';
import 'package:absen_geura/service/shared_preferences/prefs_handler.dart';
import 'package:absen_geura/utils/app_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailCont = TextEditingController();
  final TextEditingController _passwordCont = TextEditingController();
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.moca,
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        padding: EdgeInsets.all(25),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: AppColor.beige
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome Gess",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColor.darkMoca
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hayang Absen cepet ceunah? AbsenGeuraa",
                  style: TextStyle(
                    color: AppColor.darkMoca
                  ),
                ),
              ),
          
              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
          
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: AppColor.moca
                        )
                      ),
                      child: Column(
                        children: [
                          TextField(
                            controller: _emailCont,
                            style: TextStyle(
                              color: AppColor.darkMoca
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Your Email/id",
                              hintStyle: TextStyle(
                                color: AppColor.moca,
                                fontSize: 14
                              ),
                              prefixIcon: Icon(Icons.person_outline, color: AppColor.moca,)
                            ),
                          ),
                          Divider(
                            thickness: 2,
                            color: AppColor.moca,
                          ),
                          TextField(
                            controller: _passwordCont,
                            obscureText: true,
                            style: TextStyle(
                              color: AppColor.darkMoca
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Your Password",
                              hintStyle: TextStyle(
                                color: AppColor.moca,
                                fontSize: 14
                              ),
                              prefixIcon: Icon(Icons.lock_outline, color: AppColor.moca,)
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(height: 10),

              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () => print("Forget Password tapped"),
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.darkMoca
                    ),
                  ),
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async{
                            // showLoadingDialog(context);
                            User? user = await authService.signInWithEmailAndPassword(
                              context,
                              _emailCont.text,
                              _passwordCont.text,
                            );
                            // hideLoadingDialog(context);
                            if (user != null) {
                              PrefsHandler.saveId(user.email!);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Login Berhasil!')),
                              );
                              Navigator.pushReplacementNamed(context, "/");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.darkMoca,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                            )
                          ),
                          child: Text("Login"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          
              Row(
                children: [
                  Expanded(child: Divider(color: AppColor.darkMoca,)),
                  Text(
                    "   Or continue with   ",
                    style: TextStyle(
                      color: AppColor.darkMoca
                    ),
                  ),
                  Expanded(child: Divider(color: AppColor.darkMoca,))
                ],
              ),
          
              SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          showLoadingDialog(context);
                      
                          User? user = await authService.signInWithGoogle();
                      
                          hideLoadingDialog(context);
                      
                          if (user != null) {
                            PrefsHandler.saveId(user.email!);
                            Navigator.pushReplacementNamed(context, "/");
                          } else {
                            showWarningAuth(
                                context, 'Gagal melakukan login dengan Google.');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                          elevation: 5,
                          backgroundColor: AppColor.darkMoca
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset("assets/image/google.png"),
                            ),
                            Text("Sign in with Google",style: TextStyle(
                              color: Colors.white
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: AppColor.darkMoca
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/register");
                    }, 
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: AppColor.darkMoca,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}