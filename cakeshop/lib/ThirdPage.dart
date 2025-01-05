import 'package:cakeshop/cakesizewidget.dart';
import 'package:flutter/material.dart';
import 'package:cakeshop/caketoppings.dart';
import 'cakesauce.dart';
import 'Caketypewidget.dart';


class Thirdpage extends StatefulWidget {
  const Thirdpage({super.key});

  @override
  State<Thirdpage> createState() => _ThirdpageState();
}

class _ThirdpageState extends State<Thirdpage> {
  String caketype = 'Sponge';
  String cakeSize = 'Small';
  bool cherries = false;
  bool fruit = false;
  bool nuts = false;
  String cakesauce = 'vanilla';
  double totalprice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Now'),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Caketypewidget(f: updateCaketype),
              Caketoppings(
                f1: updatewithCherries,
                f2: updatewithNuts,
                f3: updatewithFruit,
              ),
              Cakesizewidget(f: updatesize),
              Cakesauce(f: updatesauce),
              const SizedBox(height: 30),
              Text(
                'Total Price: ${UpdatePrice()} \$',
                style: const TextStyle(
                  fontSize: 30,
                  backgroundColor: Color.fromARGB(255, 142, 33, 243),
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  void updatesauce(selectedType) {
    cakesauce = selectedType;
    UpdatePrice();
  }

  void updatesize(selectedType) {
    cakeSize = selectedType;
    UpdatePrice();
  }

  void updatewithCherries(selectedType) {
    cherries = selectedType;
    UpdatePrice();
  }

  void updatewithFruit(selectedType) {
    fruit = selectedType;
    UpdatePrice();
  }

  void updateCaketype(selectedType) {
    caketype = selectedType;
    UpdatePrice();
  }

  void updatewithNuts(selectedType) {
    nuts = selectedType;
    UpdatePrice();
  }

  double UpdatePrice() {
    double tempprice = 0;

    switch (caketype) {
      case 'Sponge':
        tempprice += 5;
        break;
      case 'Marble':
        tempprice += 7;
        break;
      case 'Butter Cake':
        tempprice += 10;
        break;
    }

    switch (cakeSize) {
      case 'Small':
        tempprice += 10;
        break;
      case 'Large':
        tempprice += 18;
        break;
      case 'Medium':
        tempprice += 14;
        break;
    }
    if (cherries) {
      tempprice += 2;
    }
    if (nuts) {
      tempprice += 1;
    }
    if (fruit) {
      tempprice += 2;
    }

    switch (cakesauce) {
      case 'vanilla':
        tempprice += 1;
        break;
      case 'chocolate':
        tempprice += 2;
        break;
    }

    setState(() {
      totalprice = tempprice;
    });
    return tempprice;
  }
}
