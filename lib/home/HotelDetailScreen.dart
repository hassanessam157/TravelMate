import 'package:flutter/material.dart';
import 'package:tavel_app/BookingScreen/BookingScreen.dart';
import 'package:tavel_app/models/Hotel.dart';

class HotelDetailScreen extends StatelessWidget {
  final Hotel hotel;

  final String hotelName;
  final String hotelDescription;
  final String hotelImageUrl;
  final double hotelStarRating;

  const HotelDetailScreen({
    Key? key,
    required this.hotelName,
    required this.hotelDescription,
    required this.hotelImageUrl,
    required this.hotelStarRating, required this.hotel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hotel.name),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hotel Image
            Image.asset(
              hotel.image,
              fit: BoxFit.cover,
              height: 250,
              width: double.infinity,
            ),
            SizedBox(height: 8),

            // Hotel name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                hotel.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 4),

            // Hotel description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                hotel.description,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ),
            SizedBox(height: 8),

            // Stars Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: List.generate(
                  hotel.starRating.toInt(),
                      (index) => Icon(Icons.star, color: Colors.yellow, size: 20),
                ),
              ),
            ),
            SizedBox(height: 8),

            // Booking Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => BookingScreen()),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Booking ${hotel.name}')),
                  );
                },
                child: Text('Book Now'),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
