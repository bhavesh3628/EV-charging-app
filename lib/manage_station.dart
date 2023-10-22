import 'package:ev_charging/station_page.dart';
import 'package:flutter/material.dart';
import 'package:ev_charging/ev_model.dart';

class manageStation_page extends StatefulWidget {
  manageStation_page({super.key});

  @override
  State<manageStation_page> createState() => _manageStation_pageState();
}

class _manageStation_pageState extends State<manageStation_page> {
  final List<Ev_model> _registeredstations = [
    Ev_model(
        city: 'Mumbai',
        station_name: 'Rcity Mall Parking',
        status: Status.Enable),
    Ev_model(
      city: 'Navi Mumbai',
      station_name: 'HP Pump',
      status: Status.Disable,
    ),
    Ev_model(
      city: 'Manor',
      station_name: 'Indian Oil Pump',
      status: Status.Enable,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {},
        ),
        title: const Text("Manage Stations"),
      ),
      body: Center(
        child: Expanded(
          child: Container(
            child: Ev_list(registered: _registeredstations),
          ),
        ),
      ),
    );
  }
}
