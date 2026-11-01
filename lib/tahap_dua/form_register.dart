import 'package:flutter/material.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({super.key});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isSetuju = false;
  final List<String> _pilihanGender = ['Laki-laki', 'Perempuan'];

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _genderController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Langsung return Scaffold!
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Register'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.app_registration_sharp, size: 100, color: Colors.teal[400]),
              const SizedBox(height: 20),
              Text(
                'Buat Akun Baru',
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  hintText: 'Masukkan nama depan',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) => value == null || value.isEmpty ? 'Nama depan nggak boleh kosong bro!' : null,
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  hintText: 'Masukkan nama belakang',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (value) => value == null || value.isEmpty ? 'Nama belakang wajib diisi!' : null,
              ),
              const SizedBox(height: 15),

              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.wc),
                ),
                hint: const Text('Pilih jenis kelamin'),
                items: _pilihanGender.map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _genderController.text = newValue ?? ''; 
                  });
                },
                validator: (value) => value == null ? 'Pilih gender lu bro!' : null,
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'contoh@gmail.com',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Email wajib diisi!';
                  if (!value.contains('@')) return 'Format email salah!';
                  return null;
                },
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Minimal 6 karakter',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Password wajib diisi!';
                  if (value.length < 6) return 'Password minimal 6 karakter!';
                  return null;
                },
              ),
              const SizedBox(height: 15),

              Row(
                children: [
                  Checkbox(
                    value: _isSetuju,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _isSetuju = newValue ?? false;
                      });
                    },
                  ),
                  const Expanded(
                    child: Text('Saya setuju dengan Syarat & Ketentuan yang berlaku.'),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (!_isSetuju) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Lu harus setuju syarat & ketentuan dulu bro!')),
                      );
                      return;
                    }
                    print('=== PENDAFTARAN SUKSES ===');
                    print('Nama: ${_firstNameController.text} ${_lastNameController.text}');
                    print('Gender: ${_genderController.text}');
                    print('Email: ${_emailController.text}');
                  }
                },
                child: const Text('REGISTER', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              
              const SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  // Perintah pop ini buang layar Register, nampilin layar Login di baliknya
                  Navigator.pop(context);
                },
                child: const Text(
                  'Sudah punya akun? Silahkan Login',
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}