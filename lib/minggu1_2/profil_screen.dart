import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      // Kita pakai Column sebagai kerangka utama halaman
      body: Column(
        children: [
          
          // ==========================================
          // 1. BAGIAN HEADER (Stack & Positioned)
          // ==========================================
          SizedBox(
            height: 220, // Tinggi total area header
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Layer Bawah: Banner profil
                Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.blue,
                ),
                
                // Layer Atas: Foto Profil yang menabrak garis banner
                Positioned(
                  top: 90, // Jarak dari atas Stack
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                      child: const CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey,
                        // Boleh diganti pakai Image.asset kalau lu punya foto di folder assets
                        child: Icon(Icons.person, size: 60, color: Colors.white), 
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // ==========================================
          // 2. BAGIAN INFO PROFIL (Text, Padding, SizedBox)
          // ==========================================
          const SizedBox(height: 10), // Spasi setelah foto profil
          
          const Text(
            'Rafly',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            'Mobile Software Engineer',
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          
          const SizedBox(height: 20),
          
          // ==========================================
          // 3. BAGIAN MENU (Expanded, ListView, ListTile, Divider)
          // ==========================================
          // Expanded wajib dipakai biar ListView mau ngambil sisa ruang di bawah layar
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                ListTile(
                  leading: Icon(Icons.email, color: Colors.blue),
                  title: Text('Email'),
                  subtitle: Text('rafly.dev@example.com'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                Divider(thickness: 3,color: Colors.teal,), // Garis pemisah antar menu
                
                ListTile(
                  leading: Icon(Icons.phone, color: Colors.green),
                  title: Text('Nomor Telepon'),
                  subtitle: Text('+62 812 3456 7890'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                Divider(thickness: 3,color: Colors.teal),
                
                ListTile(
                  leading: Icon(Icons.folder_copy, color: Colors.orange),
                  title: Text('Portofolio & Repo'),
                  subtitle: Text('github.com/voltakits725'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                Divider(thickness: 3,color: Colors.teal),

                ListTile(
                  leading: Icon(Icons.settings, color: Colors.grey),
                  title: Text('Pengaturan Akun'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}