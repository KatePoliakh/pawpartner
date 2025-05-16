import 'package:flutter/material.dart';
import 'package:pawpartner/di/service_locator.dart';
import 'package:pawpartner/presentation/screens/home_screen/home_screen.dart';

void main() async {
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paw Partner',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
