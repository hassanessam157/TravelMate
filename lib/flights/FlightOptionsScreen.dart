import 'package:flutter/material.dart';
import 'package:tavel_app/flights/FlightDetailsScreen.dart';

class FlightOptionsScreen extends StatelessWidget {
  static const String routename = 'flightoptions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Available Flights'),
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
          // Add more flights here...
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
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FlightDetailsScreen(
                flightNumber: flightNumber,
                route: route,
                departure: departure,
                arrival: arrival,
                price: price,
              ),
            ));
          },
          child: Text('View Details'),
        ),
      ),
    );
  }
}
