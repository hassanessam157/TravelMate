import 'package:flutter/material.dart';
import 'package:tavel_app/BookingScreen/BookingHotelScreen.dart';
import 'package:tavel_app/models/Hotel.dart';

class HotelDetailScreen extends StatelessWidget {
  final Hotel hotel;

  HotelDetailScreen({
    Key? key,
    required this.hotel,
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
            Stack(
              children: [
                Image.asset(
                  hotel.image,
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: Colors.black.withOpacity(0.5),
                    child: Row(
                      children: [
                        Text(
                          '${hotel.starRating} ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Hotel Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                hotel.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                hotel.price,
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
            ),

            // Hotel Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                hotel.description1,
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                hotel.description2,
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
            ),
            SizedBox(height: 16),
            // Booking Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigating to the BookingScreen with hotel details
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HotelBookingScreen(
                            hotelId: hotel.hotelId, hotelName: hotel.name)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  'Book Now',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
