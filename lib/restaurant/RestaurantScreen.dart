import 'package:flutter/material.dart';
import 'package:tavel_app/models/Restuarant.dart';
import 'package:tavel_app/restaurant/RestaurantDetailScreen.dart';

class RestaurantScreen extends StatelessWidget {
  static const String routename = 'RestaurantScreen';
  final List<Restaurant> restaurants = [
    Restaurant(
      name: 'Seafood Delight',
      image: 'assets/restaurant/popular/sunset.jpg',
      starRating: 4.5,
      description: 'A fine dining experience specializing in fresh seafood.'
          'Indulge in the freshest catch at Seafood Delight,'
          ' where the ocean meets your plate. '
          'From buttery lobster tails to tangy ceviche, '
          'every dish is crafted with the finest ingredients'
          ' and a passion for seafood. A cozy ambiance paired'
          ' with nautical decor ensures a dining experience'
          ' that transports you straight to the seaside.',
    ),
    Restaurant(
      name: 'The Vegetarian Feast',
      image: 'assets/restaurant/seaview.jpg',
      starRating: 4.0,
      description: 'A variety of vegetarian dishes made with organic produce.'
          'A haven for plant-based food lovers, '
          'The Vegetarian Feast offers an array of innovative'
          ' dishes bursting with flavor and nutrition.'
          ' From colorful Buddha bowls to sizzling veggie skewers,'
          ' the menu celebrates the art of vegetarian cooking.'
          ' Enjoy the warm and welcoming atmosphere where every meal feels'
          ' like a celebration of nature’s bounty.',
    ),
    Restaurant(
      name: 'Burger Paradise',
      image: 'assets/restaurant/roofsea.jpg',
      starRating: 4.8,
      description: 'Step into Burger Paradise,'
          ' the ultimate destination for burger enthusiasts.'
          ' Sink your teeth into juicy, '
          'perfectly grilled patties layered with gourmet toppings'
          ' and served on freshly baked buns. '
          'With options ranging from classic cheeseburgers to adventurous'
          ' creations, there’s something to satisfy every craving.'
          ' Pair it with loaded fries and creamy milkshakes for the perfect indulgence.',
    ),
    Restaurant(
      name: 'City Lights Café',
      image: 'assets/restaurant/popular/city.jpg',
      starRating: 4.8,
      description: 'Nestled in the heart of the city,'
          ' City Lights Café offers a chic and relaxing escape.'
          ' Known for its aromatic coffee, artisanal pastries,'
          ' and hearty brunches, this café is a favorite among'
          ' locals and visitors alike. Whether you’re enjoying '
          ' a quiet morning with a latte or an evening dessert under'
          ' twinkling lights, City Lights Café delivers an unforgettable'
          ' urban dining experience.',
    ),
    Restaurant(
      name: 'Mountain Bistro',
      image: 'assets/restaurant/popular/mountain.jpg',
      starRating: 3.6,
      description: 'Surrounded by breathtaking mountain views,'
          ' Mountain Bistro serves hearty, soul-warming meals inspired'
          ' by rustic cuisine. From slow-cooked stews to freshly baked'
          ' bread and gourmet hot chocolates, this bistro is the perfect'
          ' retreat after a day of exploring. The cozy wooden interiors'
          ' and roaring fireplace make it an ideal spot for relaxation'
          ' and comfort.',
    ),
    Restaurant(
      name: 'Ocean View Diner',
      image: 'assets/restaurant/whitesea.jpg',
      starRating: 2.7,
      description: 'Savor the stunning ocean vistas while enjoying a'
          ' delicious meal at Ocean View Diner. This family-friendly spot '
          'specializes in comfort food with a seaside twist,'
          ' offering everything from crispy fish tacos to decadent seafood'
          ' pasta. With its laid-back vibe and spectacular views,'
          ' it’s the perfect place for a leisurely lunch or a romantic sunset'
          ' dinner.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RestaurantDetailsScreen(
                    name: restaurants[index].name,
                    description: restaurants[index].description,
                    image: restaurants[index].image,
                    starRating: restaurants[index].starRating,
                  ),
                ),
              );
            },
            child: _buildRestaurantCard(context, restaurants[index]),
          );
        },
      ),
    );
  }

  Widget _buildRestaurantCard(BuildContext context, Restaurant restaurant) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            restaurant.image,
            fit: BoxFit.cover,
            height: 150,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              restaurant.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: List.generate(
                restaurant.starRating.toInt(),
                (index) => Icon(Icons.star, color: Colors.yellow, size: 16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              maxLines: 2,
              restaurant.description,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}
