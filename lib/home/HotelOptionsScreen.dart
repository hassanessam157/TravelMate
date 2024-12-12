
import 'package:flutter/material.dart';
import 'package:tavel_app/BookingScreen/BookingScreen.dart';

class HotelOptionsScreen extends StatelessWidget {
  static const String routename='hoteloptionsscreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel ',style: TextStyle(fontSize: 30),),
        backgroundColor: Colors.orange,
        elevation:0,
      ),
      body: ListView(
        children: [
          _buildHotelCard(
            context,
            'The Grand NYC Hotel',
            4,
            '5-star luxury hotel in NYC',
            'https://via.placeholder.com/150',
          ),
          _buildHotelCard(
            context,
            'Beachside Resort',
            5,
            'Beach view luxury resort in Florida',
            'https://via.placeholder.com/150',
          ),
          _buildHotelCard(
            context,
            'Mountain Lodge',
            4,
            'Cozy lodge near the Alps',
            'https://via.placeholder.com/150',
          ),
          _buildHotelCard(
            context,
            'City Lights Inn',
            3,
            'Budget-friendly option in Chicago',
            'https://via.placeholder.com/150',
          ),
        ],
      ),
    );
  }

  Widget _buildHotelCard(
      BuildContext context,
      String name,
      int stars,
      String description,
      String imageUrl,
      ) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hotel image
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: 150,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: List.generate(
                stars,
                    (index) => Icon(Icons.star, color: Colors.yellow, size: 16),
              ),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>BookingScreen()),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Booking $name')),
                );
              },
              child: Text('Book Now'),
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}