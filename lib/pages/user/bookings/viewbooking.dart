import 'package:ev_charging/pages/user/bookings/viewbooking_list.dart';
import 'package:flutter/material.dart';

import '../../../ev_model.dart';

class ViewBookings_Page extends StatelessWidget {
  ViewBookings_Page({super.key});
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 128, 209),
        title: const Text('Your Bookings'),
        leading: const Icon(Icons.arrow_back_outlined),
      ),
      body: View_List(booking_single: bookinglist),
    );
  }
}
