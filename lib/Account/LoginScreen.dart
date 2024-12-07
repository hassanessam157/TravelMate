
import 'package:flutter/material.dart';
import 'package:tavel_app/Account/signupScreen.dart';
import 'package:tavel_app/home/HomeScreen.dart';
import 'package:tavel_app/splash_screen.dart';

class LoginScreen extends StatelessWidget {
  static String routename = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.handshake_outlined,),
          onPressed: () {
            Navigator.of(context).pushNamed(SplashScreen.routename);
          },
        ),
        title: Text(''),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo
            Center(
              child: Column(
                children: const [
                  Icon(
                    Icons.handshake,
                    size: 80.0,
                    color: Colors.orange,
                  ),
                  Text(
                    'TravelMate',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),

            // Username field
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'User Name',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
              ),
            ),
            const SizedBox(height: 20.0),

            // Password field
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            const SizedBox(height: 10.0),

            // // Forget Password link
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: TextButton(
            //     onPressed: () {
            //       Navigator.of(context).pushNamed(SignUpScreen.routename);
            //     },
            //     child:  Text(
            //       'Forget Password ?',
            //       style: TextStyle(color: Colors.orange),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 20.0),

            // Sign In Button
            ElevatedButton(
              onPressed: () {
                // Handle sign in
                Navigator.of(context).pushReplacementNamed(HomeScreen.routename);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 50.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'SIGN IN',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),

            const SizedBox(height: 20.0),

            // Sign up link
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("DON'T HAVE AN ACCOUNT?"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(SignUpScreen.routename);
                    },
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
