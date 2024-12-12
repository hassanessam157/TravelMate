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
      description1: "Explore history, culture, and modern attractions.",
      description2: 'Cairo, the sprawling capital of Egypt,'
          ' is a city that seamlessly blends history and modernity.'
          ' Known as the "City of a Thousand Minarets,'
          'Cairo is home to iconic landmarks like the Pyramids of Giza and the Sphinx.'
          ' The Egyptian Museum showcases ancient treasures,'
          ' including the golden mask of Tutankhamun.'
          ' Visitors can explore bustling markets like Khan El Khalili,'
          ' dine along the Nile River,'
          ' and marvel at Islamic architecture in Old Cairo.'
          ' The citys vibrant culture and energy make it a fascinating destination for all travelers.'
    ),
    Location(
      name: "Dahab",
      image: "assets/location/dahab.jpg",
      starRating: 4.8,
      description1: "Experience breathtaking views at the Grand Canyon.",
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
      name: "North South",
      image: "assets/location/northsouth.jpg",
      starRating: 4.9,
      description1: "The city of love with iconic landmarks.",
      description2: ' stretches along Egypt’s Mediterranean coastline and is famed for its stunning turquoise waters and white sandy beaches.'
          ' Popular among Egyptians for summer getaways, it offers a mix of serene retreats and lively resorts.'
          ' Locations like Marina and Hacienda feature luxury accommodations,'
          ' water sports, and entertainment venues. '
          'The area also boasts historical sites like El Alamein,'
          ' known for its World War II memorials.'
    ),
    Location(
      name: "Hurghada",
      image: "assets/location/hurghada.jpeg",
      starRating: 4.7,
      description1: "Experience modern life with traditional charm.",
      description2: 'Hurghada, situated along the Red Sea coast,'
          ' is a bustling city known for its year-round sunshine and vibrant underwater world.'
          ' It’s a hub for water sports, offering activities like diving, kite surfing, and deep-sea fishing.'
          ' The Giftun Islands, just off the coast, provide a picturesque escape with pristine beaches and excellent snorkeling opportunities.'
          ' Hurghada also has a lively marina, numerous restaurants, and bazaars that reflect the local culture.'

    ),
    Location(
      name: "El Gouna",
      image: "assets/location/Elgona.jpg",
      starRating: 4.9,
      description1: "A tropical paradise with stunning beaches.",
      description2:  'El Gouna, a chic and eco-friendly resort town near Hurghada,'
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
    Location(
      name: "Sharm El Sheikh",
      image: "assets/location/sharm.jpg",
      starRating: 4.6,
      description1: "Explore history, culture, and modern attractions.",
      description2: 'Sharm El-Sheikh, a resort town on the southern tip of the Sinai Peninsula,'
    ' is one of Egypts premier tourist destinations.'
        ' With its luxury hotels, vibrant nightlife, and world-class dive sites,'
        ' it’s a favorite for families and thrill-seekers alike.'
        ' The Ras Mohammed National Park, with its pristine beaches and unique marine biodiversity,'
        ' is a must-visit. Sharm is also a gateway to Mount Sinai and Saint Catherine’s Monastery,'
        ' combining relaxation with cultural exploration.'
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
                    locationDescription1:location.description1,
                    locationImage: location.image,
                    locationStarRating: location.starRating,
                    locationDescription2: location.description2,
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
                location.description1,
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
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                margin: EdgeInsets.only(bottom:7 ),
                child: Text(
                  maxLines: 1,
                  location.description2,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
