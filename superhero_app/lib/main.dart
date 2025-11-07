import 'package:flutter/material.dart';
import 'package:superhero_app/screens/superhero_search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SuperheroSearchScreen(),
    );
  }
}
