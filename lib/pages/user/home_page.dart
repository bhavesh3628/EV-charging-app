import 'dart:ui';
import 'package:ev_charging/pages/login_page.dart';
import 'package:ev_charging/pages/user/bookings/viewbooking.dart';
import 'package:ev_charging/pages/user/manage_station.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 90,
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            "Dashboard",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
          ),
          actions: const [
            Icon(
              Icons.output,
              color: Colors.white,
              size: 25,
            ),
            Padding(padding: EdgeInsets.only(right: 10))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCustomCard(context, 'assets/manage.png',
                      'Manage \nEV Vehicles', manageStation_page()),
                  _buildCustomCard(context, 'assets/charge.png',
                      'Find \nStations', const HomePage()),
                ],
              ),
              // const SizedBox(
              //     height: 16), // Adjust vertical spacing between rows as needed
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCustomCard(
                    context,
                    'assets/timetable.png',
                    'View \nBookings',
                    ViewBookings_Page(),
                  ),
                  _buildCustomCard(context, 'assets/toggle.png', 'Profile\n',
                      const LoginPage()),
                ],
              ),
            ],
          ),
        ));
  }
}

Widget _buildCustomCard(
    BuildContext context, String imagePath, String title, Widget route) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => route));
    },
    child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              width: 60,
              height: 60,
              child: Image.asset(
                imagePath,
                width: 60,
                height: 60,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}
