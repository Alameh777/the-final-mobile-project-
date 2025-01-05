import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Cakesauce extends StatefulWidget {
  Function f;
  Cakesauce({required this.f, super.key});

  @override
  State<Cakesauce> createState() => _CakesauceState();
}

class _CakesauceState extends State<Cakesauce> {
  String sauce = 'vanilla';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Select Sauce',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: 'vanilla',
              groupValue: sauce,
              onChanged: (value) {
                setState(() {
                  sauce = value as String;
                  widget.f(sauce);
                });
              },
            ),
            const Text('vanilla'),
            Radio(
              value: 'chocolate',
              groupValue: sauce,
              onChanged: (value) {
                setState(() {
                  sauce = value as String;
                  widget.f(sauce);
                });
              },
            ),
            const Text('chocolate'),
          ],
        ),
      ],
    );
  }
}
