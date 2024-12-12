import 'package:flutter/material.dart';

import '../location/LocationDetailsScreen.dart';
import '../models/Location.dart';

class PopularLocations extends StatelessWidget {
  // List of predefined locations
  final List<Location> locations = [
    Location(
      name: 'Sharm El Sheikh',
      description: 'The city of lights with rich history',
      image: 'assets/location/popular/sharm.jpg',
      starRating: 4.9,
    ),
    Location(
      name: 'North South',
      description: 'The city that never sleeps',
      image: 'assets/location/popular/northSouth.jpg',
      starRating: 4.7,
    ),
    Location(
      name: 'Dahab',
      description: 'Experience the blend of tradition and technology',
      image: 'assets/location/popular/dahab.jpg',
      starRating: 4.8,
    ),
    Location(
      name: 'Hurghada',
      description: 'Luxury shopping and architecture',
      image: 'assets/location/popular/huardge.jpeg',
      starRating: 5.0,
    ),
    Location(
      name: 'El Gouna',
      description: 'Harbor views and iconic beaches',
      image: 'assets/location/popular/Elgona.jpg',
      starRating: 4.6,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220, // Set a fixed height for horizontal scrolling
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return _buildLocationCard(context, location: locations[index]);
        },
      ),
    );
  }

  Widget _buildLocationCard(BuildContext context, {required Location location}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LocationDetailScreen(
              locationName: location.name,
              locationDescription: location.description,
              locationImage: location.image,
              locationStarRating: location.starRating,
              location: location,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Container(
          width: 160,
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Location Image
              Container(
                height: 100,
                width: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(location.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 8),
              // Location Name
              Text(
                location.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              // Description
              Text(
                location.description,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              // Star Rating
              _buildStarRating(location.starRating),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStarRating(double rating) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
            (index) {
          if (index < rating.floor()) {
            return const Icon(Icons.star, color: Colors.orange, size: 14);
          } else if (index < rating) {
            return const Icon(Icons.star_half, color: Colors.orange, size: 14);
          } else {
            return const Icon(Icons.star_border, color: Colors.orange, size: 14);
          }
        },
      ),
    );
  }
}
