import 'package:flutter/material.dart';
import 'package:tavel_app/BookingScreen/bookingFlights.dart';

class FlightDetailsScreen extends StatelessWidget {
  final String flightNumber;
  final String route;
  final String departure;
  final String arrival;
  final String price;

  FlightDetailsScreen({
    required this.flightNumber,
    required this.route,
    required this.departure,
    required this.arrival,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Flight Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Flight Number: $flightNumber'),
            Text('Route: $route'),
            Text('Departure: $departure'),
            Text('Arrival: $arrival'),
            Text('Price: $price'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BookingFlightScreen(
                    flightNumber: flightNumber,
                    route: route,
                    price: price,
                  ),
                ));
              },
              child: Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}
