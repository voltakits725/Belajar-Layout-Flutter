import 'package:flutter/material.dart';

class MateriSatuScreen extends StatelessWidget {
  const MateriSatuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanded, Flexible, Spacer'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('1. Contoh Spacer (Mendorong ke ujung)', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(color: Colors.red, width: 50, height: 50),
                const Spacer(), // <--- Ngambil ruang kosong buat dorong kotak hijau
                Container(color: Colors.green, width: 50, height: 50),
              ],
            ),
            
            const SizedBox(height: 40),
            
            const Text('2. Contoh Expanded (Rakus, ambil semua sisa ruang)', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(color: Colors.red, width: 50, height: 50),
                Expanded( // <--- Memaksa kotak kuning memanjang sampai mentok kotak hijau
                  child: Container(color: Colors.yellow, height: 50, child: const Center(child: Text('Expanded'))),
                ),
                Container(color: Colors.green, width: 50, height: 50),
              ],
            ),

            const SizedBox(height: 40),

            const Text('3. Contoh Flexible (Menyesuaikan isi, tidak dipaksa mentok)', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(color: Colors.red, width: 50, height: 50),
                Flexible( // <--- Bisa memanjang, tapi karena teksnya pendek, ukurannya cuma sebatas teksnya saja
                  child: Container(color: Colors.orange, height: 50, child: const Center(child: Text('Flexible'))),
                ),
                Container(color: Colors.green, width: 50, height: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}