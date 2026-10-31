import 'package:flutter/material.dart';

class TahapDuaEmpatScreen extends StatefulWidget {
  const TahapDuaEmpatScreen({super.key});

  @override
  State<TahapDuaEmpatScreen> createState() => _TahapDuaEmpatScreenState();
}

class _TahapDuaEmpatScreenState extends State<TahapDuaEmpatScreen> {
  // 1. Siapkan variabel (state) untuk nyimpen nilai dari masing-masing widget
  bool _isSetuju = false;        // Default Checkbox: belum dicentang
  bool _isNotifAktif = true;     // Default Switch: nyala
  String? _kotaPilihan;          // Default Dropdown: kosong (null)

  // Data array untuk isi pilihan di Dropdown
  final List<String> _daftarKota = ['Jakarta', 'Bandung', 'Surabaya', 'Yogyakarta'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox, Switch, Dropdown'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            // ==========================================
            // 1. CHECKBOX
            // ==========================================
            const Text('1. Checkbox', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Row(
              children: [
                Checkbox(
                  value: _isSetuju,
                  // onChanged akan kepanggil pas user ngeklik kotaknya
                  onChanged: (bool? newValue) {
                    // setState bikin layar refresh dan nerapin nilai baru
                    setState(() {
                      _isSetuju = newValue ?? false;
                    });
                  },
                ),
                const Text('Saya setuju dengan Syarat & Ketentuan'),
              ],
            ),

            const SizedBox(height: 20),

            // ==========================================
            // 2. SWITCH (Pakai SwitchListTile biar instan rapi)
            // ==========================================
            const Text('2. Switch', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SwitchListTile(
                title: const Text('Aktifkan Notifikasi'),
                subtitle: const Text('Dapatkan info promo terbaru dari kami'),
                value: _isNotifAktif,
                activeColor: Colors.blue, // Warna pas saklarnya On
                onChanged: (bool newValue) {
                  setState(() {
                    _isNotifAktif = newValue;
                  });
                },
              ),
            ),

            const SizedBox(height: 30),

            // ==========================================
            // 3. DROPDOWN (Pakai DropdownButtonFormField biar bisa masuk ke Form)
            // ==========================================
            const Text('3. Dropdown', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 10),
            
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(), // Bikin kotak pinggiran kayak TextField
                labelText: 'Pilih Kota Domisili',
                prefixIcon: Icon(Icons.location_city),
              ),
              value: _kotaPilihan,
              hint: const Text('Pilih Kota...'),
              // Looping data array jadi daftar pilihan (DropdownMenuItem)
              items: _daftarKota.map((String kota) {
                return DropdownMenuItem<String>(
                  value: kota,
                  child: Text(kota),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _kotaPilihan = newValue;
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}