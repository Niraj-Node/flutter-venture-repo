 import 'package:flutter/material.dart';

// To learn more refer this :- https://github.com/sanketgupta1000/flutter_practice/tree/master/two_layouting

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Padding, Row & Column Demo'),
        ),
        body: Padding(
          // Adding padding to the entire body
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // Aligning the column content at the center
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Column Example',
                style: TextStyle(backgroundColor: Colors.amber,fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              //const SizedBox(height: 50.0), // Adding space between widgets
              Row(
                // Aligning row content horizontally centered
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Wrapping each child in Padding for individual spacing
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      // can specify many things here, like margin, padding, height, width, etc
                      width: 50,
                      height: 20,
                      color: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.green,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Container(
                      width: 30,
                      height: 50,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Using Padding for individual alignment
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.star, size: 50, color: Colors.orange),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Star',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.star, size: 50, color: Colors.orange),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}