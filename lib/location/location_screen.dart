import 'package:flutter/material.dart';

import 'package:tavel_app/location/LocationDetailsScreen.dart';
import 'package:tavel_app/models/Location.dart';

class LocationScreen extends StatelessWidget {
  static const String routename='LocationScreen';

  final List<Location> locations = [
    Location(
      name: "Cairo",
      image: "assets/location/popular/cairo.jpg",
      starRating: 4.6,
      description: "Explore history, culture, and modern attractions.",
    ),
    Location(
      name: "Dahab",
      image: "assets/location/dahab.jpg",
      starRating: 4.8,
      description: "Experience breathtaking views at the Grand Canyon.",
    ),
    Location(
      name: "North South",
      image: "assets/location/northsouth.jpg",
      starRating: 4.9,
      description: "The city of love with iconic landmarks.",
    ),
    Location(
      name: "Hurghada",
      image: "assets/location/hurghada.jpeg",
      starRating: 4.7,
      description: "Experience modern life with traditional charm.",
    ),
    Location(
      name: "El Gouna",
      image: "assets/location/Elgona.jpg",
      starRating: 4.9,
      description: "A tropical paradise with stunning beaches.",
    ),
    Location(
      name: "Sharm El Sheikh",
      image: "assets/location/sharm.jpg",
      starRating: 4.6,
      description: "Explore history, culture, and modern attractions.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Locations'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return _buildLocationCard(
            context,
            locations[index],
          );
        },
      ),
    );
  }

  Widget _buildLocationCard(BuildContext context, Location location) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                LocationDetailScreen(
                    locationName:location.name,
                    locationDescription:location.description,
                    locationImage: location.image,
                    locationStarRating: location.starRating,
                    location: location),
          ),
        );
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              location.image,
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                location.name,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                location.description,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: List.generate(
                location.starRating.toInt(),
                    (index) => const Icon(Icons.star, color: Colors.yellow, size: 16),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
