import 'package:flutter/material.dart';

class BookingFlightScreen extends StatefulWidget {
  static const String routename = 'bookingFlights';

  @override
  _BookingFlightScreenState createState() => _BookingFlightScreenState();
}

class _BookingFlightScreenState extends State<BookingFlightScreen> {
  DateTime? _checkInDate;
  DateTime? _checkOutDate;
  bool _isOneWay = false; // Toggle for one-way trip

  Future<void> _selectDate(BuildContext context, String label) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null) {
      setState(() {
        if (label == 'Check In Date') {
          _checkInDate = pickedDate;
        } else if (label == 'Check Out Date') {
          _checkOutDate = pickedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Now'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Let\'s Travel Together',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'One-Way Trip',
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                    value: _isOneWay,
                    onChanged: (value) {
                      setState(() {
                        _isOneWay = value;
                        if (_isOneWay) {
                          _checkOutDate = null; // Reset check-out date
                        }
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              _buildDestinationField(),
              SizedBox(height: 10),
              _buildDateField('Check In Date'),
              SizedBox(height: 10),
              if (!_isOneWay) _buildDateField('Check Out Date'), // Hide for one-way trips
              SizedBox(height: 20),
              _buildGuestsField(),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_checkInDate == null || (!_isOneWay && _checkOutDate == null)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select all required dates!')),
                    );
                  } else {
                    String tripType = _isOneWay ? 'One-Way' : 'Round Trip';
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Flight booked: $tripType\n'
                              'From: ${_checkInDate!.toLocal()}'
                              '${!_isOneWay ? '\nTo: ${_checkOutDate!.toLocal()}' : ''}',
                        ),
                      ),
                    );
                  }
                },
                child: Text('Booking'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  minimumSize: Size(double.infinity, 0), // Full width button
                ),
              ),
            ],
          ),
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

  Widget _buildDateField(String label) {
    return InkWell(
      onTap: () => _selectDate(context, label),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        child: Text(
          label == 'Check In Date'
              ? (_checkInDate != null
              ? '${_checkInDate!.toLocal()}'.split(' ')[0]
              : 'Select Date')
              : (_checkOutDate != null
              ? '${_checkOutDate!.toLocal()}'.split(' ')[0]
              : 'Select Date'),
        ),
      ),
    );
  }

  Widget _buildGuestsField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: _buildGuestInput('Adults')),
        SizedBox(width: 10),
        Expanded(child: _buildGuestInput('Children')),
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
