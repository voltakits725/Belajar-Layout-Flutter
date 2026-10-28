import 'package:flutter/material.dart';

class MateriEnamScreen extends StatelessWidget {
  const MateriEnamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack & Positioned'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            // Container ini ngebatesin ukuran total Stack kita
            Container(
              width: double.infinity,
              height: 250,
              color: Colors.grey[200],
              
              child: Stack(
                // clipBehavior: Clip.none biar kalau foto profilnya agak keluar jalur, 
                // gambarnya nggak kepotong
                clipBehavior: Clip.none, 
                
                children: [
                  // ==========================================
                  // 1. LAYER BAWAH (Banner)
                  // ==========================================
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text('Banner Profil', style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                  
                  // ==========================================
                  // 2. LAYER TENGAH (Foto Profil)
                  // ==========================================
                  Positioned(
                    // top: 100 berarti jarak dari atas Stack adalah 100 pixel.
                    // Karena tinggi banner 150, foto profil bakal nabrak garis bawah banner.
                    top: 100, 
                    // Set left: 0 dan right: 0 biar widget-nya dipaksa ke tengah secara horizontal
                    left: 0,
                    right: 0,
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white, // Border putih foto profil
                      child: CircleAvatar(
                        radius: 46,
                        backgroundColor: Colors.green,
                        child: Icon(Icons.person, size: 50, color: Colors.white),
                      ),
                    ),
                  ),
                  
                  // ==========================================
                  // 3. LAYER ATAS (Badge Notifikasi)
                  // ==========================================
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Colors.pink,
                        shape: BoxShape.circle,
                      ),
                      child: const Text('3', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}