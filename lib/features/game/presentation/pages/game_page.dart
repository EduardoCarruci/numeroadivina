import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/widgets.dart';

class GamePage extends StatefulWidget {
  static const id = '/game';
  const GamePage({super.key});

  static void pushNavigate(BuildContext context) => context.goNamed(id);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final TextEditingController _controller = TextEditingController();
  double _difficulty = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adivina el Número')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const GameHeader(),
            Row(
              children: [
                Expanded(child: NumberInput(controller: _controller)),
                const SizedBox(width: 12),
                const AttemptsBadge(attempts: 5),
              ],
            ),
            const SizedBox(height: 16),
            const ThreeColumns(),
            const SizedBox(height: 12),
            DifficultySlider(
              value: _difficulty,
              onChanged: (v) => setState(() => _difficulty = v),
              label: _difficulty < 0.5 ? 'easy' : 'hard',
            ),
            const SizedBox(height: 12),
            PrimaryButton(
              text: 'Probar',
              onPressed: () {
                // placeholder action
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Probar pulsado')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

