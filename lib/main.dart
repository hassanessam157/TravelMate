import 'package:flutter/material.dart';
import 'package:tavel_app/Account/AccountScreen.dart';
import 'package:tavel_app/Account/LoginScreen.dart';
import 'package:tavel_app/Account/signupScreen.dart';
import 'package:tavel_app/BookingScreen/BookingScreen.dart';
import 'package:tavel_app/MainScreen.dart';
import 'package:tavel_app/home/FlightOptionsScreen.dart';
import 'package:tavel_app/home/HomeScreen.dart';
import 'package:tavel_app/location/LocationDetailsScreen.dart';
import 'package:tavel_app/location/SavedLocationScreen.dart';
import 'package:tavel_app/splash_screen.dart';
import 'package:flutter/material.dart';

void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:LoginScreen.routename ,
      routes: {
        SplashScreen.routename:(context)=>SplashScreen(),
        LoginScreen.routename:(context)=>LoginScreen(),
        HomeScreen.routename:(context)=>HomeScreen(),
        AccountScreen.routename:(context)=>AccountScreen(),
        SignUpScreen.routename:(context)=>SignUpScreen(),

    LocationDetailScreen.routename: (context) => LocationDetailScreen(
    locationName: ModalRoute.of(context)?.settings.arguments as String? ?? '',
    imageUrl: ModalRoute.of(context)?.settings.arguments as String? ?? '',
    ),
        SavedLocationsPage.routename:(context)=>SavedLocationsPage(),
        BookingScreen.routename:(context)=>BookingScreen(),
        FlightOptionsScreen.routename:(context)=>FlightOptionsScreen()


      },
        home: MainScreen(),
    );
  }


}
