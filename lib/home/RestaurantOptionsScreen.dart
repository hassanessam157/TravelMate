import 'package:flutter/material.dart';

import '../models/Restuarant.dart';
 // Import the Restaurant model

class RestaurantOptionsScreen extends StatelessWidget {
  static const String routename='RestaurantOptionsScreen';
  final List<Restaurant> restaurants = [
    Restaurant(
      name: 'Italian Delight',
      image: 'https://via.placeholder.com/150',
      starRating: 4.5,
      description: '',

    ),
    Restaurant(
      name: 'Sushi World',
      image: 'https://via.placeholder.com/150',
      starRating: 5.0,
      description: '',

    ),
    Restaurant(
      name: 'Burger Haven',
      image: 'https://via.placeholder.com/150',
      starRating: 4.0,
      description: '',

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
                restaurant.image,
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
              title: Text(restaurant.name),
              subtitle: Text(
                  '${restaurant.starRating} ⭐ } Cuisine'),
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
