import 'package:equatable/equatable.dart';

import 'package:numeroadivina/core/enums/gamestatus.dart';
import 'package:numeroadivina/features/game/domain/entities/game_entity.dart';

class GameState extends Equatable {
  final GameStatus status;
  final GameEntity? game;
  final String? message;
  final int selectedDifficultyIndex;

  const GameState({
    required this.status,
    this.game,
    this.message,
    this.selectedDifficultyIndex = 0,
  });

  factory GameState.initial() =>
      const GameState(status: GameStatus.initial, selectedDifficultyIndex: 0);

  GameState copyWith({
    GameStatus? status,
    GameEntity? game,
    String? message,
    int? selectedDifficultyIndex,
  }) {
    return GameState(
      status: status ?? this.status,
      game: game ?? this.game,
      message: message ?? this.message,
      selectedDifficultyIndex:
          selectedDifficultyIndex ?? this.selectedDifficultyIndex,
    );
  }

  @override
  List<Object?> get props => [status, game, message, selectedDifficultyIndex];
}
