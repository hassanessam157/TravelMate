import 'package:flutter/material.dart';
import 'package:tavel_app/home/HotelDetailScreen.dart';
import '../models/Hotel.dart';

class PopularHotels extends StatelessWidget {
  // List of predefined hotels
  final List<Hotel> hotels = [
    Hotel(
      name: 'The Grand Resort',
      description: 'Luxury hotel with all the modern amenities.'
          'Step into timeless luxury at The Grand Hotel,'
          ' an iconic destination known for its opulent interiors,'
          ' exceptional service, and world-class amenities.'
          ' Ideal for both leisure and business travelers,'
          ' the hotel features spacious rooms, gourmet dining options,'
          ' and a rooftop pool with stunning city views.'
          ' Experience grandeur at every turn.',
      image: 'assets/hotels/grand.jpg',
      starRating: 4.8,
    ),
    Hotel(
      name: 'City Comfort Inn',
      description: 'Cozy and affordable hotel'
          'Located in the heart of the city,'
          ' the City Center Inn offers a cozy and convenient stay for urban explorers.'
          ' This boutique hotel combines modern design with comfort,'
          ' providing easy access to shopping, dining, and cultural landmarks.'
          ' Perfect for a weekend getaway or a business trip.',
      image: 'assets/hotels/city.jpg',
      starRating: 4.5,
    ),
    Hotel(
      name: 'Mountain Lodge',
      description: 'Experience comfort in the mountains'
          'Escape into the serene beauty of mountain landscapes.'
  'Nestled in the serene mountains,'
    'the Mountain Lodge is a cozy retreat for nature lovers.'
    ' With its rustic charm, crackling fireplaces,'
    ' and panoramic views, this lodge offers a perfect blend of comfort and adventure.'
    ' Ideal for hiking enthusiasts or anyone seeking tranquility.',
      image: 'assets/hotels/mountian.jpg',
      starRating: 4.2,
    ),
    Hotel(
      name: 'Beachside Retreat',
      description: 'Relax by the beach'
          'Escape into the serene beauty of mountain landscapes.'
          'Unwind at the Beachside Retreat,'
          ' a charming getaway with direct beach access and stunning sunsets. '
          'This boutique hotel offers stylish rooms, personalized service,'
          ' and a laid-back ambiance. A dream destination for couples and families alike.',
      image: 'assets/hotels/beach.jpg',
      starRating: 5.0,
    ),
    Hotel(
      name: 'Urban Oasis',
      description: 'Modern vibes with city views'
          'Discover a chic and vibrant escape at the Urban Oasis,'
          ' a modern hotel designed for the cosmopolitan traveler.'
          ' With its sleek interiors, rooftop lounge, and state-of-the-art facilities,'
          ' this hotel offers a refreshing haven amidst the bustling cityscape.'
          ' Perfect for business and leisure.',
      image: 'assets/hotels/seaview.jpg',
      starRating: 4.3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220, // Set a fixed height for the scrollable list
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          return _buildHotelCard(context, hotel: hotels[index]);
        },
      ),
    );
  }

  Widget _buildHotelCard(BuildContext context, {required Hotel hotel}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelDetailScreen(
              hotelName: hotel.name,
              hotelDescription: hotel.description,
              hotelImageUrl: hotel.image,
              hotelStarRating: hotel.starRating,
              hotel: hotel,
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
              // Hotel Image
              Container(
                height: 100,
                width: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(hotel.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 8),
              // Hotel Name
              Text(
                hotel.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              // Description
              Text(
                hotel.description,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              // Star Rating
              _buildStarRating(hotel.starRating),
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

