import 'package:flutter/material.dart';

void main() {
  // Menjalankan aplikasi mulai dari widget LatihanDrawerApp
  runApp(const LatihanDrawerApp());
}

class LatihanDrawerApp extends StatelessWidget {
  const LatihanDrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp adalah pondasi utama aplikasi.
    // Cukup panggil SATU KALI saja di file paling awal (main.dart).
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Ngilangin pita "DEBUG" di pojok kanan atas
      home: HalamanUtamaDrawer(), // Halaman pertama yang bakal langsung dibuka
    );
  }
}

// =========================================================
// KELAS UTAMA (STATELESS WIDGET)
// Kita pakai Stateless karena di halaman ini kita nggak perlu
// ngubah tampilan data secara dinamis (nggak butuh setState).
// Semua perubahan layar diurus sama Navigator (tumpuk/buang layar).
// =========================================================
class HalamanUtamaDrawer extends StatelessWidget {
  const HalamanUtamaDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold itu ibarat kanvas putih tempat kita naruh AppBar, Body, dan Drawer
    return Scaffold(
      
      // 1. APP BAR (Bagian Atas)
      appBar: AppBar(
        title: const Text('Latihan Drawer Stateless'),
        backgroundColor: Colors.blue, // Warna latar belakang AppBar
        foregroundColor: Colors.white, // Warna teks dan icon (termasuk icon garis 3 bawaan drawer)
      ),
      
      // 2. BODY (Bagian Tengah/Isi Halaman)
      body: const Center(
        child: Text(
          'Ini Halaman Utama\nGeser dari tepi kiri layar ke kanan\natau klik icon garis 3 di atas!', 
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),

      // =========================================================
      // 3. DRAWER (Menu Samping / Hamburger Menu)
      // Kalau property 'drawer:' ini diisi, Flutter bakal otomatis 
      // nambahin icon garis 3 di pojok kiri AppBar.
      // =========================================================
      drawer: Drawer(
        // Kita pakai ListView biar kalau isi menunya panjang banget,
        // layarnya bisa di-scroll ke bawah dan nggak kena error overflow.
        child: ListView(
          padding: EdgeInsets.zero, // Wajib ditambahin biar warna background header mentok sampai ujung atas layar HP
          children: [
            
            // --- A. BAGIAN HEADER (Kepala Drawer) ---
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue), // Warna background area header
              // Kita pakai Stack karena kita mau numpuk tombol 'X' melayang di atas profil user
              child: Stack(
                children: [
                  
                  // Layer 1: Identitas Profil (Avatar & Nama)
                  // Column dipakai buat nyusun elemen dari atas ke bawah
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Teks & gambar rata kiri
                    mainAxisAlignment: MainAxisAlignment.end, // Elemen didorong mentok ke batas bawah header
                    children: [
                      // Foto profil bulat
                      CircleAvatar(
                        radius: 30, // Ukuran bulatan
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 35, color: Colors.blue),
                      ),
                      SizedBox(height: 10), // Spasi jarak antara foto dan teks
                      Text('Menu Utama', style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                  
                  // Layer 2: Tombol Close (X)
                  // Positioned berfungsi buat memposisikan elemen secara bebas di area Stack
                  Positioned(
                    top: -10, // Ditarik ke atas biar mepet pojok
                    right: -10, // Ditarik ke kanan biar mepet pojok
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white, size: 28),
                      // Aksi ketika tombol X ditekan
                      onPressed: () {
                        // Navigator.pop bertugas "membuang/menutup" layer yang lagi aktif
                        // Karena Drawer ini sifatnya menumpuk layar utama, maka pop akan menutup Drawer
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  
                ],
              ),
            ),
            
            // --- B. BAGIAN MENU LIST ---
            // ListTile itu widget bawaan Flutter yang desainnya udah distandarisasi
            // khusus untuk list menu (punya slot untuk icon kiri, teks utama, panah kanan, dll)
            
            // Menu 1: Pengaturan
            ListTile(
              leading: const Icon(Icons.settings), // Slot icon di sebelah kiri teks
              title: const Text('Pengaturan'), // Slot teks menu utama
              onTap: () { // Aksi pas menu ini diklik oleh user
                
                // Langkah 1: Buang/tutup layer Drawer-nya dulu biar nggak ngegantung
                Navigator.pop(context); 
                
                // Langkah 2: Baru dorong/tumpuk halaman "Pengaturan" secara utuh ke layar
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HalamanPengaturan()),
                );
              },
            ),
            
            // Menu 2: Bantuan
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Bantuan'),
              onTap: () {
                // Karena belum ada halaman buat Bantuan, kita atur aksinya cuma nutup drawer aja
                Navigator.pop(context);
              },
            ),
            
            // Divider dipakai buat nyisipin garis abu-abu tipis horisontal sebagai pemisah menu
            const Divider(), 
            
            // Menu 3: Logout
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red), // Iconnya diwarnain merah
              title: const Text('Logout', style: TextStyle(color: Colors.red)), // Teksnya juga merah
              onTap: () {
                Navigator.pop(context); // Nutup drawer
                print('Proses logout berjalan...'); // Tulisan ini muncul di terminal/debug console
              },
            ),

          ],
        ),
      ),
    );
  }
}

// =========================================================
// KELAS HALAMAN DUMMY PENGATURAN
// Halaman ini yang bakal kebuka kalau user klik menu "Pengaturan" di drawer
// =========================================================
class HalamanPengaturan extends StatelessWidget {
  const HalamanPengaturan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        // CATATAN PENTING: 
        // Flutter bakal otomatis nambahin icon panah 'Back' di pojok kiri AppBar ini
        // karena Flutter mendeteksi halaman ini dibuka menggunakan fungsi Navigator.push()
        // dan punya history halaman sebelumnya buat di-pop (kembali).
      ),
      body: const Center(
        child: Text(
          'Ini layar Pengaturan.\nKlik panah kembali di atas buat balik.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}