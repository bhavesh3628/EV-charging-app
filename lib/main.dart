import 'package:ev_charging/pages/admin/admin_home.dart';
import 'package:ev_charging/pages/services/user_management.dart';
import 'package:ev_charging/pages/user/manage_station.dart';
import 'package:flutter/material.dart';

import 'pages/admin/manage_station.dart';
import 'pages/login_page.dart';
import 'pages/signup_page.dart';
import 'pages/user/home_page.dart';

void main() {
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
      home: userManagament(),
      routes: {
        '/station': (context) => const StationHomePage(),
        '/': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/manage_stations': (context) => manageStation_page(),
        '/manage_stations_admin': (context) => manageStation_admin_page(),
      },
    );
  }
}
