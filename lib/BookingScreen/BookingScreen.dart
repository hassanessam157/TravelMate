import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  static const String routename = 'booking';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking now'), centerTitle: true,
        backgroundColor: Colors.orange,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Let\'s Travel Together',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            _buildDestinationField(),
            SizedBox(height: 10),
            _buildTravelTypeField(),
            SizedBox(height: 10),
            _buildDateField('Check In Date'),
            SizedBox(height: 10),
            _buildDateField('Check Out Date'),
            SizedBox(height: 10),
            _buildGuestsField(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle search action
              },
              child: Text('SEARCH'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 15),
                minimumSize: Size(double.infinity, 0), // Full width button
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDestinationField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Destination',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.location_on),
      ),
    );
  }

  Widget _buildTravelTypeField() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Travel Type',
        border: OutlineInputBorder(),
      ),
      items: [
        DropdownMenuItem(child: Text('Train'), value: 'train'),
        DropdownMenuItem(child: Text('Flight'), value: 'flight'),
        DropdownMenuItem(child: Text('Car'), value: 'car'),
      ],
      onChanged: (value) {},
    );
  }

  Widget _buildDateField(String label) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        // Handle date picker
      },
    );
  }

  Widget _buildGuestsField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: _buildGuestInput('Adults')),
        SizedBox(width: 10),
        Expanded(child: _buildGuestInput('Children\'s')),
        SizedBox(width: 10),
        Expanded(child: _buildGuestInput('Rooms')),
      ],
    );
  }

  Widget _buildGuestInput(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }
}