import 'package:ev_charging/admin/admin_home.dart';
import 'package:ev_charging/user/manage_station.dart';
import 'package:ev_charging/signup_page.dart';
import 'package:flutter/material.dart';

import 'admin/manage_station.dart';
import 'user/home_page.dart';
import 'login_page.dart';

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
      initialRoute: '/login',
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
