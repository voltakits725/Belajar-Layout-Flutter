import 'package:flutter/material.dart';

void main() {
  runApp(const LatihanTabBarPage());
}



class LatihanTabBarPage extends StatelessWidget {
  const LatihanTabBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Wajib dibungkus DefaultTabController biar fungsi swipe-nya otomatis jalan
    return DefaultTabController(
      length: 5, // Jumlah tab lu ada berapa? (Wajib sama dengan jumlah menu & halaman)
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Latihan 3: Swipe TabBar'),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          
          // 2. TAB BAR (MENU ATAS)
          // Properti bottom di AppBar khusus untuk menaruh tab
          bottom: const TabBar(
            labelColor: Colors.white, // Warna teks saat tab aktif
            unselectedLabelColor: Colors.white60, // Warna teks saat tab tidak aktif
            indicatorColor: Colors.amber, // Warna garis bawah tab yang lagi aktif
            indicatorWeight: 4, // Ketebalan garis bawah
            tabs: [
              Tab(icon: Icon(Icons.desktop_windows), text: 'Frontend'),
              Tab(icon: Icon(Icons.storage), text: 'Backend'),
              Tab(icon: Icon(Icons.build), text: 'Tools'),
              Tab(icon: Icon(Icons.build), text: 'Tools'),
              Tab(icon: Icon(Icons.build), text: 'Tools'),


            ],
          ),
        ),
        
        // 3. TAB BAR VIEW (ISI HALAMANNYA)
        // Urutannya wajib persis sama kayak urutan tabs di atas
        body: const TabBarView(
          children: [
            
            // Halaman Tab 1: Frontend
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.javascript, size: 80, color: Colors.amber),
                  Text('Isi kategori Frontend di sini', style: TextStyle(fontSize: 18)),
                  Text('(HTML, CSS, Vue.js, JavaScript)'),
                ],
              ),
            ),

            // Halaman Tab 2: Backend
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.php, size: 80, color: Colors.indigo),
                  Text('Isi kategori Backend di sini', style: TextStyle(fontSize: 18)),
                  Text('(PHP, Laravel, Node.js, PostgreSQL)'),
                ],
              ),
            ),

            // Halaman Tab 3: Tools
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dock, size: 80, color: Colors.blue),
                  Text('Isi kategori Tools di sini', style: TextStyle(fontSize: 18)),
                  Text('(Git, GitHub, Docker, Postman)'),
                ],
              ),
            ),

             Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dock, size: 80, color: Colors.blue),
                  Text('Isi kategori Tools di sini', style: TextStyle(fontSize: 18)),
                  Text('(Git, GitHub, Docker, Postman)'),
                ],
              ),
            ),

             Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dock, size: 80, color: Colors.blue),
                  Text('Isi kategori Tools di sini', style: TextStyle(fontSize: 18)),
                  Text('(Git, GitHub, Docker, Postman)'),
                ],
              ),
            ),

             Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dock, size: 80, color: Colors.blue),
                  Text('Isi kategori Tools di sini', style: TextStyle(fontSize: 18)),
                  Text('(Git, GitHub, Docker, Postman)'),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}