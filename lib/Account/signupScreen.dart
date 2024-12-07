
import 'package:flutter/material.dart';
import 'package:tavel_app/Account/LoginScreen.dart';

class SignUpScreen extends StatelessWidget {
  static const String routename = 'signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(231, 2, 23, 23),
      appBar: AppBar(
      title: (Text('Sign UP')),centerTitle: true,
        backgroundColor: Color.fromARGB(255, 227, 70, 9),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView
          (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextField(label: 'Full Name'),
              _buildTextField(label: 'Email'),
              _buildTextField(label: 'Password', obscureText: true),
              _buildTextField(label: 'Confirm Password', obscureText: true),
              _buildTextField(label: 'Phone Number'),
              _buildTextField(label: 'Location'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(LoginScreen.routename);
                },
                child: Text('SIGN UP',style: (TextStyle(color: Colors.white)),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Button color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 100, vertical: 15),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("DON'T HAVE AN ACCOUNT?"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(SignUpScreen.routename);
                    },
                    child: const Text(
                      'SIGN IN',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}