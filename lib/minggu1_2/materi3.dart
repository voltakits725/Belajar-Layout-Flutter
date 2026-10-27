import 'package:flutter/material.dart';

class MateriTigaScreen extends StatelessWidget {
  // Kita bikin data list/array sederhana untuk ngetes yang dinamis
  final List<String> daftarMenu = const ['Kopi Hitam', 'Cappuccino', 'Latte', 'Espresso', 'Matcha'];

 const MateriTigaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiga Jenis ListView'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          
          // ==========================================
          // 1. LISTVIEW BIASA (Statis)
          // ==========================================
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('1. ListView Biasa (Statis)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          
          // Harus dibungkus Expanded supaya dia tau batas tingginya di dalam Column
          Expanded(
            child: ListView(
              // Children diisi manual satu-satu
              children: const [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Menu Profil'),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Menu Pengaturan'),
                ),
              ],
            ),
          ),

          // Garis pembatas antar contoh materi
          const Divider(thickness: 4, color: Colors.black26),

          // ==========================================
          // 2. LISTVIEW.BUILDER (Dinamis)
          // ==========================================
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text('2. ListView.builder (Dinamis)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          
          Expanded(
            child: ListView.builder(
              // Wajib kasih tau berapa total jumlah datanya
              itemCount: daftarMenu.length,
              
              // itemBuilder akan nge-looping (mengulang) desain ini sebanyak itemCount
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: ListTile(
                    leading: const Icon(Icons.local_cafe),
                    // Mengambil data berdasarkan urutan index-nya
                    title: Text(daftarMenu[index]),
                  ),
                );
              },
            ),
          ),

          const Divider(thickness: 4, color: Colors.black26),

          // ==========================================
          // 3. LISTVIEW.SEPARATED (Dinamis + Pemisah)
          // ==========================================
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('3. ListView.separated (Dengan Pemisah)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          
          Expanded(
            child: ListView.separated(
              itemCount: daftarMenu.length,
              
              // Ini kelebihannya: otomatis nyelipin widget pemisah di sela-sela item
              separatorBuilder: (context, index) {
                return const Divider(color: Colors.red);
              },
              
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Pesanan: ${daftarMenu[index]}'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                );
              },
            ),
          ),
          
        ],
      ),
    );
  }
}