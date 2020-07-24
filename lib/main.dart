import 'package:flutter/material.dart';
import 'package:bs_ui/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bilgi Sistemi',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 41, 37, 89),
        accentColor: Color.fromARGB(255, 226, 184, 135),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
