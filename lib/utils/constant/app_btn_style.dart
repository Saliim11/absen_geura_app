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
}