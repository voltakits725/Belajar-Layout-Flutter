import 'package:flutter/material.dart';

class TahapDuaSatuScreen extends StatelessWidget {
  const TahapDuaSatuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text, Image, Icon Lanjutan'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // ==========================================
            // 1. TEXT LANJUTAN (RichText)
            // ==========================================
            const Text('1. Text.rich (Teks Campuran)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 10),
            
            // Text.rich kepakai banget buat bikin tulisan "Syarat & Ketentuan" 
            // atau "Belum punya akun? Daftar" di halaman Login
            const Text.rich(
              TextSpan(
                text: 'Belum punya akun? ', // Teks bawaan biasa
                style: TextStyle(color: Colors.black, fontSize: 16),
                children: [
                  TextSpan(
                    text: 'Daftar Sekarang!', // Teks yang di-highlight
                    style: TextStyle(
                      color: Colors.blue, 
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline, // Garis bawah
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),

            // ==========================================
            // 2. IMAGE LANJUTAN (Image.network)
            // ==========================================
            const Text('2. Image.network (Dari Internet)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 10),
            
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(12),
              ),
              // ClipRRect biar sudut gambar ikut melengkung sesuai Container
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  // Ngambil gambar random dari internet
                  'https://picsum.photos/400/200',
                  fit: BoxFit.cover,
                  
                  // loadingBuilder ini buat nampilin indikator loading (muter-muter) 
                  // selama gambarnya lagi di-download dari internet
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child; // Kalau udah selesai, tampilin gambar
                    return const Center(child: CircularProgressIndicator()); // Kalau belum, tampilin loading
                  },
                  
                  // Kalau link gambarnya mati atau internet putus, tampilin ini
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Icon(Icons.broken_image, size: 50, color: Colors.grey));
                  },
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==========================================
            // 3. ICON LANJUTAN (Custom Style)
            // ==========================================
            const Text('3. Icon Custom', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 10),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.favorite, color: Colors.red, size: 50),
                const Icon(Icons.star, color: Colors.amber, size: 50),
                Icon(
                  Icons.thumb_up, 
                  color: Colors.blue, 
                  size: 50,
                  // Nambahin bayangan ke icon biar kelihatan timbul
                  shadows: [
                    Shadow(color: Colors.red.withOpacity(0.5), blurRadius: 25, offset: const Offset(2, 2)),
                  ],
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}