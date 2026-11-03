import 'package:flutter/material.dart';

class NavigasiScreen extends StatefulWidget {
  const NavigasiScreen({super.key});
  @override
  State<NavigasiScreen> createState() => _NavigasiScreenState();
}

class _NavigasiScreenState extends State<NavigasiScreen> {
  int _selectedIndex = 0;

  final List<Widget> _halamanBottomNav = [
   // const HalamanBeranda(),
    const Center(child: Text('Halaman Pesanan', style: TextStyle(fontSize: 24))), // Indeks 1
    const Center(child: Text('Halaman Profil', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navvigasi Lengkap'),
      centerTitle: true,
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
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
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Pengaturan'),
              // Navigator.pop dipakai buat nutup Drawer-nya
              onTap: () => Navigator.pop(context), 
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Bantuan'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      )
    );
  }
}