import 'package:flutter/material.dart';
import 'package:tavel_app/BookingScreen/bookingFlights.dart';

class FlightOptionsScreen extends StatelessWidget {
  static const String routename='flightoptions';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Flight '),
        elevation: 10,
      ),
      body: ListView(
        children: [
          _buildFlightOption(
            context,
            "Flight 101",
            "NYC → LA",
            "Departure: 10:00 AM",
            "Arrival: 1:00 PM",
            "Price: \$300",
          ),
          _buildFlightOption(
            context,
            "Flight 202",
            "NYC → SF",
            "Departure: 11:00 AM",
            "Arrival: 2:00 PM",
            "Price: \$350",
          ),
          _buildFlightOption(
            context,
            "Flight 210",
            "LA → NYC",
            "Departure: 9:00 AM",
            "Arrival: 12:00 PM",
            "Price: \$200",
          ),
          _buildFlightOption(
            context,
            "Flight 301",
            "LA → CHI",
            "Departure: 9:00 AM",
            "Arrival: 12:00 PM",
            "Price: \$230",
          ),
          _buildFlightOption(
            context,
            "Flight 300",
            "SF → CHI",
            "Departure: 9:00 AM",
            "Arrival: 12:00 PM",
            "Price: \$250",
          ),
          _buildFlightOption(
            context,
            "Flight 111",
            "CHI → SF",
            "Departure: 9:00 AM",
            "Arrival: 12:00 PM",
            "Price: \$200",
          ),
          _buildFlightOption(
            context,
            "Flight 302",
            "LA → SF",
            "Departure: 9:00 AM",
            "Arrival: 12:00 PM",
            "Price: \$250",
          ),
          _buildFlightOption(
            context,
            "Flight 305",
            "CHI → SF",
            "Departure: 9:00 AM",
            "Arrival: 12:00 PM",
            "Price: \$200",
          ),
          _buildFlightOption(
            context,
            "Flight 304",
            "SF → LA",
            "Departure: 9:00 AM",
            "Arrival: 12:00 PM",
            "Price: \$200",
          ),
        ],
      ),
    );
  }

  Widget _buildFlightOption(
      BuildContext context,
      String flightNumber,
      String route,
      String departure,
      String arrival,
      String price,
      ) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: Icon(Icons.flight, color: Colors.blue),
        title: Text(flightNumber),
        subtitle: Text('$route\n$departure\n$arrival\n$price'),
        isThreeLine: true,
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(BookingFlightScreen.routename);
          },
          child: Text('Book'),
        ),
      ),
    );
  }
}
