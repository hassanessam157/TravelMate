import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HotelBookingScreen extends StatefulWidget {
  final String hotelId;
  final String hotelName;

  HotelBookingScreen({required this.hotelId, required this.hotelName});

  @override
  _HotelBookingScreenState createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _checkInDateController = TextEditingController();
  final TextEditingController _checkOutDateController = TextEditingController();
  final TextEditingController _adultsController = TextEditingController();
  final TextEditingController _childrenController = TextEditingController();
  final TextEditingController _roomsController = TextEditingController();

  final CollectionReference bookingsRef =
      FirebaseFirestore.instance.collection('hotel_bookings');

  @override
  void dispose() {
    _destinationController.dispose();
    _checkInDateController.dispose();
    _checkOutDateController.dispose();
    _adultsController.dispose();
    _childrenController.dispose();
    _roomsController.dispose();
    super.dispose();
  }

  Future<void> _submitBooking(BuildContext context) async {
    if (!_validateInputs()) return;

    try {
      await bookingsRef.add({
        'hotelId': widget.hotelId,
        'hotelName': widget.hotelName,
        'destination': _destinationController.text,
        'checkInDate': _checkInDateController.text,
        'checkOutDate': _checkOutDateController.text,
        'adults': int.tryParse(_adultsController.text) ?? 0,
        'children': int.tryParse(_childrenController.text) ?? 0,
        'rooms': int.tryParse(_roomsController.text) ?? 0,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Booking submitted successfully!')),
      );

      print("Booking submitted .");
      Navigator.pop(context);
    } catch (error) {
      print("Error submitting booking: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error submitting booking: $error')),
      );
    }
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      controller.text = "${selectedDate.toLocal()}".split(' ')[0];
    }
  }

  bool _validateInputs() {
    if (_destinationController.text.isEmpty ||
        _checkInDateController.text.isEmpty ||
        _checkOutDateController.text.isEmpty ||
        _adultsController.text.isEmpty ||
        _roomsController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields!')),
      );
      return false;
    }

    if (int.tryParse(_adultsController.text) == null ||
        int.tryParse(_adultsController.text)! <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Number of adults must be valid and > 0')),
      );
      return false;
    }

    if (int.tryParse(_roomsController.text) == null ||
        int.tryParse(_roomsController.text)! <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Number of rooms must be valid and > 0')),
      );
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book a Hotel'),
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
                'Booking for ${widget.hotelName}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildDestinationField(),
              const SizedBox(height: 10),
              _buildDateField('Check-in Date', _checkInDateController),
              const SizedBox(height: 10),
              _buildDateField('Check-out Date', _checkOutDateController),
              const SizedBox(height: 10),
              _buildGuestInput('Adults', _adultsController),
              const SizedBox(height: 10),
              _buildGuestInput('Children', _childrenController),
              const SizedBox(height: 10),
              _buildGuestInput('Rooms', _roomsController),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _submitBooking(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  minimumSize: const Size(double.infinity, 0),
                ),
                child: const Text(
                  'Submit Booking',
                  style: TextStyle(fontSize: 16),
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
      controller: _destinationController,
      decoration: const InputDecoration(
        labelText: 'Destination',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.location_on),
      ),
    );
  }

  Widget _buildDateField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        suffixIcon: const Icon(Icons.calendar_today),
      ),
      onTap: () => _selectDate(context, controller),
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
