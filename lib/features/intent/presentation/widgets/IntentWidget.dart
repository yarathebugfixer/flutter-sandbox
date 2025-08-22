import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/features/intent/presentation/bloc/IntentBloc.dart';
import 'package:tut_app/features/intent/presentation/bloc/IntentEvent.dart';

class IntentWidget extends StatelessWidget {
  const IntentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        GestureDetector(
          onTapDown: (_) {
            context.read<IntentBloc>().add(StartListeningIntentEvent());
          },
          onTapUp: (_) {
            context.read<IntentBloc>().add(StopListeningIntentEvent());
          },
          onTapCancel: () {
            context.read<IntentBloc>().add(StopListeningIntentEvent());
          },
          child: Container(
            height: 80,
            width: 80,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.mic, color: Colors.white, size: 40),
          ),
        ),
      ],
    );
  }
}


