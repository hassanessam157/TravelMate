import 'package:flutter/material.dart';

import '../models/Restuarant.dart';
 // Import the Restaurant model

class RestaurantOptionsScreen extends StatelessWidget {
  final List<Restaurant> restaurants = [
    Restaurant(
      name: 'Italian Delight',
      imageUrl: 'https://via.placeholder.com/150',
      starRating: 4.5,
      cuisine: 'Italian',
    ),
    Restaurant(
      name: 'Sushi World',
      imageUrl: 'https://via.placeholder.com/150',
      starRating: 5.0,
      cuisine: 'Japanese',
    ),
    Restaurant(
      name: 'Burger Haven',
      imageUrl: 'https://via.placeholder.com/150',
      starRating: 4.0,
      cuisine: 'American',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Options'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(
                restaurant.imageUrl,
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
              title: Text(restaurant.name),
              subtitle: Text(
                  '${restaurant.starRating} ⭐ - ${restaurant.cuisine} Cuisine'),
              onTap: () {
                // Handle navigation or details
              },
            ),
          );
        },
      ),
    );
  }
}
