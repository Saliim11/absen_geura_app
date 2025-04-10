import 'package:absen_geura/models/absen_model.dart';
import 'package:absen_geura/utils/constant/app_color.dart';
import 'package:absen_geura/utils/constant/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void dialogDetailAbsen(BuildContext context, AbsenModel absen) {
  final tanggal = DateFormat('dd MMM yyyy').format(absen.waktuHadir.toDate());
  final jam = DateFormat('HH:mm').format(absen.waktuHadir.toDate());
  final isTelat = absen.status.toLowerCase() == "telat";
  final statusColor = isTelat ? AppColor.merah : AppColor.moca;

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColor.beige,
        title: Center(
          child: Text("Detail Absen", style: TextStyle(fontWeight: FontWeight.bold, color: AppColor.darkMoca),),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Tanggal: $tanggal", style: AppTS.regular,),
            Text("Jam Hadir: $jam", style: AppTS.regular,),
            Text("Status: ${absen.status}",
              style: TextStyle(color: statusColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: absen.imageUrl != "" && absen.imageUrl.isNotEmpty
                  ? Image.network(
                      absen.imageUrl,
                      height: 150,
                      width: 150,
                      fit: BoxFit.contain,
                    )
                  : const Text("Ticoverdak ada foto bukti"),
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Sip"),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.darkMoca,
              foregroundColor: AppColor.beige,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      );
    },
  );
}