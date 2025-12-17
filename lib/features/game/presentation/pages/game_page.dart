import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import 'package:numeroadivina/core/enums/difficulty.dart';

import 'package:numeroadivina/features/game/presentation/cubit/game_cubit.dart';
import 'package:numeroadivina/features/game/presentation/cubit/game_state.dart';
import 'package:numeroadivina/features/game/presentation/widgets/build_box_column_widget.dart';
import 'package:numeroadivina/features/game/presentation/widgets/build_store_box_widget.dart';
import 'package:numeroadivina/features/game/presentation/widgets/input_number_widget.dart';
import 'package:numeroadivina/features/game/presentation/widgets/slider_level_widget.dart';
import 'package:numeroadivina/shared/constans.dart';
import 'package:numeroadivina/shared/spaces.dart';
import 'package:numeroadivina/shared/textstyles.dart';

import '../../../../core/enums/gamestatus.dart';

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

  void _submitGuess() {
    if (!_formKey.currentState!.validate()) return;
    final value = int.parse(_controller.text);
    cubit.makeGuess(value);
    _controller.clear();
  }

  TextEditingController get controller => _controller;
  GlobalKey<FormState> get formKey => _formKey;
  List<Difficulty> get difficulties => _difficulties;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        title: const Text('Adivina el Número',
            style: TextStyle(color: AppColors.white)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocConsumer<GameCubit, GameState>(
              listener: (context, state) async {
            if (state.game == null) return;
          }, builder: (context, state) {
            final game = state.game;
            if (game == null) {
              return const Center(child: CircularProgressIndicator());
            }

            final attemptsLeft = game.maxAttempts - game.attemptsUsed;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Top row: input left, attempts right
                  Row(
                    children: [
                      InputNumberWidget(
                          controller: controller,
                          formKey: formKey,
                          submitGuess: _submitGuess,
                          game: game),
                      Spaces.kSizedBoxWidth8,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('Intentos',
                              style: TextStyle(color: AppColors.white)),
                          Text('$attemptsLeft',
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: AppTextStyles.k18Style.fontSize)),
                        ],
                      ),
                    ],
                  ),
                  Spaces.kSizedBoxHeight16,

                  // Three columns
                  SizedBox(
                    height: 300,
                    child: Row(
                      children: [
                        Expanded(
                            child: BuildBoxColumn(
                                title: 'Mayor que',
                                items: game.higherGuesses
                                    .map((e) => e.toString())
                                    .toList())),
                        Spaces.kSizedBoxWidth8,
                        Expanded(
                            child: BuildBoxColumn(
                                title: 'Menor que',
                                items: game.lowerGuesses
                                    .map((e) => e.toString())
                                    .toList())),
                        Spaces.kSizedBoxWidth8,
                        Expanded(child: BuildHistoryBox(history: game.history)),
                      ],
                    ),
                  ),

                  Spaces.kSizedBoxHeight16,

                  // Slider
                  Column(
                    children: [
                      SliderLevel(cubit: cubit, difficulties: _difficulties),
                      Text(
                          _difficulties[state.selectedDifficultyIndex]
                              .name
                              .toUpperCase(),
                          style: const TextStyle(color: Colors.white70)),
                    ],
                  ),

                  Spaces.kSizedBoxHeight8,

                  // Submit button and finished message
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed:
                              game.isFinished ? null : () => _submitGuess(),
                          child: Text('Probar',
                              style: TextStyle(
                                  color: game.isFinished
                                      ? Colors.white38
                                      : AppColors.primary)),
                        ),
                      ),
                      Spaces.kSizedBoxWidth8,
                      if (state.status == GameStatus.finished)
                        ElevatedButton(
                          onPressed: () => cubit.reset(),
                          child: const Text(
                            "Reiniciar",
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
