
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:numeroadivina/features/game/presentation/pages/game_page.dart';
import 'package:numeroadivina/shared/app.dart';

import 'package:numeroadivina/shared/constans.dart';
import 'package:numeroadivina/shared/spaces.dart';
import 'package:numeroadivina/shared/textstyles.dart';

/// Router de la aplicación.
final appRouter = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: navigatorKey,
  initialLocation: GamePage.id,
  redirect: (_, state) async => null,
  routes: [
    GoRoute(
      name: GamePage.id,
      path: GamePage.id,
      builder: (_, __) =>  GamePage(),
    ),
  ],
  errorBuilder: (_, __) => const Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.cloud_off, size: 96, color: AppColors.primary),
          Spaces.kSizedBoxHeight16,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Adivina el Número\n¡Parece que algo salió mal!",
              textAlign: TextAlign.center,
              style: AppTextStyles.k20Style,
            ),
          ),
        ],
      ),
    ),
  ),
);
