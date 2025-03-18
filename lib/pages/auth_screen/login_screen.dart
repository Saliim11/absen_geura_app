import 'package:absen_geura/pages/auth_screen/widgets/loading_widget.dart';
import 'package:absen_geura/pages/main_screen.dart';
import 'package:absen_geura/service/firebase/auth_service.dart';
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
      backgroundColor: Colors.grey.shade300,
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        padding: EdgeInsets.all(25),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome back to Estero. Have a good time",
                  style: TextStyle(
                    color: Color.fromARGB(255, 136, 136, 136)
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
                          color: Colors.grey.shade300
                        )
                      ),
                      child: Column(
                        children: [
                          TextField(
                            controller: _emailCont,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Your Email/id",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14
                              ),
                              prefixIcon: Icon(Icons.person_outline, color: Colors.grey,)
                            ),
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.grey.shade300,
                          ),
                          TextField(
                            controller: _passwordCont,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Your Password",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14
                              ),
                              prefixIcon: Icon(Icons.lock_outline, color: Colors.grey,)
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
                      color: Colors.grey
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Login Berhasil!')),
                              );
                              Navigator.pushReplacementNamed(context, "/");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.ungu,
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
                  Expanded(child: Divider()),
                  Text("   Or continue with   "),
                  Expanded(child: Divider())
                ],
              ),
          
              SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width /5,
                    child: ElevatedButton(
                      onPressed: () {
                        
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        elevation: 0,
                        side: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1
                        ),
                        backgroundColor: Colors.white
                      ),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset("assets/google.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width /5,
                    child: ElevatedButton(
                      onPressed: () {
                        
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        elevation: 0,
                        side: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1
                        ),
                        backgroundColor: Colors.white
                      ),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset("assets/apple.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width /5,
                    child: ElevatedButton(
                      onPressed: () {
                        
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        elevation: 0,
                        side: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1
                        ),
                        backgroundColor: Colors.white
                      ),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset("assets/twitter.png"),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/register");
                    }, 
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.indigo.shade900,
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