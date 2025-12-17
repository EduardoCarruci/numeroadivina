
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'init_modules.dart';

/// Permite acceder a get it.
final gi = GetIt.I;



Future<void> initApp() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  //inicializar modulos
  initModules();
}
