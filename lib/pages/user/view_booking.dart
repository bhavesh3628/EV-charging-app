import 'package:ev_charging/pages/user/home_page.dart';
import 'package:ev_charging/pages/user/station_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ev_model.dart';
import 'add_ev.dart';

class View_Bookings extends StatefulWidget {
  View_Bookings({Key? key});

  @override
  State<View_Bookings> createState() => View_BookingsState();
}

class View_BookingsState extends State<View_Bookings> {
  final List<Ev_model> _registeredstations = [
    Ev_model(
        ev_city: 'Mumbai user',
        station_name: 'Rcity Mall Parking',
        status: Status.Enable),
    Ev_model(
      ev_city: 'Navi Mumbai user',
      station_name: 'HP Pump',
      status: Status.Disable,
    ),
    Ev_model(
      ev_city: 'Manor',
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
    );
  }
}
