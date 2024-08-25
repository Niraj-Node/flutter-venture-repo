import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to PhotoArc'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(
            Icons.photo,
            color: Colors.white,
            size: 50.0,
          ),
          label: const Text(
            "View Gallery",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontFamily: 'IndieFlower',
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/gallery');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        ),
      ),
    );
  }
}