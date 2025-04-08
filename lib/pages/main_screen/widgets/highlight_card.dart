import 'package:absen_geura/models/absen_model.dart';
import 'package:absen_geura/utils/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget absenHighlight(AbsenModel absen) {
  final tanggal = DateFormat('dd MMM yyyy').format(absen.waktuHadir.toDate());
  final jam = DateFormat('HH:mm').format(absen.waktuHadir.toDate());
  final isTelat = absen.status.toLowerCase() == "telat";
  final statusColor = isTelat ? AppColor.merah : AppColor.moca;
  final statusBg = isTelat ? AppColor.merah.withOpacity(0.1) : AppColor.beige.withOpacity(0.4);

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: AppColor.beige,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      children: [
        // Gambar di sisi kiri
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: absen.imageUrl.isNotEmpty
              ? Image.network(
                  absen.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                )
              : Container(
                  width: 100,
                  height: 100,
                  color: AppColor.darkMoca,
                  child: Icon(Icons.image, color: Colors.white),
                ),
        ),
        const SizedBox(width: 16),

        // Info di sisi kanan
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tanggal,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.merahTua,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Jam Hadir: $jam",
                style: TextStyle(
                  color: AppColor.darkMoca,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: statusBg,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: statusColor),
                ),
                child: Text(
                  absen.status,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}