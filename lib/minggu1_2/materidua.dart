import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MateriDuaScreen extends StatelessWidget {
  const MateriDuaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Padding, Align, SizedBox'),
      backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('1. Contoh Padding',
            style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),

            Container(
              color: Colors.blue,
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Text('Teks ini dibungkus padding 20'),
              ),
            ),

            //Spasi pemisah anatar materi
            const SizedBox(height: 40,),

            Container(
              //width: double.infinity,
              //height: 100,
              padding: EdgeInsets.all(20),
              //margin: EdgeInsets.all(20),
              color: Colors.pink,
              child: Text('Teks ini dibungkus padding 20'),
            ),

            const SizedBox(height: 40,),

            const Text(
              '2. Contoh Align',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Container(
              width: double.infinity,
              height: 100,
              color: Colors.grey[300],
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
              ),
            ),

            const SizedBox(height: 40),
            const Text('3. Contoh SizedBox (untuk Ukuran dan jarak)', style: TextStyle(fontWeight: FontWeight.bold),),

            const SizedBox(height: 10),

            Row(
              children: [
                Container(
                  color: Colors.green,
                  width: 50,
                  height: 50,
                ),

                // SizedBox di sini murni jadi spasi horizontal transparan
                const SizedBox(width: 100),

                ElevatedButton(
                    onPressed: (){}, 
                    child: const Text('Tombol kaku')),
                

                // SizedBox(
                //   width: 150,
                //   height: 50,
                //   child: 
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}