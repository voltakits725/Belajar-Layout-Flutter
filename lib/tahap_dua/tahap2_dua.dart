import 'package:flutter/material.dart';

class TahapDuaDuaScreen extends StatelessWidget {
  const TahapDuaDuaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Macam-Macam Button'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            // ==========================================
            // 1. ELEVATED BUTTON
            // ==========================================
            const Text('1. ElevatedButton', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            
            ElevatedButton(
              // onPressed ini wajib ada. Kalau diisi null, tombolnya jadi disable (mati)
              onPressed: () {
                print('Tombol Login ditekan!');
              },
              // styleFrom dipakai buat modifikasi tampilan tombol
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Warna background
                foregroundColor: Colors.white, // Warna teks
                // Ini buat ngubah warna efek gelombangnya pas dipencet jadi merah transparan
                 overlayColor: Colors.red.withOpacity(0.3),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), 
                  // Bikin sudut tombol agak melengkung
                ),
              ),
              child: const Text('LOGIN', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),

            const SizedBox(height: 30),

            // ==========================================
            // 2. TEXT BUTTON
            // ==========================================
            const Text('2. TextButton', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            
            TextButton(
              onPressed: () {
                print('Lupa password ditekan!');
              },
              child: const Text(
                'Lupa Password?',
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),

            const SizedBox(height: 30),

            // ==========================================
            // 3. INKWELL (Bikin custom widget jadi bisa diklik)
            // ==========================================
            const Text('3. InkWell (Custom Clickable Widget)', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            
            // Bungkus Container pakai Material yang warnanya transparan, 
            // ini trik biar efek gelombang InkWell-nya kelihatan.
            Material(
              color: Colors.orange[100],
              borderRadius: BorderRadius.circular(10),
              // InkWell harus punya batas (clip) atau ditaruh di dalam Material
              child: InkWell(
                borderRadius: BorderRadius.circular(10), // Samain sama Material biar lengkungannya pas
                splashColor: Colors.orange[300], // Warna efek gelombang airnya
                onTap: () {
                  print('Kotak custom ditekan!');
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.touch_app, color: Colors.orange),
                      SizedBox(width: 10),
                      Text('Klik Aku!', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}