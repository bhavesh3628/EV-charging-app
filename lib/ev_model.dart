enum Status { Enable, Disable }

class Ev_model {
  Ev_model(
      {required this.ev_city, required this.station_name, required this.status});
  final String ev_city;
  final Status status;
  final String station_name;
}

class Station {
  Station({required this.city, required this.name});

  final String name;
  final String city;
}

class Booking {
  final int id;
  final int userId;
  final DateTime startTime;
  final DateTime endTime;
  final String location; // Additional constraint

  // Constraints related to the booked vehicle
  final String vehicleModelName;
  final String vehicleBrand;
  final String vehiclePlateNumber;

  Booking({
    required this.id,
    required this.userId,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.vehicleModelName,
    required this.vehicleBrand,
    required this.vehiclePlateNumber,
  });
}
