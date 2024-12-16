import 'package:flutter/material.dart';
import 'package:tavel_app/Hotel/HotelDetailScreen.dart';
import 'package:tavel_app/models/Hotel.dart';

class HotelScreen extends StatelessWidget {
  static const String routename = 'HotelScreen';

  final List<Hotel> hotels = [
    Hotel(
      hotelId: '1',
      name: 'The Grand Hotel',
      image: 'assets/hotels/grand.jpg',
      starRating: 5,
      price: 'Price: 2100',
      location: 'center citu',
      description1: 'Luxury hotel with all the modern amenities.',
      description2: 'Step into timeless luxury at The Grand Hotel, '
          'an iconic destination known for its opulent interiors, '
          'exceptional service, and world-class amenities. '
          'Ideal for both leisure and business travelers, '
          'the hotel features spacious rooms, gourmet dining options, '
          'and a rooftop pool with stunning city views. '
          'Experience grandeur at every turn.',
    ),
    Hotel(
      hotelId: '2',
      name: 'City Center Inn',
      image: 'assets/hotels/city.jpg',
      starRating: 4,
      price: 'Price: 2000',
      location: 'center citu',
      description1: 'A comfortable stay with central city access.',
      description2: 'Located in the heart of the city, '
          'the City Center Inn offers a cozy and convenient stay for urban explorers. '
          'This boutique hotel combines modern design with comfort, '
          'providing easy access to shopping, dining, and cultural landmarks. '
          'Perfect for a weekend getaway or a business trip.',
    ),
    Hotel(
      hotelId: '3',
      name: 'Beach Resort',
      image: 'assets/hotels/beach.jpg',
      starRating: 7,
      price: 'Price: 3500',
      location: 'center citu',
      description1: 'Enjoy beach views and relaxation with family.',
      description2: 'Escape to paradise at the Beach Resort, '
          'where the sun, sea, and sand converge. '
          'Enjoy breathtaking oceanfront views, luxurious suites, '
          'and an array of recreational activities, from watersports to spa treatments. '
          'A haven for relaxation and adventure alike.',
    ),
    Hotel(
      hotelId: '4',
      name: 'Mountain Lodge',
      image: 'assets/hotels/mountian.jpg',
      starRating: 5,
      price: 'Price: 2800',
      location: 'center citu',
      description1: 'Escape into the serene beauty of mountain landscapes.',
      description2: 'Nestled in the serene mountains, '
          'the Mountain Lodge is a cozy retreat for nature lovers. '
          'With its rustic charm, crackling fireplaces, and panoramic views, '
          'this lodge offers a perfect blend of comfort and adventure. '
          'Ideal for hiking enthusiasts or anyone seeking tranquility.',
    ),
    Hotel(
      hotelId: '5',
      name: 'Beachside Retreat',
      image: 'assets/hotels/beach.jpg',
      starRating: 5,
      price: ' Price: 2500',
      location: 'center citu',
      description1: 'Escape into the serene beauty of mountain landscapes.',
      description2: 'Unwind at the Beachside Retreat, '
          'a charming getaway with direct beach access and stunning sunsets. '
          'This boutique hotel offers stylish rooms, personalized service, '
          'and a laid-back ambiance. A dream destination for couples and families alike.',
    ),
    Hotel(
      hotelId: '6',
      name: 'Urban Oasis',
      image: 'assets/hotels/seaview.jpg',
      starRating: 5,
      price: 'Price: 2500',
      location: 'center citu',
      description1: 'Modern vibes with city views',
      description2: 'Discover a chic and vibrant escape at the Urban Oasis, '
          'a modern hotel designed for the cosmopolitan traveler. '
          'With its sleek interiors, rooftop lounge, and state-of-the-art facilities, '
          'this hotel offers a refreshing haven amidst the bustling cityscape. '
          'Perfect for business and leisure.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotels'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          final hotel = hotels[index];
          return _buildHotelCard(context, hotel);
        },
      ),
    );
  }

  Widget _buildHotelCard(BuildContext context, Hotel hotel) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hotel Image
          Image.asset(
            hotel.image,
            fit: BoxFit.cover,
            height: 150,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              hotel.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              hotel.description1,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: List.generate(
                hotel.starRating.toInt(),
                (index) => Icon(Icons.star, color: Colors.yellow, size: 16),
              ),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HotelDetailScreen(
                      hotel: hotel,
                    ),
                  ),
                );
              },
              child: Text('View Details'),
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
