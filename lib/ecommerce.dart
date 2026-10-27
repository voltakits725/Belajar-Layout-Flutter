import 'package:flutter/material.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(title: const Text('Ecommerce App'),
        backgroundColor: Colors.blueAccent,

        bottom: const TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.lightBlueAccent,
          indicatorColor: Colors.tealAccent,
          indicatorWeight: 4,
          tabs: [
            Tab(icon: Icon(Icons.storage), text: 'baju'),
            Tab(icon: Icon(Icons.storage), text: 'Celana'),
            Tab(icon: Icon(Icons.storage), text: 'Sempak'),
            Tab(icon: Icon(Icons.storage), text: 'Jaket'),

            ],
          ),
        ),

        body: const TabBarView(
          children: [
            Center(
              child: Column(),
            )
          ]
        ),
      )
    );
  }
}