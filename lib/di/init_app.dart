// Flutter imports:
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'init_modules.dart';

/// Permite acceder a get it.
final gi = GetIt.I;

/// Inicializa el core y todas las dependencias.

Future<void> initApp() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  initModules();
}
