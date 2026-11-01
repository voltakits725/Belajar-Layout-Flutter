import 'package:flutter/material.dart';
class LatihanStackPage extends StatelessWidget {
  const LatihanStackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Latihan 1: Stack & Positioned'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Icon(Icons.notifications, size: 50, color: Colors.black54,
                ),
              ),

              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ))
            ],
          ),
          
          // ==========================================
          // INI DIA WADAH STACK KITA
          // ==========================================
          SizedBox(
            
            height: 230, // Kita patok tinggi total area tumpukan ini
            child: Stack(
              children: [
                
                // LAPISAN 1 (Paling Belakang): Banner Profil
                // Karena dia ditulis pertama, dia akan jadi background
                Container(
                  height: 160,
                  width: double.infinity,
                  color: Colors.blueAccent, // Anggap ini gambar cover lu
                ),

                // LAPISAN 2 (Menumpuk di atasnya): Foto Profil
                // Kita bungkus pakai Positioned biar bisa digeser secara presisi
                Positioned(
                  top: 100, // Jarak dari atas layar/wadah sebesar 100 pixel
                  left: 20, // Jarak dari pinggir kiri 20 pixel
                  
                  // Bikin efek lingkaran bergaris putih tebal (seperti di Twitter/LinkedIn)
                  child: CircleAvatar(
                    radius: 55, // Ukuran border putih luar
                    backgroundColor: Colors.white, 
                    child: CircleAvatar(
                      radius: 50, // Ukuran foto profil asli
                      backgroundColor: Colors.grey[300],
                      child: const Icon(Icons.person, size: 60, color: Colors.grey),
                    ),
                  ),
                ),
                
                // LAPISAN 3: Tombol Edit Profil di Kanan
                Positioned(
                  top: 170, // Posisinya di bawah banner (banner tingginya 160)
                  right: 20, // Nempel ke pinggir kanan
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Edit profile', style: TextStyle(color: Colors.black)),
                  ),
                ),
                
              ],
            ),
          ),


          // Teks identitas normal di bawah area Stack
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rafly Kurniawan',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(
                  '@rafly_dev',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 15),
                Text(
                  'Mencoba menaklukkan Stack dan Positioned di Flutter 🔥',
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}