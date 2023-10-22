// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:ev_charging/manage_station.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          actions: [
            const Icon(
              Icons.output,
              color: Colors.white,
              size: 25,
            ),
            const Padding(padding: EdgeInsets.only(right: 10))
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
                      'Manage \nStations', '/manage_stations'),
                  _buildCustomCard(
                      context, 'assets/charge.png', 'Find \nStations', '/'),
                ],
              ),
              SizedBox(
                  height: 16), // Adjust vertical spacing between rows as needed
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCustomCard(
                      context, 'assets/timetable.png', 'View \nBookings', '/'),
                  _buildCustomCard(
                      context, 'assets/toggle.png', 'Profile\n', '/login'),
                ],
              ),
            ],
          ),
        ));
  }
}

Widget _buildCustomCard(
    BuildContext context, String imagePath, String title, String route) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, route);
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
              margin: EdgeInsets.all(20),
              width: 60,
              height: 60,
              child: Image.asset(
                imagePath,
                width: 60,
                height: 60,
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}
