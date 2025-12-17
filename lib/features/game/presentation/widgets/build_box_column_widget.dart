import 'package:flutter/material.dart';

class BuildBoxColumn extends StatelessWidget {
  const BuildBoxColumn({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title,
           textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            child: items.isEmpty
                ? const SizedBox.shrink()
                : ListView(
                    children: items
                        .map((s) => Text(s,
                           textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white)))
                        .toList(),
                  ),
          ),
        ),
      ],
    );
  }
}
