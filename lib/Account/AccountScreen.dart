import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  static const String routename='accountpage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Account'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Search the map', style: TextStyle(fontSize: 16)),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildAccountOption('Profile', Icons.person),
                _buildAccountOption('Messages', Icons.message),
                _buildAccountOption('Maps', Icons.map),
                _buildAccountOption('Privacy & Support', Icons.security),
                _buildAccountOption('Settings', Icons.settings),
                _buildAccountOption('Contact Us', Icons.contact_support),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle logout
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 15),
                minimumSize: Size(double.infinity, 0), // Full width button
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountOption(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(title, style: TextStyle(fontSize: 18)),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Handle navigation for each option
      },
    );
  }
}