import 'package:equatable/equatable.dart';

class GuessEntity extends Equatable {
  final int value;
  final bool isCorrect;

  const GuessEntity({
    required this.value,
    required this.isCorrect,
  });

  @override
  List<Object?> get props => [value, isCorrect];

}