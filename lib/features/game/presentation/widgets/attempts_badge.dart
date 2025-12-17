import 'package:flutter/material.dart';

class AttemptsBadge extends StatelessWidget {
  final int attempts;
  final String label;
  const AttemptsBadge({super.key, this.attempts = 0, this.label = 'Intentos'});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(label),
        const SizedBox(height: 8),
        Text(
          attempts.toString(),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
