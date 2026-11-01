import 'package:flutter/material.dart';

// Anggap ini file main.dart lu
void main() {
  runApp(const TahapDuaLimaApp());
}

class TahapDuaLimaApp extends StatelessWidget {
  const TahapDuaLimaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Materi Theme',
      
      // ==========================================
      // INI DIA PUSAT PENGATURAN THEME-NYA
      // ==========================================
      theme: ThemeData(
        // 1. Warna Utama Aplikasi (Warna dominan)
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        
        // 2. Pengaturan Default untuk semua AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white, // Warna teks dan icon di AppBar
          centerTitle: true,
          elevation: 5,
        ),
        
        // 3. Pengaturan Default untuk semua teks di aplikasi
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.deepPurple),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        
        // 4. Pengaturan Default untuk semua ElevatedButton
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Semua tombol otomatis melengkung
            ),
          ),
        ),
      ),
      
      // Memanggil halaman utama
      home: const TahapDuaLimaScreen(),
    );
  }
}

class TahapDuaLimaScreen extends StatelessWidget {
  const TahapDuaLimaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Theme'),
        // Perhatiin: Di sini gua nggak ngatur warna background AppBar sama sekali, 
        // tapi dia otomatis jadi ungu ngikutin ThemeData!
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Perhatiin: Teks ini otomatis ngambil style displayLarge dari ThemeData
            Text('Halo Bro!', style: Theme.of(context).textTheme.displayLarge),
            
            const SizedBox(height: 10),
            
            // Teks ini otomatis ngambil style bodyLarge
            Text('Ini teks biasa', style: Theme.of(context).textTheme.bodyLarge),
            
            const SizedBox(height: 40),
            
            // Perhatiin: Tombol ini nggak dikasih style sama sekali,
            // tapi otomatis jadi warna ungu, teksnya putih, dan sudutnya melengkung!
            ElevatedButton(
              onPressed: () {},
              child: const Text('TOMBOL PERTAMA'),
            ),
            
            const SizedBox(height: 16),
            
            ElevatedButton(
              onPressed: () {},
              child: const Text('TOMBOL KEDUA'),
            ),
          ],
        ),
      ),
    );
  }
}