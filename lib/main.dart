import 'package:flutter/material.dart';
import 'package:material_you_calc/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material You Calculator',
      theme: ThemeData(),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
