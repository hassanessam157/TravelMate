import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookingFlightScreen extends StatefulWidget {
  final String flightNumber;
  final String route;
  final String price;

  BookingFlightScreen({
    required this.flightNumber,
    required this.route,
    required this.price,
  });

  static const String routename = 'bookingFlights';

  @override
  _BookingFlightScreenState createState() => _BookingFlightScreenState();
}

class _BookingFlightScreenState extends State<BookingFlightScreen> {
  DateTime? _departureDate;
  DateTime? _returnDate;
  bool _isRoundTrip = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _adultsController = TextEditingController();
  TextEditingController _childrenController = TextEditingController();

  Future<void> _selectDate(BuildContext context, String label) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null) {
      setState(() {
        if (label == 'Departure Date') {
          _departureDate = pickedDate;
        } else if (label == 'Return Date') {
          _returnDate = pickedDate;
        }
      });
    }
  }

  Future<void> _saveBooking() async {
    if (_departureDate == null || (_isRoundTrip && _returnDate == null)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select all required dates!')),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('bookings').add({
        'flightNumber': widget.flightNumber,
        'route': widget.route,
        'departureDate': _departureDate?.toIso8601String(),
        'returnDate': _returnDate?.toIso8601String(),
        'passengerName': _nameController.text,
        'adults': _adultsController.text,
        'children': _childrenController.text,
        'price': widget.price,
        'tripType': _isRoundTrip ? 'Round Trip' : 'One-Way',
        'bookingTime': FieldValue.serverTimestamp(),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Booking saved successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving booking: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Flight'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Passenger Name'),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Round Trip'),
                Switch(
                  value: _isRoundTrip,
                  onChanged: (value) {
                    setState(() {
                      _isRoundTrip = value;
                      if (!_isRoundTrip) {
                        _returnDate = null; // Reset return date
                      }
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Text('Select Departure Date'),
            ElevatedButton(
              onPressed: () => _selectDate(context, 'Departure Date'),
              child: Text(_departureDate == null
                  ? 'Pick Date'
                  : _departureDate.toString()),
            ),
            if (_isRoundTrip)
              Column(
                children: [
                  SizedBox(height: 10),
                  Text('Select Return Date'),
                  ElevatedButton(
                    onPressed: () => _selectDate(context, 'Return Date'),
                    child: Text(_returnDate == null
                        ? 'Pick Date'
                        : _returnDate.toString()),
                  ),
                ],
              ),
            SizedBox(height: 20),
            TextField(
              controller: _adultsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Number of Adults'),
            ),
            TextField(
              controller: _childrenController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Number of Children'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveBooking,
              child: Text('Confirm Booking'),
            ),
          ],
        ),
      ),
    );
  }
}
