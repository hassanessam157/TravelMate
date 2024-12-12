import 'package:flutter/material.dart';
import '../location/LocationDetailsScreen.dart';
import '../models/Location.dart';

class PopularLocations extends StatelessWidget {
  // List of predefined locations
  final List<Location> locations = [
    Location(
      name: 'Sharm El Sheikh',
      description1: 'The city of lights with rich history',
      image: 'assets/location/popular/sharm.jpg',
      starRating: 4.9,
      description2: 'Sharm El-Sheikh, a resort town on the southern tip of the Sinai Peninsula,'
          ' is one of Egypts premier tourist destinations.'
          ' With its luxury hotels, vibrant nightlife, and world-class dive sites,'
          ' it’s a favorite for families and thrill-seekers alike.'
          ' The Ras Mohammed National Park, with its pristine beaches and unique marine biodiversity,'
          ' is a must-visit. Sharm is also a gateway to Mount Sinai and Saint Catherine’s Monastery,'
          ' combining relaxation with cultural exploration.'
    ),
    Location(
      name: 'North South',
      description1: 'The city that never sleeps',
      image: 'assets/location/popular/northSouth.jpg',
      starRating: 4.7,
      description2: 'The North Coast, or Sahel,'
          ' stretches along Egypt’s Mediterranean coastline and is famed for its stunning turquoise waters and white sandy beaches.'
          ' Popular among Egyptians for summer getaways, it offers a mix of serene retreats and lively resorts.'
          ' Locations like Marina and Hacienda feature luxury accommodations,'
          ' water sports, and entertainment venues. '
          'The area also boasts historical sites like El Alamein,'
          ' known for its World War II memorials.'
    ),
    Location(
      name: 'Dahab',
      description1: 'Experience the blend of tradition and technology',
      image: 'assets/location/popular/dahab.jpg',
      starRating: 4.8,
      description2: 'Dahab, located on the southeast coast of the Sinai Peninsula in Egypt,'
          ' is a haven for adventurers and beach lovers.'
          ' Known for its laid-back vibe, '
          'crystal-clear waters, and stunning coral reefs,'
          ' Dahab is a top destination for diving and snorkeling enthusiasts.'
          ' The Blue Hole, one of the world’s most famous dive sites,'
          ' attracts divers from across the globe. Beyond the water,'
          ' Dahab offers desert adventures like camel rides,'
          ' sandboarding, and camping under the stars.'
    ),
    Location(
      name: 'Hurghada',
      description1: 'Luxury shopping and architecture',
      image: 'assets/location/popular/huardge.jpeg',
      starRating: 5.0,
      description2: 'Hurghada, situated along the Red Sea coast,'
          ' is a bustling city known for its year-round sunshine and vibrant underwater world.'
          ' It’s a hub for water sports, offering activities like diving, kite surfing, and deep-sea fishing.'
          ' The Giftun Islands, just off the coast, provide a picturesque escape with pristine beaches and excellent snorkeling opportunities.'
          ' Hurghada also has a lively marina, numerous restaurants, and bazaars that reflect the local culture.'
    ),
    Location(
      name: 'El Gouna',
      description1: 'Harbor views and iconic beaches',
      image: 'assets/location/popular/Elgona.jpg',
      starRating: 4.6,
      description2: 'El Gouna, a chic and eco-friendly resort town near Hurghada,'
          ' is known for its unique architecture and tranquil lagoons.'
          ' Designed as a luxury destination,'
          ' it features upscale resorts, a golf course,'
          ' and high-end dining options.'
          ' The town is a hotspot for water sports,'
          ' especially kite surfing and diving. '
          'Its marina is a picturesque spot to relax, dine,'
          ' or shop. El Gouna is often called the "Venice of the Red Sea"'
          ' due to its interconnected canals and beautiful views.'
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
              locationDescription1: location.description1,
              locationDescription2: location.description2,
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
                location.description1,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              // Star Rating
              _buildStarRating(location.starRating),
              Text(
                location.description2,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                overflow: TextOverflow.ellipsis,
              ),
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
