import 'dart:math';
import 'package:numeroadivina/features/game/domain/services/number_generator.dart';

class RandomNumberGenerator implements NumberGenerator {
  @override
  int generate(int max) {
    return Random().nextInt(max) + 1;
  }
}
