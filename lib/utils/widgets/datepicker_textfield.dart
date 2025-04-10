import 'package:absen_geura/service/provider/widget_provider.dart';
import 'package:absen_geura/utils/constant/app_color.dart';
import 'package:absen_geura/utils/constant/app_text_style.dart';
import 'package:flutter/material.dart';

GestureDetector datePicker(WidgetProvider wProv, BuildContext context) {
  return GestureDetector(
    onTap: () {
      wProv.pickDate(context);
    },
    child: AbsorbPointer(
      child: TextField(
        onTap: () {
          wProv.pickDate(context);
        },
        controller: wProv.selectedDate,
        style: AppTS.regular,
        decoration: InputDecoration(
          hintText: "Masukkan Tanggal",
          hintStyle: AppTS.regular,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.moca),
            borderRadius: BorderRadius.circular(8)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.moca),
            borderRadius: BorderRadius.circular(8)
          ),
        ),
      ),
    ),
  );
}