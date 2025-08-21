import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final numberFactBloc = context.read<NumberFactBloc>();
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Random Fact',
            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
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
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: theme.colorScheme.primary,
                strokeWidth: 2,
              ),
            )
          else
            Text(
              '$number',
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),

          const SizedBox(height: 16),

          // Fact text (full width, centered)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              fact,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge,
            ),
          ),

          const SizedBox(height: 16),

          if (isCheckLoading)
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: theme.colorScheme.primary,
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
              child: Text(
                "Fact check this with Gemini!",
                style: theme.textTheme.labelLarge,
              ),
            )
          else
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                checkedText!,
                style: theme.textTheme.bodyMedium,
              ),
            ),

          IconButton(
            onPressed: () {
              numberFactBloc.add(NumberFactRefreshedEvent());
            },
            icon: Icon(Icons.refresh_outlined, color: theme.iconTheme.color),
          ),
        ],
      ),

      
    );
  }
}
