import 'package:absen_geura/pages/auth_screen/login_screen.dart';
import 'package:absen_geura/pages/auth_screen/register_screen.dart';
import 'package:absen_geura/pages/section_admin/admin_screen.dart';
import 'package:absen_geura/pages/section_user/main_screen/main_screen.dart';
import 'package:absen_geura/pages/section_user/profile_screen/profile_screen.dart';
import 'package:absen_geura/pages/splash_screen.dart';
import 'package:absen_geura/service/firebase/firebase_options.dart';
import 'package:absen_geura/service/provider/absen_provider.dart';
import 'package:absen_geura/service/provider/user_provider.dart';
import 'package:absen_geura/service/provider/widget_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => WidgetProvider()),
      ChangeNotifierProvider(create: (context) => AbsenProvider(),),
      ChangeNotifierProvider(create: (context) => UserProvider(),),
    ],
    child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AbsenGeuraa',
      theme: ThemeData(
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/splash",
      routes: {
        "/" : (context) => MainScreen(),
        "/profile" : (context) => ProfileScreen(),
        "/register" : (context) => RegisterScreen(),
        "/login" : (context) => LoginScreen(),
        "/splash" : (context) => SplashScreen(),
        "/admin" : (context) => AdminScreen(),
      }
    );
  }
}


