import 'package:absen_geura/utils/constant/app_color.dart';
import 'package:flutter/material.dart';

class AppBtnStyle {
  static ButtonStyle coklat = ElevatedButton.styleFrom(
    backgroundColor: AppColor.darkMoca,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8)
    )
  );

  static ButtonStyle logout = ElevatedButton.styleFrom(
    backgroundColor: AppColor.merah,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  );
}