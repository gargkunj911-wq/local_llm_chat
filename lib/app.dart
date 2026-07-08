import 'package:chatbot/homescreen/homescreen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "ChatBot",

      theme: ThemeData(colorScheme: ColorScheme.dark()),

      home: Homescreen(),
    );
  }
}