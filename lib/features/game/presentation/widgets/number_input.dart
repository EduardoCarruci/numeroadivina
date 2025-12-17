import 'package:flutter/material.dart';

class NumberInput extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  const NumberInput({super.key, this.controller, this.hintText = 'Numbers'});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      ),
    );
  }
}
