import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  final String emailUser;

  const HomeScreen({super.key, required this.emailUser});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda Utama'),
        automaticallyImplyLeading: false
      ),
      body: Center(
        child: Column(
          children: [
            const Icon(Icons.check_circle, size: 100, color: Colors.green,),
            const SizedBox(height: 20,),
            const Text(
              'Login Berhasil',
               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold
              )
            ),
            const SizedBox(height: 10,),

            Text(
              'Selamat datang,\n$emailUser',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, color: Colors.blue),
            ),

            const SizedBox(height: 40,),

            ElevatedButton.icon(
              onPressed: () {
                // Logout = buang halaman beranda, balik ke halaman login di bawahnya
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout),
              label: const Text(' LOGOUT'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}

