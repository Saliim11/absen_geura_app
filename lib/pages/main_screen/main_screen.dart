import 'package:absen_geura/pages/main_screen/widgets/dialog_detail_absen.dart';
import 'package:absen_geura/pages/main_screen/widgets/dialog_isi_absen.dart';
import 'package:absen_geura/pages/main_screen/widgets/highlight_card.dart';
import 'package:absen_geura/service/firebase/firestore/absen_service.dart';
import 'package:absen_geura/service/provider/absen_provider.dart';
import 'package:absen_geura/service/shared_preferences/prefs_handler.dart';
import 'package:absen_geura/utils/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final absenProv = Provider.of<AbsenProvider>(context);
    final uid = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      backgroundColor: AppColor.moca,
      body: Stack(
        children: [
          Positioned(
            right: 20,
            top: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/profile");
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: AppColor.darkMoca,
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 32, top: 64, left: 40, right: 40),
                child: StreamBuilder(
                  stream: AbsenService().getAbsenByUser(uid.toString()), 
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                
                    final absenList = snapshot.data;
                
                    if (absenList == null || absenList.isEmpty) {
                      return Center(child: Text('Belum ada data absensi.'));
                    }
                
                    return absenHighlight(absenList.first);
                  },
                ),
              ),

              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.beige,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                  ),
                  child: StreamBuilder(
                    stream: AbsenService().getAbsenByUser(uid.toString()), 
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      final absenList = snapshot.data;

                      if (absenList == null || absenList.isEmpty) {
                        return Center(child: Text('Belum ada data absensi.'));
                      }

                       return ListView.builder(
                        itemCount: absenList.length,
                        itemBuilder: (context, index) {
                          final absen = absenList[index];
                          final tanggal = DateFormat('dd MMM yyyy').format(absen.waktuHadir.toDate());
                          final jam = DateFormat('HH.mm').format(absen.waktuHadir.toDate());

                          final isTelat = absen.status.toLowerCase() == "telat";
                          final statusColor = isTelat ? AppColor.merah : AppColor.moca;
                          final statusIcon = isTelat ? Icons.warning : Icons.check_circle;
                          final statusText = isTelat ? "Telat" : "Hadir";

                          return GestureDetector(
                            onTap: () => dialogDetailAbsen(context, absen),
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColor.darkMoca, width: 1),
                                borderRadius: BorderRadius.circular(16)  
                              ),
                              // elevation: 4,
                              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  children: [
                                    Icon(
                                      statusIcon,
                                      color: statusColor,
                                      size: 36,
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            tanggal,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.darkMoca,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            "Jam Hadir: $jam",
                                            style: TextStyle(fontSize: 14, color: AppColor.darkMoca),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: statusColor.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: statusColor),
                                      ),
                                      child: Text(
                                        statusText,
                                        style: TextStyle(
                                          color: statusColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          )
        ],
      ),

      floatingActionButton: SizedBox(
        height: 50,
        width: 50,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () async{
              String role = await PrefsHandler.getRole();
              dialogIsiAbsen(context, absenProv, role);
            },
            backgroundColor: AppColor.darkMoca,
            shape: CircleBorder(),
            child: Icon(Icons.library_add_check_rounded, color: AppColor.beige, size: 30,),
          ),
        ),
      ),
    );
  }
}