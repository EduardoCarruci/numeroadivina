import 'package:flutter/material.dart';

class DifficultySlider extends StatelessWidget {
  final double value;
  final ValueChanged<double>? onChanged;
  final String label;
  const DifficultySlider({super.key, this.value = 0.0, this.onChanged, this.label = 'easy'});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: value,
          onChanged: onChanged ?? (_) {},
          min: 0,
          max: 1,
        ),
        Text(label),
      ],
    );
  }
}
