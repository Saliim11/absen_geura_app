import 'package:absen_geura/service/firebase/auth/auth_service.dart';
import 'package:absen_geura/service/shared_preferences/prefs_handler.dart';
import 'package:absen_geura/utils/constant/app_btn_style.dart';
import 'package:absen_geura/utils/constant/app_color.dart';
import 'package:absen_geura/utils/constant/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

void showLogoutDialog(BuildContext context){
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColor.beige,
        title: Text("Yakin Logout?", style: AppTS.header, textAlign: TextAlign.center),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              AuthService().signOut();
              PrefsHandler.removeUser();
              Navigator.pushNamedAndRemoveUntil(context, "/login", ModalRoute.withName("/login"));
            },
            icon: const Icon(LucideIcons.logOut, color: Colors.white),
            label: const Text("Logout"),
            style: AppBtnStyle.logout
          ),
        ],
      );
    },
  );
}