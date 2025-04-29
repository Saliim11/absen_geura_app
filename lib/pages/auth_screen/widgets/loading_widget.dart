import 'package:absen_geura/utils/constant/app_color.dart';
import 'package:flutter/material.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Tidak bisa ditutup dengan tap di luar
    builder: (context) {
      return Dialog(
      backgroundColor: AppColor.beige,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(AppColor.merahTua),
            ),
            const SizedBox(height: 24),
            const Text(
              "Mohon tunggu...",
              style: TextStyle(
                color: AppColor.darkMoca,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
    },
  );
}

void hideLoadingDialog(BuildContext context) {
  Navigator.of(context).pop(); // Menutup dialog
}