// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocery_bloc/views/home/ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc',
      home: const HomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.teal,
        )
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


