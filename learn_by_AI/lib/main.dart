import 'package:flutter/material.dart';
import 'Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instaflash',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}