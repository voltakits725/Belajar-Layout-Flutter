import 'package:flutter/material.dart';

void main() {
  runApp(const LatihanGridPage());
}



class LatihanGridPage extends StatelessWidget {
  // ==========================================
  // 1. SUMBER DATA (List of Maps)
  // Ini simulasi data yang nanti bakal lu ambil dari REST API
  // ==========================================
  final List<Map<String, String>> dataTechStack = const [
    {'nama': 'JavaScript', 'logo': 'assets/js.png'},
    {'nama': 'PHP', 'logo': 'assets/php.png'},
    {'nama': 'Dart', 'logo': 'assets/dart.png'},
    {'nama': 'HTML', 'logo': 'assets/html.png'},
    {'nama': 'Vue.js', 'logo': 'assets/vue.png'},
    {'nama': 'Python', 'logo': 'assets/python.png'}, 
    {'nama': 'Python', 'logo': 'assets/python.png'}, 
    {'nama': 'Python', 'logo': 'assets/python.png'}, 
    {'nama': 'Python', 'logo': 'assets/python.png'}, 
    {'nama': 'Python', 'logo': 'assets/python.png'}, 
    {'nama': 'Python', 'logo': 'assets/python.png'}, 
    {'nama': 'Python', 'logo': 'assets/python.png'}, 
    
    // Lu tinggal tambah baris di sini kalau ada tech stack baru!
  ];

  const LatihanGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Latihan 2: GridView.builder'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        
        // ==========================================
        // 2. WIDGET GRIDVIEW.BUILDER
        // ==========================================
        child: GridView.builder(
          itemCount: dataTechStack.length, // Ngasih tau ada berapa kotak yang mau dicetak
          
          // Pengaturan Layout Grid-nya
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Bikin 3 kolom ke samping
            crossAxisSpacing: 15, // Jarak horizontal antar kotak
            mainAxisSpacing: 15, // Jarak vertikal antar kotak
            childAspectRatio: 0.9, // Ngatur rasio proporsi kotaknya (makin kecil makin panjang ke bawah)
          ),
          
          // 3. CETAKAN UI-NYA (Diulang otomatis sesuai jumlah data)
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Bikin isinya rata tengah
                children: [
                  
                  // Menampilkan gambar berdasarkan index data
                  Image.asset(
                    dataTechStack[index]['logo']!, // Narik data lokasi file
                    width: 45,
                    height: 45,
                    fit: BoxFit.contain,
                    // Fitur sakti: kalau file gambar blm lu download, dia otomatis nampilin ikon silang
                    errorBuilder: (context, error, stackTrace) => 
                        const Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Menampilkan nama bahasa berdasarkan index data
                  Text(
                    dataTechStack[index]['nama']!, // Narik data nama
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.teal, 
                      fontSize: 12, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}