import 'package:absen_geura/service/firebase/auth/auth_service.dart';
import 'package:absen_geura/service/provider/widget_provider.dart';
import 'package:absen_geura/service/shared_preferences/prefs_handler.dart';
import 'package:absen_geura/utils/constant/app_color.dart';
import 'package:absen_geura/utils/constant/app_text_style.dart';
import 'package:absen_geura/utils/widgets/datepicker_textfield.dart';
import 'package:absen_geura/utils/widgets/role_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wProv = Provider.of<WidgetProvider>(context);
    TextEditingController cont = wProv.selectedDate;

    return Scaffold(
      backgroundColor: AppColor.beige,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: datePicker(wProv, context, cont),
                  ),
                  SizedBox(width: 5,),
                  Expanded(child: roleDropDown(wProv)),

                ],
              )
            ],
          ),
        ),
      ),

      floatingActionButton: SizedBox(
        height: 50,
        width: 50,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              AuthService().signOut();
              PrefsHandler.removeUser();
              Navigator.pushNamedAndRemoveUntil(context, "/login", ModalRoute.withName("/login"));
            },
            backgroundColor: AppColor.darkMoca,
            shape: CircleBorder(),
            child: Icon(Icons.library_add_check_rounded, color: AppColor.beige, size: 30,),
          ),
        ),
      ),
    );
  }

  
}