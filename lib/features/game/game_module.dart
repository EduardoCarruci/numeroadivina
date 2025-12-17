import 'package:get_it/get_it.dart';
import 'package:numeroadivina/features/game/domain/services/number_generator.dart';
import 'package:numeroadivina/features/game/domain/services/random_number_generator.dart';
import 'package:numeroadivina/features/game/domain/usecases/start_game_usecase.dart';
import 'package:numeroadivina/features/game/presentation/cubit/game_cubit.dart';

void initGameModule() {
  final gi = GetIt.I;

  // Services
  gi.registerLazySingleton<NumberGenerator>(() => RandomNumberGenerator());

  // Usecases
  gi.registerLazySingleton<StartGameUseCase>(() => StartGameUseCase(gi()));

  // Cubit / Provider
  gi.registerLazySingleton<GameCubit>(() => GameCubit(gi()));
}
