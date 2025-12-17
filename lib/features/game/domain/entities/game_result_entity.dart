import 'package:equatable/equatable.dart';
import 'package:numeroadivina/core/enums/difficulty.dart';

class GameResult extends Equatable {
  final bool won;
  final int attemptsUsed;
  final int attemptsLeft;
  final int secretNumber;
  final Difficulty difficulty;
  final DateTime finishedAt;

  const GameResult({
    required this.won,
    required this.attemptsUsed,
    required this.attemptsLeft,
    required this.secretNumber,
    required this.difficulty,
    required this.finishedAt,
  });

  @override
  List<Object?> get props =>
      [won, attemptsUsed, attemptsLeft, secretNumber, difficulty, finishedAt];
}
