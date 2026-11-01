import 'package:belajar_flutter_layout/tahap_dua/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter_layout/tahap_dua/form_register.dart'; // Sesuaikan path ini

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override 
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Langsung return Scaffold!
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.computer, size: 80, color: Colors.blue),
                const SizedBox(height: 20),
                Text(
                  'Form Login',
                  style: Theme.of(context).textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Masukkan email lu di sini',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) return 'Email ga boleh kosong bro!';
                    if (!value.contains('@')) return 'Format email salah, harus pakai @';
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) return 'Password wajib diisi bro!';
                    if (value.length < 6) return 'Password minimal 6 karakter!';
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                
                ElevatedButton(
                  onPressed: () {
                    // 1. Cek validasi form dulu
                    if (_formKey.currentState!.validate()) {
                      
                      // 2. Ambil teks email yang diketik user dari controller
                      final emailDiketik = _emailController.text;

                      // 3. Pindah halaman sekaligus lempar datanya ke dalam constructor HomeScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(emailUser: emailDiketik), 
                        )
                      );
                      
                    } else {
                      print('Ada inputan yang salah bro!');
                    }
                  }, 
                  child: const Text('LOGIN', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                ),
                
                const SizedBox(height: 15),
                
                // Diubah jadi TextButton biar beda kasta sama tombol utamanya
                TextButton(
                  onPressed: (){
                    // Pindah numpuk ke halaman Register
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FormRegister())
                    );
                  }, 
                  child: const Text('Belum punya akun? Silahkan daftar')
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}