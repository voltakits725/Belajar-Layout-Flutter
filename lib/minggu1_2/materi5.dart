import 'package:flutter/material.dart';

class MateriLimaScreen extends StatelessWidget {
  const MateriLimaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildScrollView'),
        backgroundColor: Colors.blue,
      ),
      // Cukup bungkus Column lu pakai SingleChildScrollView
      // Otomatis semua isi di dalam Column ini jadi bisa digeser ke atas-bawah
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Scroll ke bawah untuk melihat semua kotak!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              
              // Kotak 1
              Container(
                width: 300,
                height: 200,
                color: Colors.red[300],
                child: const Center(child: Text('Bagian Atas', style: TextStyle(fontSize: 24))),
              ),
              const SizedBox(height: 16),
              
              // Kotak 2
              Container(
                width: 300,
                height: 200,
                color: Colors.green[300],
                child: const Center(child: Text('Bagian Tengah', style: TextStyle(fontSize: 24))),
              ),
              const SizedBox(height: 16),
              
              // Kotak 3
              Container(
                height: 200,
                width: 300,
                color: Colors.orange[300],
                child: const Center(child: Text('Bagian Bawah', style: TextStyle(fontSize: 24))),
              ),
              const SizedBox(height: 16),
              
              // Tombol di paling ujung bawah
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Tombol Simpan', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}