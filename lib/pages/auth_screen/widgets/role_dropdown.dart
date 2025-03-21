import 'package:absen_geura/service/provider/widget_provider.dart';
import 'package:absen_geura/utils/constant/app_color.dart';
import 'package:absen_geura/utils/constant/app_text_style.dart';
import 'package:absen_geura/utils/data/roles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

Widget roleDropDown(WidgetProvider prov) {  
  return DropdownButtonHideUnderline(
    child: DropdownButton2<String>(
      isExpanded: true,
      hint: const Row(
        children: [
          SizedBox(
            width: 4,
          ),
          Expanded(
            child: Text(
              'Role',
              style: AppTS.regular,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      items: rolesList
          .map((String item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: AppTS.regular,
                  overflow: TextOverflow.ellipsis,
                ),
              ))
          .toList(),
      value: prov.selectedRole,
      onChanged: (value) {
        prov.pickRole(value!);
      },
      buttonStyleData: ButtonStyleData(
        height: 55,
        padding: const EdgeInsets.only(left: 14, right: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColor.moca,
          ),
          // color: Colors.redAccent,
        ),
      ),
      dropdownStyleData: DropdownStyleData(
        maxHeight: 200,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: AppColor.beige,
        ),
        offset: const Offset(-20, 0),
        scrollbarTheme: ScrollbarThemeData(
          radius: const Radius.circular(40),
          thickness: MaterialStateProperty.all(6),
          thumbVisibility: MaterialStateProperty.all(true),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        height: 40,
        padding: EdgeInsets.only(left: 14, right: 14),
      ),
    ),
  );
}