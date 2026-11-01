import 'package:flutter/material.dart';
import 'package:belajar_flutter_layout/tahap_dua/form_login.dart'; // Sesuaikan path ini

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Project Form Login dan Register',
      
      // Tema Global dipusatkan di sini
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 5,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      
      // Halaman pertama yang dipanggil adalah FormLogin
      home: const FormLogin(),
    );
  }
}