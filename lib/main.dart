import 'package:flutter/material.dart';
import 'package:meow_match/question_screen.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const HomePage(),
        '/quiz' : (context) => const QuestionScreen()
      },
  
    );
  }
}
