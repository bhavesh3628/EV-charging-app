import 'package:ev_charging/ev_model.dart';
import 'package:flutter/material.dart';

class Ev_list extends StatelessWidget {
  const Ev_list({super.key, required this.registered});
  final List<Ev_model> registered;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .85,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return StationPage(station: registered[index]);
        },
        itemCount: registered.length,
      ),
    );
  }
}

class StationPage extends StatelessWidget {
  const StationPage({super.key, required this.station});
  final Ev_model station;
  @override
  Widget build(BuildContext context) {
    Color statusColor =
        station.status == Status.Enable ? Colors.green : Colors.red;

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
              SizedBox(width: 50),
              // Added SizedBox to create vertical space
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Name :",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(station.station_name),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "City : ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        station.city,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Status: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                          color: statusColor,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        child: Text(
                          station.status.toString().split('.').last,
                          style: const TextStyle(color: Colors.white),
                        ),
                        // ${station.status.toString().split('.').last}
                      ),
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }
}
