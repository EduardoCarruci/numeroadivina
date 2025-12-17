import 'package:flutter/material.dart';
import 'package:numeroadivina/core/enums/difficulty.dart';
import 'package:numeroadivina/core/util/input_validator.dart';
import 'package:numeroadivina/features/game/domain/entities/game_entity.dart';
import 'package:numeroadivina/shared/constans.dart';

class InputNumberWidget extends StatelessWidget {
  const InputNumberWidget(
      {super.key,
      required this.controller,
      required this.formKey,
      required this.submitGuess,
      required this.game});

  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final void Function() submitGuess;
  final GameEntity game;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.white),
        ),
        child: Form(
          key: formKey,
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: AppColors.white),
            decoration: const InputDecoration(
              hintText: 'Numbers',
              hintStyle: TextStyle(color: AppColors.white),
              border: InputBorder.none,
            ),
            validator: (v) => InputValidator.validateGuess(
                v ?? '', game.difficulty.maxNumber),
            onFieldSubmitted: (_) => submitGuess(),
          ),
        ),
      ),
    );
  }
}
