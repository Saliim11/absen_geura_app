import 'package:absen_geura/models/user_model.dart';
import 'package:absen_geura/service/provider/user_provider.dart';
import 'package:absen_geura/service/shared_preferences/prefs_handler.dart';
import 'package:absen_geura/utils/constant/app_color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel? user = context.watch<UserProvider>().user;

    

    return Scaffold(
      backgroundColor: AppColor.beige,
      appBar: AppBar(
        backgroundColor: AppColor.beige,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColor.merahTua),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(color: AppColor.merahTua),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: AppColor.merahTua),
            onPressed: () {
              // navigasi ke setting atau tampilkan dialog
            },
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/default_user.png'), // ganti sesuai path
                  backgroundColor: AppColor.darkMoca,
                ),
                const SizedBox(height: 12),
                Text(
                  user?.name ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColor.merahTua,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Detail",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.merahTua,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: const Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(user?.email ?? ''),
                      trailing: const Icon(Icons.email_outlined, color: AppColor.merah),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: const Text("Role", style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(user?.role ?? ''),
                      trailing: const Icon(Icons.verified_user_outlined, color: AppColor.merah),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text("Nomor Telepon", style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(user?.phone ?? '-'),
                          leading: const Icon(Icons.phone, color: AppColor.moca),
                        ),
                        const Divider(),
                        ListTile(
                          title: const Text("Kota", style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(user?.city ?? '-'),
                          leading: const Icon(Icons.location_city, color: AppColor.moca),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Bergabung sejak ${formatTanggal(user?.createdAt)}",
                      style: const TextStyle(
                        color: AppColor.darkMoca,
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        PrefsHandler.removeUser();
                        Navigator.pushNamedAndRemoveUntil(context, "/login", ModalRoute.withName("/login"));
                      },
                      icon: const Icon(LucideIcons.logOut, color: Colors.white),
                      label: const Text("Logout"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.merah,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

String formatTanggal(Timestamp? ts) {
  if (ts == null) return '-';
  DateTime dt = ts.toDate();
  return DateFormat('dd MMM yyyy').format(dt);
}