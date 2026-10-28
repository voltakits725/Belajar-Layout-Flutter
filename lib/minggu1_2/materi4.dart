import 'package:flutter/material.dart';

class MateriEmpatScreen extends StatelessWidget {
  // Kita bikin data dummy list produk buat ngetes
  final List<String> daftarProduk = const [
    'Sepatu Kets', 'Kaos Polos', 'Topi Baseball', 
    'Jam Tangan', 'Tas Ransel', 'Kacamata Hitam'
  ];

  const MateriEmpatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView Builder'),
        backgroundColor: Colors.blue,
      ),
      // Padding di luar biar grid-nya nggak nempel banget ke pinggir layar
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        
        // Memanggil GridView.builder
        child: GridView.builder(
          
          // Wajib menentukan jumlah item berdasarkan panjang data array
          itemCount: daftarProduk.length,
          
          // gridDelegate ini ibarat mandor yang ngatur tata letak grid-nya
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            // crossAxisCount mengatur jumlah kolom (menyamping)
            crossAxisCount: 2, 
            
            // Jarak spasi horizontal (kiri-kanan) antar item
            crossAxisSpacing: 10, 
            
            // Jarak spasi vertikal (atas-bawah) antar baris
            mainAxisSpacing: 10,
            
            // Mengatur rasio perbandingan lebar dan tinggi item (1.0 = kotak persegi)
            childAspectRatio: 0.7, 
          ),
          
          // itemBuilder mengeksekusi desain ini berulang kali
          itemBuilder: (context, index) {
            
            return Card(
              color: Colors.blue[100],
              elevation: 4,
              child: Center(
                child: Column(
                  // Menengahkan isi di dalam kotak grid
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.shopping_bag, size: 40, color: Colors.blue),
                    
                    // Spasi vertikal kecil
                    const SizedBox(height: 10),
                    
                    // Nampilin nama produk sesuai urutan index
                    Text(
                      daftarProduk[index],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
            
          },
        ),
      ),
    );
  }
}

class CardImage extends StatelessWidget {
  // Data diubah jadi Map supaya bisa nyimpen nama sekaligus path gambarnya
  final List<Map<String, String>> daftarProduk = const [
    {'nama': 'Sepatu Kets', 'gambar': 'assets/sepatu.png', 'harga': 'Rp 250.000'},
    {'nama': 'Kaos Polos', 'gambar': 'assets/kaos.png', 'harga': 'Rp 75.000'},
    {'nama': 'Topi Baseball', 'gambar': 'assets/topi.png', 'harga': 'Rp 50.000'},
    {'nama': 'Jam Tangan', 'gambar': 'assets/jam.png', 'harga': 'Rp 150.000'},
    {'nama': 'Tas Ransel', 'gambar': 'assets/tas.png', 'harga': 'Rp 300.000'},
    {'nama': 'Kacamata Hitam', 'gambar': 'assets/kacamata.png', 'harga': 'Rp 120.000'},
    {'nama': 'Kacamata Hitam', 'gambar': 'assets/kacamata.png', 'harga': 'Rp 120.000'},
    {'nama': 'Kacamata Hitam', 'gambar': 'assets/kacamata.png', 'harga': 'Rp 120.000'},
    {'nama': 'Kacamata Hitam', 'gambar': 'assets/kacamata.png', 'harga': 'Rp 120.000'},
  ];
  const CardImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView builder dengan gambar'),
      backgroundColor: Colors.teal,
      
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: daftarProduk.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          
          ), 
          itemBuilder: (context, index){
            return Card(
              color: Colors.blue[50],
              elevation: 8,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  // Expanded bikin gambarnya ngambil sisa ruang di atas teks
                  Expanded(
                    child: Image.asset(
                      daftarProduk[index]['gambar']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      daftarProduk[index]['nama']!,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  
                  // Jarak tipis antara nama produk dan harga
                  const SizedBox(height: 4),
                  
                  // 2. Tambahin Text baru khusus buat nampilin harga
                  Center(
                    child: Text(
                      daftarProduk[index]['harga']!,
                      style: const TextStyle(
                        color: Colors.green, // Warna hijau biar kelihatan kayak harga
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          }
        
        ),
      ),
    );
  }
}