
import 'package:flutter/material.dart';

class SavedLocationsPage extends StatelessWidget {
  static const String routename='savedlocation';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Locations'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildSavedLocationCard('North Area', '★★★★★ (150 reviews)',
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              'https://via.placeholder.com/150'),
          _buildSavedLocationCard('North Area', '★★★★★ (150 reviews)',
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              'https://via.placeholder.com/150'),
          _buildSavedLocationCard('North Area', '★★★★★ (150 reviews)',
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              'https://via.placeholder.com/150'),
        ],
      ),
    );
  }

  Widget _buildSavedLocationCard(String locationName, String reviews, String description, String imageUrl) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl, fit: BoxFit.cover, width: 100, height: 80),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(locationName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(reviews, style: TextStyle(fontSize: 14)),
                  SizedBox(height: 5),
                  Text(description, style: TextStyle(fontSize: 14)),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Book Now'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      minimumSize: Size(double.infinity, 0), // Full width button
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}