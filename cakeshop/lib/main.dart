import 'package:cakeshop/SecondPage.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cake Shop'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text('Welcome to our CakeShop!'),
            const SizedBox(height: 30),
            const Text('We prepare Cakes in all sizes and all types'),
            const SizedBox(height: 30),
            const Text(
                'We Also Share a great collection of recipes for our customers to try '),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SecondPage()));
              },
              child: const Icon(Icons.navigate_next, size: 50),
            )
          ],
        ),
      ),
    );
  }
}

