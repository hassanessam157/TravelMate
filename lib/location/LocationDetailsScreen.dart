import 'package:flutter/material.dart';

class LocationDetailScreen extends StatelessWidget {
  static const String routename = 'locationdetailscreen';
  final String locationName;
  final String imageUrl;

  LocationDetailScreen({
    required this.locationName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(locationName),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              locationName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: List.generate(
                4,
                    (index) => Icon(Icons.star, color: Colors.yellow, size: 20),
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Explore this beautiful location for relaxation and adventures!',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Booking for $locationName')),
                );
              },
              child: Text('Book Now'),
            ),
          ),
        ],
      ),
    );
  }
}
