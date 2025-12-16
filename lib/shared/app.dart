

import 'package:flutter/material.dart';
import 'package:numeroadivina/core/app/app_router.dart';


final navigatorKey = GlobalKey<NavigatorState>();

final class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Adivina el Número',
      routerConfig: appRouter,
    );
  }
}
