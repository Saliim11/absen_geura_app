import 'package:absen_geura/utils/widgets/role_dropdown.dart';
import 'package:absen_geura/pages/auth_screen/widgets/textfield.dart';
import 'package:absen_geura/service/firebase/auth/auth_service.dart';
import 'package:absen_geura/service/provider/widget_provider.dart';
import 'package:absen_geura/utils/constant/app_btn_style.dart';
import 'package:absen_geura/utils/constant/app_color.dart';
import 'package:absen_geura/utils/constant/app_text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _emailCont = TextEditingController();
  final TextEditingController _nameCont = TextEditingController();
  final TextEditingController _passCont = TextEditingController();
  final TextEditingController _cpassCont = TextEditingController();
  final TextEditingController _phoneCont = TextEditingController();
  final TextEditingController _cityCont = TextEditingController();
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WidgetProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.moca,
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        padding: EdgeInsets.all(25),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: AppColor.beige
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Register", style: AppTS.header)
            ),
            SizedBox(height: 10),
            regularTextField(_nameCont, "Name", ),
            Divider(color: AppColor.moca, thickness: 2, height: 25, endIndent: 50, indent: 50,),
            regularTextField(_emailCont, "Email", ),
            Divider(color: AppColor.moca, thickness: 2, height: 25, endIndent: 50, indent: 50,),
            regularTextField(_passCont, "Password", prov: provider, isPW: true),
            SizedBox(height: 10),
            regularTextField(_cpassCont, "Confirm Password", prov: provider, isPW: true, isCP: true),
            Divider(color: AppColor.moca, thickness: 2, height: 25, endIndent: 50, indent: 50,),
            regularTextField(_phoneCont, "Phone Number"),
            Divider(color: AppColor.moca, thickness: 2, height: 25, endIndent: 50, indent: 50,),
            Row(
              children: [
                Expanded(child: regularTextField(_cityCont, "City")),
                SizedBox(width: 10,),
                Expanded(child: roleDropDown(provider)),
              ],
            ),
            
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  // showLoadingDialog(context);
                  User? user = await authService.registerWithEmailAndPassword(
                    context,
                    _emailCont.text,
                    _passCont.text,
                    _nameCont.text,
                    _phoneCont.text,
                    _cityCont.text,
                    provider.selectedRole
                  );
                  // hideLoadingDialog(context);
                  if (user != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Registrasi Berhasil!')),
                    );
                      
                    Navigator.pushReplacementNamed(context, "/login");
                  }
                },
                style: AppBtnStyle.coklat,
                child: Text('Register', style: AppTS.boldWhite,),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: AppColor.darkMoca
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, 
                  child: Text(
                    "Login",
                    style: AppTS.boldDarkMoca,
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  
}