import 'package:flutter/material.dart';

class GameHeader extends StatelessWidget {
  final String title;
  const GameHeader({super.key, this.title = 'Adivina el Número'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
