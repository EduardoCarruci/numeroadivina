import 'package:numeroadivina/features/game/domain/entities/game_entity.dart';
import 'package:numeroadivina/features/game/domain/entities/game_result_entity.dart';

final class FinishGameUseCase {
  const FinishGameUseCase();

  GameResult call(GameEntity game) {
    final won = game.history.any((g) => g.isCorrect);
    final attemptsUsed = game.attemptsUsed;
    final attemptsLeft =
        (game.maxAttempts - attemptsUsed).clamp(0, game.maxAttempts);

    return GameResult(
      won: won,
      attemptsUsed: attemptsUsed,
      attemptsLeft: attemptsLeft,
      secretNumber: game.secretNumber,
      difficulty: game.difficulty,
      finishedAt: DateTime.now(),
    );
  }
}
