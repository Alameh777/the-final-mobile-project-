import 'package:cakeshop/ThirdPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Cakes.dart'; 

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<Cake> cakes = []; 

  @override
  void initState() {
    super.initState();
    loadCakes();
  }

  // Load all cakes
  void loadCakes() async {
    try {
      const url = 'http://localhost/getCake.php';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          cakes = data.map<Cake>((obj) => Cake.fromJson(obj)).toList();
        });
      } else {
        print('Failed to load cakes: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  
  void searchCakes(String name) async {
    try {
      String url = 'http://localhost/searchCake.php?name=$name';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          cakes = data.map<Cake>((obj) => Cake.fromJson(obj)).toList();
        });
      } else {
        print('Failed to search cakes: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cakes Page'),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: Column(
        children: [
          
          TextField(
            onChanged: (name) {
              searchCakes(name); 
            },
            decoration: const InputDecoration(
              labelText: 'Search Cakes',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
         
          Expanded(
            child: cakes.isEmpty
                ? Center(child: Text('No cakes found.'))
                : ListView.builder(
                    itemCount: cakes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(cakes[index].name),
                        subtitle: Text(
                            'Ingredients: ${cakes[index].ingredients}\nRecipe: ${cakes[index].recipe}'),
                      );
                    },
                  ),
          ),

           ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Thirdpage()));
              },
              child: const Icon(Icons.navigate_next, size: 50),
            )
        ],
      ),
    );
  }
}
