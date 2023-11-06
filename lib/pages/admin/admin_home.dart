import 'package:flutter/material.dart';

class StationHomePage extends StatefulWidget {
  const StationHomePage({super.key});

  @override
  State<StationHomePage> createState() => _StationHomePageState();
}

class _StationHomePageState extends State<StationHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 90,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Station Dashboard",
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
                    'Manage \nStations', '/manage_stations_admin'),
              ],
            ),
            const SizedBox(
                height: 16), // Adjust vertical spacing between rows as needed
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCustomCard(
                    context, 'assets/timetable.png', 'View \nBookings', '/'),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          return;
        },
        icon: const Icon(
          Icons.add,
        ),
        label: const Text("Add Station"),
      ),
    );
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
