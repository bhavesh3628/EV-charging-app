enum Status { Enable, Disable }

class Ev_model {
  Ev_model(
      {required this.model_name,
      required this.plate_number,
      required this.userId});

  final String model_name;
  // final Status List<Booking>vehicle;
  // final String station_name;
  final String plate_number;
  final int userId;
}

class Station {
  Station(
      {required this.s_name,
      required this.latitude,
      required this.longitude,
      this.Station_Id = '01'});

  final String s_name;
  final String latitude;
  final String longitude;
  final String Station_Id;
  // final
}

class Booking {
  final int booking_id;
  final int userId;
  final DateTime startTime;
  final DateTime endTime;
  final String location; // Additional constraint

  // Constraints related to the booked vehicle
  final String vehicleModelName;
  final String vehicleBrand;
  final String vehiclePlateNumber;

  Booking({
    required this.booking_id,
    required this.userId,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.vehicleModelName,
    required this.vehicleBrand,
    required this.vehiclePlateNumber,
  });
}
