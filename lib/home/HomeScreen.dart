import 'package:flutter/material.dart';
import 'package:tavel_app/BookingScreen/BookingScreen.dart';
import 'package:tavel_app/location/SavedLocationScreen.dart';
import 'package:tavel_app/home/FlightOptionsScreen.dart';
import 'package:tavel_app/home/HotelOptionsScreen.dart';
import 'package:tavel_app/home/RestaurantOptionsScreen.dart';
import 'package:tavel_app/location/LocationDetailsScreen.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Default index for navigation state

  // List of screens to navigate to
  final List<Widget> _screens = [
    MainHomeScreen(), // Home Main Content
    SavedLocationsPage(), // Saved Locations
    BookingScreen(), // Booking
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Render the current active screen
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Handle navigation
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: "Booking",
          ),
        ],
      ),
    );
  }
}

// Main Home Screen Widget
class MainHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome In TravelMate'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Let\'s Travel Together',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildButton(
                  Icons.flight,
                  'Flights',
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FlightOptionsScreen()),
                    );
                  },
                ),
                _buildButton(
                  Icons.restaurant,
                  'Restaurant',
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RestaurantOptionsScreen()),
                    );
                  },
                ),
                _buildButton(
                  Icons.hotel,
                  'Hotel',
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HotelOptionsScreen()),
                    );
                  },
                ),
                _buildButton(
                  Icons.local_offer,
                  'Deals',
                      () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Deals feature coming soon!')),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Popular Locations',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildLocationCard(
                    context,
                    'The Mountains of North',
                    'https://via.placeholder.com/150',
                  ),
                  _buildLocationCard(
                    context,
                    'Beach Paradise',
                    'https://via.placeholder.com/150',
                  ),
                  _buildLocationCard(
                    context,
                    'Tropical Island',
                    'https://via.placeholder.com/150',
                  ),
                  _buildLocationCard(
                    context,
                    'City Lights',
                    'https://via.placeholder.com/150',
                  ),
                  _buildLocationCard(
                    context,
                    'Desert Oasis',
                    'https://via.placeholder.com/150',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(IconData icon, String label, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 40, color: Colors.orange),
          SizedBox(height: 8),
          Text(label, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }

  Widget _buildLocationCard(BuildContext context, String name, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LocationDetailScreen(locationName: name, imageUrl: image),
          ),
        );
      },
      child: Card(
        child: Container(
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                image,
                fit: BoxFit.cover,
                height: 100,
                width: 150,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
