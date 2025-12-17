

import 'package:numeroadivina/core/enums/difficulty.dart';
import 'package:numeroadivina/features/game/domain/entities/game_entity.dart';
import 'package:numeroadivina/features/game/domain/services/number_generator.dart';

final class StartGameUseCase {
  final NumberGenerator numberGenerator;

  const StartGameUseCase(this.numberGenerator);

  GameEntity call(Difficulty difficulty) {
    return GameEntity(
      difficulty: difficulty,
      secretNumber: numberGenerator.generate(difficulty.maxNumber),
      maxAttempts: difficulty.maxAttempts,
      attemptsUsed: 0,
      higherGuesses: const [],
      lowerGuesses: const [],
      history: const [],
    );
  }
}