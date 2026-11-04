import 'package:flutter/material.dart';

class NavigasiScreen extends StatefulWidget {
  const NavigasiScreen({super.key});

  @override
  State<NavigasiScreen> createState() => _NavigasiScreenState();
}

class _NavigasiScreenState extends State<NavigasiScreen> {
  // Variabel untuk nyimpen indeks menu bawah yang lagi aktif
  int _selectedIndex = 0;

  // Daftar halaman yang bakal ditampilin sesuai pilihan menu bawah
  final List<Widget> _halamanBottomNav = [
    const HalamanBeranda(), // Indeks 0: Manggil widget khusus yang ada TabBar-nya
    const Center(child: Text('Halaman Pesanan', style: TextStyle(fontSize: 24))), // Indeks 1
    const Center(child: Text('Halaman Profil', style: TextStyle(fontSize: 24))), // Indeks 2
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigasi Lengkap'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      
      // ==========================================
      // 1. DRAWER (Menu Samping)
      // ==========================================
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // Biar headernya mentok ke atas layar
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(radius: 30, backgroundColor: Colors.white, child: Icon(Icons.person, size: 35)),
                  SizedBox(height: 10),
                  Text('Menu Utama', style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
            ),
            // Menu Pengaturan
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Pengaturan'),
              onTap: () {
                // 1. Tutup menu drawer-nya dulu
                Navigator.pop(context); 
                
                // 2. Baru dorong halaman Pengaturan ke layar
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HalamanPengaturan()),
                );
              }, 
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Bantuan'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: const Text('Dahboard'),
              onTap: () => Navigator.pop(context),
            )
          ],
        ),
      ),

      // ==========================================
      // BODY (Mengikuti pilihan Bottom Navigation)
      // ==========================================
      body: _halamanBottomNav[_selectedIndex],

      // ==========================================
      // 2. BOTTOM NAVIGATION BAR (Menu Bawah)
      // ==========================================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Menu mana yang lagi nyala
        selectedItemColor: Colors.blue, // Warna saat diklik
        unselectedItemColor: Colors.grey, // Warna pas nganggur
        onTap: (index) {
          // setState wajib dipanggil biar layarnya refresh nampilin halaman baru
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Pesanan'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

// ==========================================
// 3. TAB BAR (Menu Kategori Atas)
// ==========================================
// Gua pisah jadi widget sendiri biar kodingannya nggak kepanjangan di atas
class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    // Wajib dibungkus DefaultTabController biar tab-nya bisa digeser
    return DefaultTabController(
      length: 2, // Jumlah tab yang mau dibikin
      child: Column(
        children: [
          const TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(icon: Icon(Icons.flight), text: 'Pesawat'),
              Tab(icon: Icon(Icons.train), text: 'Kereta'),
            ],
          ),
          // Expanded wajib biar TabBarView ngambil sisa ruang di bawahnya
          Expanded(
            child: TabBarView(
              children: [
                // Isi untuk Tab 1 (Pesawat)
                Container(
                  color: Colors.blue[50],
                  child: const Center(child: Text('Daftar Tiket Pesawat', style: TextStyle(fontSize: 20))),
                ),
                // Isi untuk Tab 2 (Kereta)
                Container(
                  color: Colors.green[50],
                  child: const Center(child: Text('Daftar Tiket Kereta', style: TextStyle(fontSize: 20))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HalamanPengaturan extends StatelessWidget {
  const HalamanPengaturan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Ini adalah halaman Pengaturan', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}