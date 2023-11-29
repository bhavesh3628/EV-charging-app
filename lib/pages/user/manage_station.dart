import 'package:ev_charging/pages/user/home_page.dart';
import 'package:ev_charging/pages/user/station_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ev_model.dart';
import 'add_ev.dart';

class manageStation_page extends StatefulWidget {
  manageStation_page({Key? key});

  @override
  State<manageStation_page> createState() => _manageStation_pageState();
}

class _manageStation_pageState extends State<manageStation_page> {
  final List<Ev_model> _registeredstations = [
    Ev_model(
        city: 'Mumbai user',
        station_name: 'Rcity Mall Parking',
        status: Status.Enable),
    Ev_model(
      city: 'Navi Mumbai user',
      station_name: 'HP Pump',
      status: Status.Disable,
    ),
    Ev_model(
      city: 'Manor',
      station_name: 'Indian Oil Pump',
      status: Status.Enable,
    ),
  ];

  void _addEvvehicle(Ev_model vehicle) {
    setState(() {
      _registeredstations.add(vehicle);
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => addNew_Ev(
        onaddEv:
            _addEvvehicle, // Pass the function reference without parentheses
      ),
    );
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            });
          },
        ),
        title: const Text("Manage EV vehicles"),
      ),
      body: Column(
        children: [
          Ev_list(registered: _registeredstations),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openAddExpenseOverlay,
        icon: const Icon(Icons.add),
        label: const Text("Add EV Vehicle"),
      ),
    );
  }
}
