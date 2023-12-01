import 'package:ev_charging/pages/user/station_page.dart';
import 'package:flutter/material.dart';
import 'package:ev_charging/ev_model.dart';

class manageStation_admin_page extends StatefulWidget {
  manageStation_admin_page({super.key});

  @override
  State<manageStation_admin_page> createState() =>
      _manageStation_admin_pageState();
}

class _manageStation_admin_pageState extends State<manageStation_admin_page> {
  final List<Ev_model> _registeredstations = [
    Ev_model(ev_city: 'Admin', station_name: 'Admin', status: Status.Enable),
    Ev_model(
      ev_city: 'Admin',
      station_name: 'Admin',
      status: Status.Disable,
    ),
    Ev_model(
      ev_city: 'Admin',
      station_name: 'Admin',
      status: Status.Enable,
    ),
  ];

  void _addEvvehicle(Ev_model vehicle) {
    setState(() {
      _registeredstations.add(vehicle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            setState(() {
              Navigator.pushNamed(context, '/');
            });
          },
        ),
        title: const Text("Manage EV vehicles"),
      ),
      body: Center(
        child: Container(
          child: Ev_list(registered: _registeredstations),
        ),
      ),
    );
  }
}
