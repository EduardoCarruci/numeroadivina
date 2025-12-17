

import 'package:flutter_bloc/flutter_bloc.dart';



import 'package:numeroadivina/core/enums/difficulty.dart';
import 'package:numeroadivina/core/enums/gamestatus.dart';
import 'package:numeroadivina/features/game/domain/entities/game_entity.dart';
import 'package:numeroadivina/features/game/domain/entities/guess_entity.dart';
import 'package:numeroadivina/features/game/domain/usecases/finish_game_usecase.dart';
import 'package:numeroadivina/features/game/domain/usecases/start_game_usecase.dart';
import 'game_state.dart';

final class GameCubit extends Cubit<GameState> {
  final StartGameUseCase _startGameUseCase;
  final FinishGameUseCase _finishGameUseCase;

  GameCubit(this._startGameUseCase, this._finishGameUseCase)
      : super(GameState.initial()) {
    startGame(Difficulty.facil);
  }

  void selectDifficultyIndex(int index) {
    emit(state.copyWith(selectedDifficultyIndex: index));
  }

  void startGame(Difficulty difficulty) {
    final game = _startGameUseCase(difficulty);
    emit(state.copyWith(
      status: GameStatus.started,
      game: game,
      message: null,
      selectedDifficultyIndex: difficulty.index,
    ));
  }

  void makeGuess(int value) {
    final currentGame = state.game;
    if (currentGame == null) return;
    if (currentGame.isFinished) return;

    final secret = currentGame.secretNumber;
    final isCorrect = value == secret;
    final attemptsUsed = currentGame.attemptsUsed + 1;

    final higher = List<int>.from(currentGame.higherGuesses);
    final lower = List<int>.from(currentGame.lowerGuesses);

    if (value > secret) {
      higher.add(value);
    } else if (value < secret) {
      lower.add(value);
    }

    final history = List<GuessEntity>.from(currentGame.history)
      ..add(GuessEntity(value: value, isCorrect: isCorrect));

    final updated = GameEntity(
      difficulty: currentGame.difficulty,
      secretNumber: currentGame.secretNumber,
      maxAttempts: currentGame.maxAttempts,
      attemptsUsed: attemptsUsed,
      higherGuesses: higher,
      lowerGuesses: lower,
      history: history,
    );

    final newStatus = (isCorrect || attemptsUsed >= updated.maxAttempts)
        ? GameStatus.finished
        : GameStatus.started;

    emit(state.copyWith(status: newStatus, game: updated));
    // Si el juego ha terminado, llamar a FinishGameUseCase
    if (newStatus == GameStatus.finished) {
      _finishGameUseCase(updated);
    }
  }
  // Reinicia el juego al estado inicial con la dificultad fácil.
  void reset() => startGame(Difficulty.facil);
}
