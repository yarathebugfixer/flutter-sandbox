import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:tut_app/features/number_fact/presentation/bloc/NumberFactBloc.dart';
import 'package:tut_app/features/number_fact/presentation/bloc/NumberFactEvent.dart';

class NumberFactBody extends StatelessWidget {
  final String fact;
  final int number;
  final bool isChecked;
  final String? checkedText;
  final bool isFactLoading;
  final bool isCheckLoading;

  const NumberFactBody({
    super.key,
    required this.fact,
    required this.number,
    required this.isChecked,
    this.checkedText,
    required this.isFactLoading,
    required this.isCheckLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Random Fact',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Container(
            height: 200,
            width: 200,
            child: Image.asset("assets/art/samy.png"),
          ),
          const SizedBox(height: 16),

          // Spinner instead of number when fetching new fact
          if (isFactLoading)
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 89, 55, 148),
                strokeWidth: 2,
              ),
            )
          else
            Text(
              '$number',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

          const SizedBox(height: 16),

          // Fact text (full width, centered)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              fact,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),

          const SizedBox(height: 16),

          // Spinner instead of check button when Gemini is checking
          if (isCheckLoading)
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color:  Color.fromARGB(255, 89, 55, 148),
                strokeWidth: 2,
              ),
            )
          else if (!isChecked)
            TextButton(
              onPressed: () {
                final currentState = context.read<NumberFactBloc>().state;
                context.read<NumberFactBloc>().add(
                  NumberFactAICheckedEvent(
                    currentState.fact,
                    currentState.number,
                  ),
                );
              },
              child: const Text("Fact check this with Gemini!"),
            )
          else
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                checkedText!,
                ),
              ),
            
        ],
      ),
    );
  }
}
