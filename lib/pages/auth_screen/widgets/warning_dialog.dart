import 'package:flutter/material.dart';

void showWarningAuth(BuildContext context, String error){
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Peringatan!"),
        content: Text(error),
        actions: [
          ElevatedButton(onPressed: () => Navigator.pop(context), child: Text("Sip"))
        ],
      );
    },
  );
}