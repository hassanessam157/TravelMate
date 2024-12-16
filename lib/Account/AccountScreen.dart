import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tavel_app/Account/LoginScreen.dart';

class AccountScreen extends StatelessWidget {
  static const String routename = 'account';

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    User? currentUser = _auth.currentUser;

    if (currentUser == null) {
      // If not signed in, redirect to login screen
      Future.microtask(() {
        Navigator.of(context).pushReplacementNamed(LoginScreen.routename);
      });
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return FutureBuilder<DocumentSnapshot>(
      future: _firestore.collection('users').doc(currentUser.uid).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('My Account'),
              backgroundColor: Colors.orange,
            ),
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('My Account'),
              backgroundColor: Colors.orange,
            ),
            body: Center(
                child: Text(
                    'User data not found. Please check your registration data.')),
          );
        }

        var userData = snapshot.data!.data() as Map<String, dynamic>;

        // Replace this with dynamic data from Firestore
        String userName = userData['name'] ?? 'No Name';
        String userEmail = userData['email'] ?? 'No Email';
        String userPhone = userData['phone'] ?? 'No Phone';
        String userAddress = userData['address'] ?? 'No Address';

        return Scaffold(
          appBar: AppBar(
            title: const Text('My Account'),
            backgroundColor: Colors.orange,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.orange,
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: Text(
                    userEmail,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const Divider(height: 30, thickness: 1),
                const SizedBox(height: 10),
                _buildInfoRow(Icons.phone, 'Phone', userPhone),
                const SizedBox(height: 10),
                _buildInfoRow(Icons.location_on, 'Address', userAddress),
                const Spacer(),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      await _auth.signOut();
                      Navigator.of(context).pushNamed(LoginScreen.routename);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                    ),
                    child: const Text(
                      'Sign Out',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.orange, size: 24),
        const SizedBox(width: 10),
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}
