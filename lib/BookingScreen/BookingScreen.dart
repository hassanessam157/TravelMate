import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  static const String routename = 'booking';
  final String hotelId;
  final String hotelName;

  BookingScreen({required this.hotelId, required this.hotelName});

  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _checkInDateController = TextEditingController();
  final TextEditingController _checkOutDateController = TextEditingController();
  final TextEditingController _adultsController = TextEditingController();
  final TextEditingController _childrenController = TextEditingController();
  final TextEditingController _roomsController = TextEditingController();

  final DatabaseReference _bookingRef =
  FirebaseDatabase.instance.ref().child('bookings');

  Future<void> _submitBooking() async {
    try {
      await _bookingRef.push().set({
        'hotelId': hotelId,
        'hotelName': hotelName,
        'destination': _destinationController.text,
        'checkInDate': _checkInDateController.text,
        'checkOutDate': _checkOutDateController.text,
        'adults': int.tryParse(_adultsController.text) ?? 0,
        'children': int.tryParse(_childrenController.text) ?? 0,
        'rooms': int.tryParse(_roomsController.text) ?? 0,
      });
      print('Booking saved successfully!');
    } catch (error) {
      print('Error saving booking: $error');
    }
  }

  // Function to show date picker and update the controller
  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null && selectedDate != DateTime.now()) {
      controller.text = "${selectedDate.toLocal()}".split(' ')[0]; // Format as yyyy-mm-dd
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Now'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Booking for $hotelName',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildDestinationField(),
              const SizedBox(height: 10),
              _buildDateField('Check In Date', _checkInDateController, context),
              const SizedBox(height: 10),
              _buildDateField('Check Out Date', _checkOutDateController, context),
              const SizedBox(height: 10),
              _buildGuestsField(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitBooking,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  minimumSize: const Size(double.infinity, 0),
                ),
                child: const Text('Submit Booking'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDestinationField() {
    return TextField(
      controller: _destinationController,
      decoration: const InputDecoration(
        labelText: 'Destination',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.location_on),
      ),
    );
  }


  // Date field for both Check-In and Check-Out
  Widget _buildDateField(String label, TextEditingController controller, BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        suffixIcon: const Icon(Icons.calendar_today),
      ),
      onTap: () => _selectDate(context, controller), // Show date picker when tapped
    );
  }

  Widget _buildGuestsField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: _buildGuestInput('Adults', _adultsController)),
        const SizedBox(width: 10),
        Expanded(child: _buildGuestInput('Children', _childrenController)),
        const SizedBox(width: 10),
        Expanded(child: _buildGuestInput('Rooms', _roomsController)),
      ],
    );
  }

  Widget _buildGuestInput(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }
}
