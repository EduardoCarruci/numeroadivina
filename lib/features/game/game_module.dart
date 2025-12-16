
import 'package:get_it/get_it.dart';
import 'package:numeroadivina/features/game/domain/services/number_generator.dart';
import 'package:numeroadivina/features/game/domain/services/random_number_generator.dart';

void initGameModule() {
  final gi = GetIt.I;

  // Services
  gi.registerLazySingleton<NumberGenerator>(() => RandomNumberGenerator());


  // Usecases


  // Cubit / Provider

}
