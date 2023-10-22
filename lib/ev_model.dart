import 'package:flutter/material.dart';

enum Status { Enable, Disable }

class Ev_model {
  Ev_model(
      {required this.city, required this.station_name, required this.status});

  final String city;
  final String station_name;
  final Status status;
}
