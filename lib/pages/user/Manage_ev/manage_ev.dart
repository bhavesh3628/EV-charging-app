import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_charging/pages/user/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../ev_model.dart';
import '../add_ev.dart';

class Manage_EV_page extends StatefulWidget {
  Manage_EV_page({super.key});

  @override
  State<Manage_EV_page> createState() => _Manage_EV_pageState();
}

class _Manage_EV_pageState extends State<Manage_EV_page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCarDetails();
  }

  final List<Ev_model> vehiclelist = [];

  Future getCarDetails() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final docRef =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    final docList = docRef['ev'];
    for (var i in docList) {
      var carRef =
          await FirebaseFirestore.instance.collection('ev').doc(i).get();
      vehiclelist.add(carRef as Ev_model);
    }
  }

  @override
  Widget build(BuildContext context) {
    void _addEvVehicle(Ev_model vehicle) {
      setState(() {
        // _registeredstations.add(vehicle);
      });
    }

    void _bottomSheet() {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => AddNewEv(
          onAddEv: _addEvVehicle,
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
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return BookingCard(singlebook: vehiclelist[index]);
          },
          itemCount: vehiclelist.length,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _bottomSheet,
        icon: const Icon(Icons.add),
        label: const Text("Add EV Vehicle"),
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  const BookingCard({super.key, required this.singlebook});
  final Ev_model singlebook;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(255, 255, 255, 1),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/charging.png',
                  width: 70,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Vehicle Brand: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      singlebook.model_name,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Plate number : ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      singlebook.plate_number,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
