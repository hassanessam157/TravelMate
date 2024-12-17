class FlightBooking {
  String flightNumber;
  String route;
  DateTime checkInDate;
  DateTime? checkOutDate;
  String passengerName;
  String price;
  String tripType;

  FlightBooking({
    required this.flightNumber,
    required this.route,
    required this.checkInDate,
    this.checkOutDate,
    required this.passengerName,
    required this.price,
    required this.tripType,
  });

  Map<String, dynamic> toMap() {
    return {
      'flightNumber': flightNumber,
      'route': route,
      'checkInDate': checkInDate.toIso8601String(),
      'checkOutDate': checkOutDate?.toIso8601String(),
      'passengerName': passengerName,
      'price': price,
      'tripType': tripType,
    };
  }
}
