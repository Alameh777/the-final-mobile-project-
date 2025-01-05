import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Caketoppings extends StatefulWidget {
  Function f1, f2, f3;
  Caketoppings(
      {required this.f1, required this.f2, required this.f3, super.key});

  @override
  State<Caketoppings> createState() => _CaketoppingsState();
}

class _CaketoppingsState extends State<Caketoppings> {
  bool Cherries = false;
  bool fruit = false;
  bool nuts = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Select Your Cake Toppings :',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Cherries'),
            Checkbox(
              value: Cherries,
              onChanged: (value) {
                setState(() {
                  Cherries = value as bool;
                  widget.f1(Cherries);
                });
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Fresh Fruit Compote'),
            Checkbox(
              value: fruit,
              onChanged: (value) {
                setState(() {
                  fruit = value as bool;
                  widget.f2(fruit);
                });
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Toasted Nuts'),
            Checkbox(
              value: nuts,
              onChanged: (value) {
                setState(() {
                  nuts = value as bool;
                  widget.f3(nuts);
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}