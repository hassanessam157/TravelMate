import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tavel_app/Account/AccountScreen.dart';
import 'package:tavel_app/Account/LoginScreen.dart';
import 'package:tavel_app/Account/RegisterScreen.dart';
import 'package:tavel_app/BookingScreen/bookingrestaurant.dart';
import 'package:tavel_app/Hotel/HotelScreen.dart';
import 'package:tavel_app/flights/FlightOptionsScreen.dart';
import 'package:tavel_app/home/HomeScreen.dart';
import 'package:tavel_app/home/SettingScreen.dart';
import 'package:tavel_app/location/Location_screen.dart';
import 'package:tavel_app/restaurant/RestaurantScreen.dart';
import 'package:tavel_app/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routename,
      routes: {
        HotelScreen.routename: (context) => HotelScreen(),
        BookingrestaurantScreen.routename: (context) =>
            BookingrestaurantScreen(),
        LocationScreen.routename: (context) => LocationScreen(),
        SplashScreen.routename: (context) => SplashScreen(),
        LoginScreen.routename: (context) => LoginScreen(),
        HomeScreen.routename: (context) => HomeScreen(),
        AccountScreen.routename: (context) => AccountScreen(),
        RegisterScreen.routename: (context) => RegisterScreen(),
        RestaurantScreen.routename: (context) => RestaurantScreen(),
        SettingsScreen.routename: (Context) => SettingsScreen(),
        HotelScreen.routename: (context) => HotelScreen(),
        FlightOptionsScreen.routename: (context) => FlightOptionsScreen()
      },
    );
  }
}
