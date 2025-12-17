
import 'package:flutter/material.dart';
import 'package:numeroadivina/features/game/domain/entities/guess_entity.dart';
import 'package:numeroadivina/shared/spaces.dart';

class BuildHistoryBox extends StatelessWidget {
  const BuildHistoryBox({
    super.key,
    required this.history,
  });

  final List<GuessEntity> history;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Historial',
           textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      Spaces.kSizedBoxHeight8,
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            child: history.isEmpty
                ? const SizedBox.shrink()
                : ListView.builder(
                    itemCount: history.length,
                    itemBuilder: (context, index) {
                      final g = history[index];
                      final color = g.isCorrect ? Colors.green : Colors.red;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text('${g.value}',
                           textAlign: TextAlign.center,
                            style: TextStyle(color: color, fontSize: 16)),
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
