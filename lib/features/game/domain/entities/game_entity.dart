
import 'package:equatable/equatable.dart';
import 'package:numeroadivina/core/enums/difficulty.dart';
import 'package:numeroadivina/features/game/domain/entities/guess_entity.dart';

class GameEntity extends Equatable {
  final Difficulty difficulty;
  final int secretNumber;
  final int maxAttempts;
  final int attemptsUsed;
  final List<int> higherGuesses;
  final List<int> lowerGuesses;
  final List<GuessEntity> history;

  const GameEntity({
    required this.difficulty,
    required this.secretNumber,
    required this.maxAttempts,
    required this.attemptsUsed,
    required this.higherGuesses,
    required this.lowerGuesses,
    required this.history,
  });

  bool get hasAttemptsLeft => attemptsUsed < maxAttempts;

  bool get isFinished => history.any((g) => g.isCorrect) || !hasAttemptsLeft;

  @override
  List<Object?> get props => [
        difficulty,
        secretNumber,
        maxAttempts,
        attemptsUsed,
        higherGuesses,
        lowerGuesses,
        history,
      ];
}
