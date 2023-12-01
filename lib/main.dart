import 'package:ev_charging/firebase_options.dart';
import 'package:ev_charging/pages/admin/admin_home.dart';
import 'package:ev_charging/pages/services/user_management.dart';
import 'package:ev_charging/pages/user/home_page.dart';
import 'package:ev_charging/pages/user/user_profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home: userManagament(),
      home: ProfileScreen(),
    );
  }
}
