import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/screens/categories.dart';

void main() {
  runApp(const MealApp());
}

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 183, 58, 98),
  ),
  
);

class MealApp extends StatelessWidget {
  const MealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( debugShowCheckedModeBanner: false,
      theme: theme,
      home: const CategoriesScreen(),
    );
  }
}
