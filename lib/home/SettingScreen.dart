import 'package:flutter/material.dart';
import 'package:tavel_app/Account/AccountScreen.dart';
import 'package:tavel_app/Account/LoginScreen.dart';

class SettingsScreen extends StatefulWidget {
  static const String routename = 'settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [

          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("App Info"),
            subtitle: const Text("View app information"),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("App Info"),
                  content: const Text("TravelMate  A journey to remember!"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Close"),
                    ),
                  ],
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text("Account Settings"),
            onTap: () {
              Navigator.of(context).pushNamed(AccountScreen.routename);
            },

          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(LoginScreen.routename);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
              child: const Text(
                'Sign Out',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
