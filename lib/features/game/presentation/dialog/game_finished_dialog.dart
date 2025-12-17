
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:numeroadivina/features/game/domain/entities/game_entity.dart';
import 'package:numeroadivina/features/game/presentation/cubit/game_cubit.dart';
import 'package:numeroadivina/shared/constans.dart';
import 'package:numeroadivina/shared/spaces.dart';

class GameFinishedDialog extends StatelessWidget {
  final GameEntity game;
  final GameCubit cubit;
  final bool won;
  final String title;
  final String subtitle;
  final String gifUrl;

  GameFinishedDialog({Key? key, required this.game, required this.cubit})
      : won = game.history.any((g) => g.isCorrect),
        title = (game.history.any((g) => g.isCorrect))
            ? '¡Ganaste!'
            : 'Juego finalizado',
        subtitle = (game.history.any((g) => g.isCorrect))
            ? 'Acertaste el número ${game.secretNumber} en ${game.attemptsUsed} intentos.'
            : 'Se acabaron los intentos. El número era ${game.secretNumber}.',
        gifUrl = (game.history.any((g) => g.isCorrect))
            ? AppImages.gifWin
            : AppImages.gifLose,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.primary,
      title: Text(title, style: const TextStyle(color: Colors.white)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 140,
            child: Image.asset(gifUrl,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const SizedBox.shrink()),
          ),
          Spaces.kSizedBoxHeight8,
          Text(subtitle, style: const TextStyle(color: Colors.white70)),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => GoRouter.of(context).pop(),
          child: const Text('Cerrar', style: TextStyle(color: Colors.white70)),
        ),
        ElevatedButton(
          onPressed: () {
            // Reiniciar el juego
            GoRouter.of(context).pop();

            try {
              cubit.reset();
            } catch (_) {}
          },
          child: const Text('Reiniciar'),
        ),
      ],
    );
  }
}
