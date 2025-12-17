import 'package:flutter/material.dart';

class ThreeColumns extends StatelessWidget {
  final List<String> titles;
  const ThreeColumns({super.key, this.titles = const ['Mayor que', 'Menor que', 'Historial']});

  Widget _card(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white70, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(right: 6),
            padding: const EdgeInsets.all(8),
            child: const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: titles.map((t) => Expanded(child: _card(t))).toList(),
      ),
    );
  }
}
