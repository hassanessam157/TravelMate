import 'package:flutter/material.dart';
import 'package:tavel_app/restaurant/RestaurantDetailScreen.dart';

class PopularRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Set a fixed height for horizontal scrolling
      child: ListView(
        scrollDirection: Axis.horizontal, // Enables horizontal scrolling
        children: [
          restaurantCard(
            context,
            name: 'The Gourmet Garden',
            description:
                'Fine dining experience A sanctuary for food enthusiasts,'
                ' The Gourmet Garden combines farm-to-table freshness with culinary artistry.'
                ' This enchanting restaurant offers a menu inspired by seasonal'
                ' ingredients, featuring vibrant salads, handcrafted pastas,'
                ' and decadent desserts. Set amidst lush greenery and warm lighting,'
                ' The Gourmet Garden creates a serene dining experience '
                'that’s as delightful for the eyes as it is for the palate.'
                ' Perfect for romantic dinners, family celebrations,'
                ' or anyone seeking a touch of elegance in every bite.',
            image: 'assets/restaurant/popular/gourmet.jpg',
            starRating: 5,
          ),
          restaurantCard(
            context,
            name: 'Ocean View Diner',
            description: 'Seafood and family dining'
                'Savor the stunning ocean vistas while enjoying a'
                ' delicious meal at Ocean View Diner. This family-friendly spot '
                'specializes in comfort food with a seaside twist,'
                ' offering everything from crispy fish tacos to decadent seafood'
                ' pasta. With its laid-back vibe and spectacular views,'
                ' it’s the perfect place for a leisurely lunch or a romantic sunset'
                ' dinner.',
            image: 'assets/restaurant/whitesea.jpg',
            starRating: 4,
          ),
          restaurantCard(
            context,
            name: 'Mountain Bistro',
            description: 'Cozy spot with mountain views'
                'Surrounded by breathtaking mountain views,'
                ' Mountain Bistro serves hearty, soul-warming meals inspired'
                ' by rustic cuisine. From slow-cooked stews to freshly baked'
                ' bread and gourmet hot chocolates, this bistro is the perfect'
                ' retreat after a day of exploring. The cozy wooden interiors'
                ' and roaring fireplace make it an ideal spot for relaxation'
                ' and comfort.',
            image: 'assets/restaurant/popular/mountain.jpg',
            starRating: 5,
          ),
          restaurantCard(
            context,
            name: 'City Lights Café',
            description: 'Coffee and light snacks'
                'Nestled in the heart of the city,'
                ' City Lights Café offers a chic and relaxing escape. '
                'Known for its aromatic coffee, artisanal pastries,'
                ' and hearty brunches, this café is a favorite among '
                'locals and visitors alike. Whether you’re enjoying a '
                'quiet morning with a latte or an evening dessert under'
                ' twinkling lights, City Lights Café delivers an unforgettable '
                ' urban dining experience.',
            image: 'assets/restaurant/popular/city.jpg',
            starRating: 3,
          ),
          restaurantCard(
            context,
            name: 'Sunset Paradise',
            description: 'Seafood with sunset views'
                'A fine dining experience specializing in fresh seafood.'
                'Indulge in the freshest catch at Seafood Delight,'
                ' where the ocean meets your plate. '
                'From buttery lobster tails to tangy ceviche, '
                'every dish is crafted with the finest ingredients'
                ' and a passion for seafood. A cozy ambiance paired'
                ' with nautical decor ensures a dining experience'
                ' that transports you straight to the seaside.',
            image: 'assets/restaurant/popular/sunset.jpg',
            starRating: 4,
          ),
        ],
      ),
    );
  }

  Widget restaurantCard(BuildContext context,
      {required String name,
      required String description,
      required String image,
      required double starRating}) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestaurantDetailsScreen(
                  name: name,
                  description: description,
                  image: image,
                  starRating: starRating),
            ),
          );
        },
        child: Container(
          width: 160, // Fixed width for each card in horizontal scrolling
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Restaurant image
              Container(
                height: 80,
                width: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(height: 8),
              // Restaurant name
              Text(
                name,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              // Description
              Text(
                description,
                style: TextStyle(fontSize: 12, color: Colors.grey),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              // Star Rating Row
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    index < starRating ? Icons.star : Icons.star_border,
                    color: Colors.orange,
                    size: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
