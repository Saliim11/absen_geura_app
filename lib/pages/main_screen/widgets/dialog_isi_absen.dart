import 'dart:io';

import 'package:absen_geura/service/provider/absen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void dialogIsiAbsen(BuildContext context, AbsenProvider prov, String role){
  showDialog(
    context: context,
    builder: (context) {
      File? image = context.watch<AbsenProvider>().image;
      bool isLoading = prov.isLoading;

      return AlertDialog(
      title: const Text(
        'Isi Absen',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Jika ada gambar, tampilkan
          image != null
              ? Image.file(image, height: 150, fit: BoxFit.cover)
              : SizedBox(
                  height: 150,
                  child: const Icon(Icons.image, size: 60, color: Colors.brown),
                ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              prov.pickImage();
              // prov.refresh();
            } ,
            child: const Text('Upload Bukti'),
          ),
        ],
      ),
      actions: [
        isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () => prov.submitAbsen(context, role),
                child: const Text('Absen'),
              ),
      ],
    );
    },
  );
}