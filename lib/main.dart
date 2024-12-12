import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tavel_app/Account/AccountScreen.dart';
import 'package:tavel_app/Account/RegisterScreen.dart';
import 'package:tavel_app/Account/LoginScreen.dart';
import 'package:tavel_app/BookingScreen/BookingScreen.dart';
import 'package:tavel_app/BookingScreen/bookingFlights.dart';
import 'package:tavel_app/BookingScreen/bookingrestaurant.dart';
import 'package:tavel_app/MainScreen.dart';
import 'package:tavel_app/home/FlightOptionsScreen.dart';
import 'package:tavel_app/home/HomeScreen.dart';
import 'package:tavel_app/home/HotelScreen.dart';
import 'package:tavel_app/home/RestaurantOptionsScreen.dart';
import 'package:tavel_app/home/SettingScreen.dart';
import 'package:tavel_app/location/Location_screen.dart';
import 'package:tavel_app/location/SavedLocationScreen.dart';
import 'package:tavel_app/splash_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:LoginScreen.routename ,
      routes: {
        HotelScreen.routename: (context)=>HotelScreen(),
        BookingrestaurantScreen.routename:(context)=>BookingrestaurantScreen(),
        BookingFlightScreen.routename:(context)=>BookingFlightScreen(),
        LocationScreen.routename:(context)=>LocationScreen(),
        SplashScreen.routename:(context)=>SplashScreen(),
        LoginScreen.routename:(context)=>LoginScreen(),
        HomeScreen.routename:(context)=>HomeScreen(),
        AccountScreen.routename:(context)=>AccountScreen(),
        RegisterScreen.routename:(context)=>RegisterScreen(),
        RestaurantOptionsScreen.routename:(context)=>RestaurantOptionsScreen(),

        SavedScreen.routname: (context) {
        final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
        return SavedScreen(
        name: args?['name'] ?? 'Unknown',
        description: args?['description'] ?? 'Unknown',
        imageUrl: args?['imageUrl'] ?? '',
        starRating: args?['starRating'] ?? 0.0,
        );},

        SettingsScreen.routename:(Context)=>SettingsScreen(),
        BookingScreen.routename:(context)=>BookingScreen(hotelId: '', hotelName: '',),
        FlightOptionsScreen.routename:(context)=>FlightOptionsScreen()


      },
        home: MainScreen(),
    );
  }


}
