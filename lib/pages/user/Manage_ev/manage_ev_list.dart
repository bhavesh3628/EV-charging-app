import 'package:flutter/material.dart';

import '../../../ev_model.dart';

class View_List extends StatefulWidget {
  const View_List({super.key, required this.booking_single});

  final List<Booking> booking_single;

  @override
  State<View_List> createState() => _View_ListState();
}

class _View_ListState extends State<View_List> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return booking_card(singlebook: widget.booking_single[index]);
        },
        itemCount: widget.booking_single.length,
      ),
    );
  }
}

class booking_card extends StatelessWidget {
  const booking_card({super.key, required this.singlebook});
  final Booking singlebook;

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
                  // 'https://www.audi-mediacenter.com/system/production/media/1282/images/bde751ee18fe149036c6b47d7595f6784f8901f8/AL090142_web_1440.jpg?1698171883',
                  width: 70,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(width: 30),
            // Added SizedBox to create vertical space
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  const Text(
                    "Station Name : ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    singlebook.vehicleModelName,
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Vehicle : ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    singlebook.vehicleBrand,
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
                    singlebook.vehiclePlateNumber,
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Location : ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    singlebook.location,
                    style: const TextStyle(color: Colors.black),
                  ),
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.black,
                  )
                ],
              ),
              // Row(
              //   children: [
              //     const Text(
              //       "Status: ",
              //       style: TextStyle(fontWeight: FontWeight.bold),
              //     ),
              // Container(
              //   decoration: BoxDecoration(
              //     shape: BoxShape.rectangle,
              //     borderRadius: BorderRadius.circular(5),
              //     color: statusColor,
              //   ),
              //   padding: const EdgeInsets.symmetric(
              //       horizontal: 5, vertical: 2),
              // child: Text(
              //   station.status.toString().split('.').last,
              //   style: const TextStyle(color: Colors.white),
              // ),
              // ${station.status.toString().split('.').last}
            ]),
          ],
        ),
      ),
    );
  }
}
