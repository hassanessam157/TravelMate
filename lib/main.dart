import 'package:flutter/material.dart';
import 'package:tavel_app/Account/AccountScreen.dart';
import 'package:tavel_app/Account/LoginScreen.dart';
import 'package:tavel_app/Account/signupScreen.dart';
import 'package:tavel_app/BookingScreen/BookingScreen.dart';
import 'package:tavel_app/MainScreen.dart';
import 'package:tavel_app/home/FlightOptionsScreen.dart';
import 'package:tavel_app/home/HomeScreen.dart';
import 'package:tavel_app/home/HotelOptionsScreen.dart';
import 'package:tavel_app/home/RestaurantOptionsScreen.dart';
import 'package:tavel_app/home/SettingScreen.dart';
import 'package:tavel_app/location/Location_screen.dart';
import 'package:tavel_app/location/SavedLocationScreen.dart';
import 'package:tavel_app/splash_screen.dart';

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
        LocationScreen.routename:(context)=>LocationScreen(),
        SplashScreen.routename:(context)=>SplashScreen(),
        LoginScreen.routename:(context)=>LoginScreen(),
        HomeScreen.routename:(context)=>HomeScreen(),
        AccountScreen.routename:(context)=>AccountScreen(),
        SignUpScreen.routename:(context)=>SignUpScreen(),
        RestaurantOptionsScreen.routename:(context)=>RestaurantOptionsScreen(),
        HotelOptionsScreen.routename:(context)=>HotelOptionsScreen(),

        SavedScreen.routname: (context) {
        final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
        return SavedScreen(
        name: args?['name'] ?? 'Unknown',
        description: args?['description'] ?? 'Unknown',
        imageUrl: args?['imageUrl'] ?? '',
        starRating: args?['starRating'] ?? 0.0,
        );},

        SettingsScreen.routename:(Context)=>SettingsScreen(),
        BookingScreen.routename:(context)=>BookingScreen(),
        FlightOptionsScreen.routename:(context)=>FlightOptionsScreen()


      },
        home: MainScreen(),
    );
  }


}
