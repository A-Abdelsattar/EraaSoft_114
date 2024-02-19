import 'package:flutter/material.dart';
import 'package:movie_114/core/services/api_services.dart';
import 'package:movie_114/features/home/views/home_screen.dart';

void main() {
  ApiServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
