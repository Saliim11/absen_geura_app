import 'package:absen_geura/models/absen_model.dart';
import 'package:absen_geura/service/firebase/firestore/absen_service.dart';
import 'package:absen_geura/service/provider/widget_provider.dart';
import 'package:absen_geura/utils/constant/app_color.dart';
import 'package:absen_geura/utils/constant/app_text_style.dart';
import 'package:absen_geura/utils/widgets/datepicker_textfield.dart';
import 'package:absen_geura/utils/widgets/dialogs/logout_dialog.dart';
import 'package:absen_geura/utils/widgets/role_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wProv = Provider.of<WidgetProvider>(context);
    TextEditingController selectedDate = wProv.selectedDate;
    String selectedRole = wProv.selectedRole;

    return Scaffold(
      backgroundColor: AppColor.beige,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: datePicker(wProv, context),
                  ),
                  SizedBox(width: 5,),
                  Expanded(child: roleDropDown(wProv)),

                ],
              ),
              const Divider(color: AppColor.darkMoca),
              Expanded(
                child: (selectedDate.text.isEmpty || selectedDate.text == "" && selectedRole.isEmpty || selectedRole == "")
                  ? const Center(child: Text("Pilih tanggal dan role"))
                  : StreamBuilder<List<AbsenModel>>(
                      stream: AbsenService().getAbsenAll(selectedDate.text, selectedRole),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Center(child: Text("Tidak ada data absen pada\ntanggal\n${selectedDate.text}\njurusan\n$selectedRole", textAlign: TextAlign.center,style: AppTS.regular,));
                        }

                        final list = snapshot.data!;

                        return ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            final absen = list[index];
                            final waktu = absen.waktuHadir.toDate();
                            final jam = DateFormat('HH:mm').format(waktu);

                            return Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              color: AppColor.moca.withOpacity(0.1),
                              margin: const EdgeInsets.only(bottom: 12),
                              child: ListTile(
                                leading: Image.network(absen.imageUrl, width: 60, height: 60, fit: BoxFit.cover),
                                title: Text(absen.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
                                subtitle: Text("Jam: $jam"),
                                trailing: Chip(
                                  label: Text(
                                    absen.status,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: absen.status == "Hadir"
                                      ? Colors.green
                                      : AppColor.merah,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    )
                    
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: SizedBox(
        height: 50,
        width: 50,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              showLogoutDialog(context);
            },
            backgroundColor: AppColor.darkMoca,
            shape: CircleBorder(),
            child: Icon(LucideIcons.logOut, color: AppColor.beige, size: 30,),
          ),
        ),
      ),
    );
  }

  
}