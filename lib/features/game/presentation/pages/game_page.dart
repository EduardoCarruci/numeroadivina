import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:numeroadivina/core/enums/difficulty.dart';
import 'package:numeroadivina/features/game/presentation/cubit/game_cubit.dart';
import '../widgets/widgets.dart';

class GamePage extends StatelessWidget {
  static const id = '/game';
  GamePage({super.key});

  static void pushNavigate(BuildContext context) => context.goNamed(id);

  final GameCubit cubit = GetIt.I<GameCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: _GameView(cubit: cubit),
    );
  }
}

class _GameView extends StatelessWidget {
  _GameView({Key? key, required this.cubit}) : super(key: key);

  final GameCubit cubit;
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _difficulties = [
    Difficulty.facil,
    Difficulty.medio,
    Difficulty.avanzado,
    Difficulty.extremo,
  ];

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
          /*   DifficultySlider(
              value: _difficulty,
              onChanged: (v) => setState(() => _difficulty = v),
              label: _difficulty < 0.5 ? 'easy' : 'hard',
            ), */
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
