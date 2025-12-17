import 'package:flutter/material.dart';
import 'package:numeroadivina/core/enums/difficulty.dart';
import 'package:numeroadivina/features/game/presentation/cubit/game_cubit.dart';
class SliderLevel extends StatelessWidget {
  const SliderLevel({
    super.key,
    required this.cubit,
    required List<Difficulty> difficulties,
  }) : _difficulties = difficulties;

  final GameCubit cubit;
  final List<Difficulty> _difficulties;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: cubit.state.selectedDifficultyIndex.toDouble(),
      min: 0,
      max: 3,
      divisions: 3,
      activeColor: Colors.blue,
      inactiveColor: Colors.white24,
      onChanged: (v) =>
          cubit.selectDifficultyIndex(v.round()),
      onChangeEnd: (v) {
        final diff = _difficulties[v.round()];
        cubit.startGame(diff);
      },
    );
  }
}
