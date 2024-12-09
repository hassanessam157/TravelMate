


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavedScreen extends StatelessWidget {
     static const String routname='SavedScreen';


  final String name;
  final String description;
  final String imageUrl;
  final double starRating;

   SavedScreen({
    Key? key,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.starRating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                    (index) {
                  if (index < starRating.floor()) {
                    return const Icon(Icons.star, color: Colors.orange, size: 20);
                  } else if (index < starRating) {
                    return const Icon(Icons.star_half, color: Colors.orange, size: 20);
                  } else {
                    return const Icon(Icons.star_border, color: Colors.orange, size: 20);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
