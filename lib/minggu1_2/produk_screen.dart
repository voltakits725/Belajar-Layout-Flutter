import 'package:flutter/material.dart';

class ProdukScreen extends StatelessWidget {
  // Data produk yang udah kita racik sebelumnya
  final List<Map<String, String>> daftarProduk = const [
    {'nama': 'Sepatu Kets', 'gambar': 'assets/sepatu.png', 'harga': 'Rp 250.000'},
    {'nama': 'Kaos Polos', 'gambar': 'assets/kaos.png', 'harga': 'Rp 75.000'},
    {'nama': 'Topi Baseball', 'gambar': 'assets/topi.png', 'harga': 'Rp 50.000'},
    {'nama': 'Jam Tangan', 'gambar': 'assets/jam.png', 'harga': 'Rp 150.000'},
    {'nama': 'Tas Ransel', 'gambar': 'assets/tas.png', 'harga': 'Rp 300.000'},
    {'nama': 'Kacamata Hitam', 'gambar': 'assets/kacamata.png', 'harga': 'Rp 120.000'},
  ];

  const ProdukScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Produk'),
        backgroundColor: Colors.blue,
        actions: [
          // Icon keranjang belanja biar makin mirip e-commerce
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          // ==========================================
          // 1. BAGIAN KATEGORI (Scroll Horizontal)
          // ==========================================
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
            child: Text('Kategori', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Wajib biar bisa geser samping
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildKategoriChip('Semua'),
                const SizedBox(width: 10),
                _buildKategoriChip('Pakaian'),
                const SizedBox(width: 10),
                _buildKategoriChip('Aksesoris'),
                const SizedBox(width: 10),
                _buildKategoriChip('Sepatu'),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // ==========================================
          // 2. BAGIAN LIST PRODUK (Expanded + GridView)
          // ==========================================
          // Dibungkus Expanded biar GridView ngambil semua sisa ruang di bawah Kategori
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                itemCount: daftarProduk.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75, // Ngatur proporsi kotak produk
                ),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Gambar Produk (Bungkus pakai Expanded biar fleksibel)
                        Expanded(
                          child: Image.asset(
                            daftarProduk[index]['gambar']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        
                        // Detail Nama dan Harga Produk
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                daftarProduk[index]['nama']!,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                // maxLines dan overflow biar teks kepanjangan otomatis jadi "..."
                                maxLines: 1, 
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                daftarProduk[index]['harga']!,
                                style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          
        ],
      ),
    );
  }

  // Widget tambahan (fungsi pembantu) untuk bikin tombol kategori biar kodenya rapi
  Widget _buildKategoriChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
    );
  }
}