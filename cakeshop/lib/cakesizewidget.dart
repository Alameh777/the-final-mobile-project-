import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Cakesizewidget extends StatefulWidget {
  Function f;
  Cakesizewidget({required this.f, super.key});

  @override
  State<Cakesizewidget> createState() => _CakesizewidgetState();
}

class _CakesizewidgetState extends State<Cakesizewidget> {
  String Cakesize = 'Small';
  List<String> list = ['Small', 'Medium', 'Large'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Select Cake Size',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        DropdownMenu<String>(
          initialSelection: Cakesize,
          onSelected: (String? value) {
            setState(() {
              Cakesize = value!;
              widget.f(Cakesize);
            });
          },
          dropdownMenuEntries: list.map((String item) {
            return DropdownMenuEntry<String>(
              value: item,
              label: item,
            );
          }).toList(),
        ),
      ],
    );
  }
}
