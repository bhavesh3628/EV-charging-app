import 'package:ev_charging/pages/user/Manage_ev/manage_ev_list.dart';
import 'package:ev_charging/pages/user/home_page.dart';
import 'package:flutter/material.dart';

import '../../../ev_model.dart';
import '../add_ev.dart';

class Manage_EV_page extends StatefulWidget {
  Manage_EV_page({super.key});

  @override
  State<Manage_EV_page> createState() => _Manage_EV_pageState();
}

class _Manage_EV_pageState extends State<Manage_EV_page> {
  final List<Booking> bookinglist = [
    Booking(
      id: 01,
      userId: 01,
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      location: 'Nala Sopara',
      vehicleModelName: 'Fortuner',
      vehicleBrand: 'Toyota',
      vehiclePlateNumber: 'MH19-D9230',
    ),
    Booking(
      id: 02,
      userId: 02,
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      location: 'Bandra',
      vehicleModelName: 'GT-Line',
      vehicleBrand: 'KIA',
      vehiclePlateNumber: 'MH29-FO230',
    ),
    Booking(
      id: 03,
      userId: 03,
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      location: 'Bandra West',
      vehicleModelName: 'Ioniq 5',
      vehicleBrand: 'Hyundai',
      vehiclePlateNumber: 'MH15-YR981',
    ),
    Booking(
      id: 04,
      userId: 04,
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      location: 'Borivali',
      vehicleModelName: 'E-Tron GT',
      vehicleBrand: 'Audi',
      vehiclePlateNumber: 'MH09-RK109',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    void _addEvvehicle(Ev_model vehicle) {
      setState(() {
        // _registeredstations.add(vehicle);
      });
    }

    void bottomsheet() {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => addNew_Ev(
          onaddEv:
              _addEvvehicle, // Pass the function reference without parentheses
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 128, 209),
        title: const Text('Manage EV'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
      ),
      body: View_List(booking_single: bookinglist),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: bottomsheet,
        icon: const Icon(Icons.add),
        label: const Text("Add EV Vehicle"),
      ),
    );
  }
}
