import 'package:age_calculator/screens/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///title
      title: 'Age Calculator',

      ///banner
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: Colors.blue, // Change the primary color as needed
        textTheme:
            GoogleFonts.firaSansTextTheme(Theme.of(context).textTheme).copyWith(
          // Customize your text theme here
          titleLarge:
              const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          titleMedium: const TextStyle(fontSize: 16.0),
          bodyMedium: const TextStyle(fontSize: 14.0),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.blue,
          iconTheme: const IconThemeData(color: Colors.white),
          toolbarTextStyle: TextTheme(
            titleLarge: GoogleFonts.firaSans(
              color: Colors.white, // Change app bar text color
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ).bodyMedium,
          titleTextStyle: TextTheme(
            titleLarge: GoogleFonts.firaSans(
              color: Colors.white, // Change app bar text color
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ).titleLarge, // Change app bar icon color
        ),
      ),
      home: const CalculatorScreen(),
    );
  }
}
