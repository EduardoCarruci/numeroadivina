
import 'package:flutter/material.dart';
import 'package:numeroadivina/di/init_app.dart';
import 'package:numeroadivina/shared/app.dart';



/// Inicializa el core y todas las dependencias.
Future<void> main() async {

  await initApp();
 
  runApp(const App());
}
