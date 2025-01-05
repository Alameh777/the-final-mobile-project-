import 'package:flutter/material.dart';
// ignore: must_be_immutable
class Caketypewidget extends StatefulWidget {
  Function f;
  Caketypewidget({required this.f, super.key});

  @override
  State<Caketypewidget> createState() => _CaketypewidgetState();
}

class _CaketypewidgetState extends State<Caketypewidget> {
  // ignore: non_constant_identifier_names
  String Caketype = 'Sponge';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Select Cake Type',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: 'Sponge',
              groupValue: Caketype,
              onChanged: (value) {
                setState(() {
                  Caketype = value as String;
                  widget.f(Caketype);
                });
              },
            ),
            const Text('Sponge'),
            Radio(
              value: 'Marble',
              groupValue: Caketype,
              onChanged: (value) {
                setState(() {
                  Caketype = value as String;
                  widget.f(Caketype);
                });
              },
            ),
            const Text('Marble'),
            Radio(
              value: 'Butter Cake',
              groupValue: Caketype,
              onChanged: (value) {
                setState(() {
                  Caketype = value as String;
                  widget.f(Caketype);
                });
              },
            ),
            const Text('Butter Cake'),
          ],
        ),
      ],
    );
  }
}
