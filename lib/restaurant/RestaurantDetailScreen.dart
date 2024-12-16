import 'package:flutter/material.dart';
import 'package:tavel_app/BookingScreen/bookingrestaurant.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  final double starRating;

  RestaurantDetailsScreen({
    required this.name,
    required this.description,
    required this.image,
    required this.starRating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Restaurant image
              Image.asset(
                image,
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
              SizedBox(height: 8),
              // Restaurant Name
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              // Description
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  description,
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ),
              SizedBox(height: 8),
              // Star Ratings
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: List.generate(
                    starRating.toInt(),
                    (index) => Icon(Icons.star, color: Colors.yellow, size: 20),
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Book Now Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookingrestaurantScreen()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Reserved at $name')),
                    );
                  },
                  child: Text('Reserve Now'),
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
