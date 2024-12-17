import 'package:flutter/material.dart';
import 'package:tavel_app/Hotel/HotelScreen.dart';
import 'package:tavel_app/Hotel/PopularHotel.dart';
import 'package:tavel_app/flights/FlightOptionsScreen.dart';
import 'package:tavel_app/home/SettingScreen.dart';
import 'package:tavel_app/location/Location_screen.dart';
import 'package:tavel_app/location/PopularLocation.dart';
import 'package:tavel_app/restaurant/PopularRestaurants.dart';
import 'package:tavel_app/restaurant/RestaurantScreen.dart';

// Main HomeScreen with navigation
class HomeScreen extends StatefulWidget {
  static const String routename = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Default index for navigation state

  // List of screens to navigate to
  final List<Widget> _screens = [
    MainHomeScreen(),
    LocationScreen(),
    SettingsScreen() // Added LocationScreen to navigation
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Dynamically render the active screen
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
            icon: Icon(Icons.location_on),
            label: "Location",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
          ),
        ],
      ),
    );
  }
}

// Main Home UI with sections for popular features and clickable lists
class MainHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome In TravelMate'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Let\'s Travel Together',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Popular Tabs Section
              PopularTabsSection(),
              SizedBox(height: 20),
              // Restaurant Posts Section
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(HotelScreen.routename);
                },
                child: const Text(
                  'Popular Restaurants',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              PopularRestaurants(),
              SizedBox(height: 20),
              // Hotel Posts Section
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(HotelScreen.routename);
                },
                child: const Text(
                  'Popular Hotels',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              PopularHotels(),
              SizedBox(height: 20),
              // Location Posts Section
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(LocationScreen.routename);
                },
                child: const Text(
                  'Popular Locations',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              PopularLocations()
            ],
          ),
        ),
      ),
    );
  }
}

// Section with three popular tabs (Restaurant, Hotel, Location)
class PopularTabsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildCategoryButton(Icons.flight, 'Flight', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FlightOptionsScreen()),
          );
        }),
        _buildCategoryButton(Icons.restaurant, 'Restaurant', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RestaurantScreen()),
          );
        }),
        _buildCategoryButton(Icons.hotel, 'Hotel', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HotelScreen()),
          );
        }),
        _buildCategoryButton(Icons.location_on, 'Location', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LocationScreen()),
          );
        }),
      ],
    );
  }

  Widget _buildCategoryButton(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: Colors.orange, size: 40),
          SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
// Example clickable location list
