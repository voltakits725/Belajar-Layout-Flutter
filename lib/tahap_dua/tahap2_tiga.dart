import 'package:flutter/material.dart';

class TahapDuaTigaScreen extends StatefulWidget {
  const TahapDuaTigaScreen({super.key});

  @override
  State<TahapDuaTigaScreen> createState() => _TahapDuaTigaScreenState();
}

class _TahapDuaTigaScreenState extends State<TahapDuaTigaScreen> {
  // 1. Ini adalah "kunci master" buat ngendaliin semua validasi di dalam Form
  final _formKey = GlobalKey<FormState>();

  // 2. Controller ini tugasnya buat ngambil teks yang diketik user
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Bersihin controller kalau layarnya ditutup biar memori HP nggak bocor
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form & Validasi'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        
        // 3. Bungkus semua inputan pakai Form dan masukin kunci masternya
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
              // ==========================================
              // A. INPUT EMAIL
              // ==========================================
              TextFormField(
                controller: _emailController, // Sambungin ke controller
                keyboardType: TextInputType.emailAddress, // Bikin keyboard HP nampilin logo '@'
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Masukkan email lu di sini',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(), // Bikin kotaknya ada garis tepi yang jelas
                ),
                
                // Ini logika validasinya (cek error)
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email nggak boleh kosong bro!'; // Pesan error kalau kosong
                  }
                  if (!value.contains('@')) {
                    return 'Format email salah, harus pakai @'; // Pesan error kalau format aneh
                  }
                  return null; // Return null artinya AMAN (nggak ada error)
                },
              ),
              
              const SizedBox(height: 20),
              
              // ==========================================
              // B. INPUT PASSWORD
              // ==========================================
              TextFormField(
                controller: _passwordController,
                obscureText: true, // Bikin teksnya jadi titik-titik rahasia (password)
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password wajib diisi!';
                  }
                  if (value.length < 6) {
                    return 'Password minimal 6 karakter bro!';
                  }
                  return null; // AMAN
                },
              ),
              
              const SizedBox(height: 30),
              
              // ==========================================
              // C. TOMBOL SUBMIT VALIDASI
              // ==========================================
              ElevatedButton(
                onPressed: () {
                  // Pas tombol dipencet, kita cek status validasi dari kunci masternya
                  if (_formKey.currentState!.validate()) {
                    // Kalau semua validator me-return null (AMAN), kode di bawah ini bakal jalan
                    
                    // Kita ambil teksnya lewat controller
                    final emailUser = _emailController.text;
                    final passUser = _passwordController.text;
                    
                    print('Validasi Sukses!');
                    print('Email: $emailUser');
                    print('Password: $passUser');
                  } else {
                    // Kalau ada yang error, Form bakal otomatis nampilin teks merah
                    print('Ada inputan yang masih salah bro!');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('LOGIN', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}