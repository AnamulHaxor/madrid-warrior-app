import 'package:flutter/material.dart';

const Color royalBlue = Color(0xFF001a4d);
const Color lightBlue = Color(0xFF4da6ff);
const Color white = Color(0xFFFFFFFF);
const Color darkBg = Color(0xFF121212);

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: royalBlue,
  scaffoldBackgroundColor: white,
  appBarTheme: const AppBarTheme(
    backgroundColor: royalBlue,
    foregroundColor: white,
    elevation: 0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: white,
    selectedItemColor: royalBlue,
    unselectedItemColor: Colors.grey,
  ),
  cardTheme: CardTheme(
    color: white,
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(color: royalBlue, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(color: Colors.black87),
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: lightBlue,
  scaffoldBackgroundColor: darkBg,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1f1f1f),
    foregroundColor: white,
    elevation: 0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF1f1f1f),
    selectedItemColor: lightBlue,
    unselectedItemColor: Colors.grey,
  ),
  cardTheme: CardTheme(
    color: const Color(0xFF2a2a2a),
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
);
