


import 'package:flutter/material.dart';

import 'package:tavel_app/home/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  static const String routename = 'splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  // Navigate to the HomeScreen after a delay
  Future<void> _navigateToHome() async {
    await Future.delayed(Duration(seconds: 5)); // Delay for 2 seconds
    Navigator.of(context).pushReplacementNamed(HomeScreen.routename);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('TravelMate',style:TextStyle(fontSize: 50,
              color: Colors.orange,
              ),),
          Center(
            child: Icon(
              Icons.handshake,
              size: 80.0,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}