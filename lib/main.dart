import 'package:flutter/material.dart';
import 'package:test_task/random_background_color/view/random_background_page.dart';

void main() {
  runApp(const MyApp());
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  /// Creates a [MyApp].
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Test Task',
      debugShowCheckedModeBanner: false,
      home: RandomBackgroundPage(),
    );
  }
}
