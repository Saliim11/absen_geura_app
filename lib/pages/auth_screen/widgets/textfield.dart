import 'package:absen_geura/service/provider/widget_provider.dart';
import 'package:absen_geura/utils/constant/app_color.dart';
import 'package:absen_geura/utils/constant/app_text_style.dart';
import 'package:flutter/material.dart';

TextField regularTextField(TextEditingController control, String label, {bool? isPW = false, bool? isCP = false, WidgetProvider? prov}) {  
  return TextField(
    controller: control,
    obscureText: isPW! ? isCP! ? true : prov!.isVisibleReg : false,
    style: AppTS.regular,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: AppTS.regular,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.moca),
        borderRadius: BorderRadius.circular(8)
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.moca),
        borderRadius: BorderRadius.circular(8)
      ),
      suffixIcon: isPW? isCP! ? null : IconButton(
        onPressed: () {
          prov.changeVisibleReg();
        }, 
        icon: !prov!.isVisibleReg ? 
        Icon(Icons.visibility_outlined, color: AppColor.darkMoca,) : 
        Icon(Icons.visibility_off_outlined, color: AppColor.darkMoca,)
      ) : null
    ),
  );
}