
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';


class GamePage extends StatelessWidget {
  static const id = '/game';
  const GamePage({super.key});

  static void pushNavigate(BuildContext context) => context.goNamed(id);

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adivina el Número'),
      ),
      body: Container(),
    );
  }
}