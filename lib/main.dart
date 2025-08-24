import 'package:flutter/material.dart';
import 'package:gestion_intervention/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion Intervention',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 125, 124, 124)),
      ),
      home: const MyHomePage(title: 'Intervention'),
    );
  }
}