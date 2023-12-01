import 'package:ev_charging/pages/user/add_ev.dart';
import 'package:flutter/material.dart';
import 'package:ev_charging/ev_model.dart';
import 'home_page.dart';

class View_Bookings extends StatefulWidget {
  View_Bookings({Key? key});

  @override
  State<View_Bookings> createState() => View_BookingsState();
}

class View_BookingsState extends State<View_Bookings> {
  final List<Station> _registeredStations = [
    Station(
      Station_Id: '01',
      s_name: 'Mumbai user',
      latitude: 'Rcity Mall Parking',
      longitude: 'Status.Enable',
    ),
    Station(
      Station_Id: '02',
      s_name: 'Navi Mumbai user',
      latitude: 'HP Pump',
      longitude: 'Status.Disable',
    ),
    Station(
      Station_Id: '03',
      s_name: 'Manor',
      latitude: 'Indian Oil Pump',
      longitude: 'Status.Enable',
    ),
  ];

  void _addEvVehicle(Station station) {
    setState(() {
      _registeredStations.add(station);
    });
  }

  // void _bottomSheet() {
  //   showModalBottomSheet(
  //     isScrollControlled: true,
  //     context: context,
  //     builder: (ctx) => addNew_Ev(
  //       onaddEv: _addEvVehicle,
  //     ),
  //   );
  // }

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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            });
          },
        ),
        title: const Text("View bookings"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        child: ListView.builder(
          itemBuilder: (context, index) {
            final station = _registeredStations[index];

            return Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/car_circle.png',
                          width: 70,
                        ),
                      ],
                    ),
                    const SizedBox(width: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Name :",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(station.latitude),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "City : ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(station.s_name),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: _registeredStations.length,
        ),
      ),
    );
  }
}
