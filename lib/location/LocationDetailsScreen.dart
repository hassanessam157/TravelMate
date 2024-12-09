import 'package:flutter/material.dart';
import '../models/Location.dart';

class LocationDetailScreen extends StatelessWidget {
  final String locationName;
  final String locationDescription;
  final String locationImage;
  final double locationStarRating;
  final Location location;

  const LocationDetailScreen({
    Key? key,
    required this.locationName,
    required this.locationDescription,
    required this.locationImage,
    required this.locationStarRating,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(locationName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              locationImage,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              locationName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              locationDescription,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              children: List.generate(
                5,
                    (index) {
                  if (index < locationStarRating.floor()) {
                    return const Icon(Icons.star, color: Colors.orange, size: 20);
                  } else if (index < locationStarRating) {
                    return const Icon(Icons.star_half, color: Colors.orange, size: 20);
                  } else {
                    return const Icon(Icons.star_border, color: Colors.orange, size: 20);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


