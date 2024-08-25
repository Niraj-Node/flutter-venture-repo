import 'package:flutter/material.dart';
import 'package:photoarc_usnig_api/home_screen.dart';
import 'package:photoarc_usnig_api/gallery_screen.dart';

void main() => runApp(const GalleryApp());

class GalleryApp extends StatelessWidget {
  const GalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhotoArc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/gallery': (context) => const GalleryScreen(),
      },
    );
  }
}
