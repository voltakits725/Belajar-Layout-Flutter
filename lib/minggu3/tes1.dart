import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tes')),
      body: Center(
        
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 250,
            maxWidth: 400,
          ),
          child: Card(
          elevation: 12,
          clipBehavior: Clip.antiAlias,
          color: Colors.blue[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue[300],
                    child: Icon(Icons.person, size: 30, color: Colors.red[400],),
                  
                  ),
                  Text('Rafly Kurniawan'),
                  Text('Prodi: Teknik Informatika'),
                  Text('Fullstack Web/Mobile Developer')
                  
              ],
            ),
          ), 
        ),
        )
      )
     
    );
  }
}