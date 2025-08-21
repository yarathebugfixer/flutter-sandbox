import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/features/auth/presentation/bloc/AuthBloc.dart';
import 'package:tut_app/features/auth/presentation/bloc/AuthEvent.dart';
import 'package:tut_app/features/auth/presentation/bloc/AuthState.dart';
import 'package:tut_app/features/number_fact/presentation/bloc/NumberFactBloc.dart';
import 'package:tut_app/features/number_fact/presentation/bloc/NumberFactState.dart';
import 'package:tut_app/features/number_fact/presentation/widgets/NumberFactBody.dart';
import 'package:tut_app/features/intent/presentation/widgets/IntentWidget.dart';

class NumberFactPage extends StatelessWidget {
  const NumberFactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            final isAuthenticated = authState is Authenticated;
            return GestureDetector(
              onTap: () {
                if (!isAuthenticated) {
                  Navigator.pushNamed(context, '/signin');
                } else {
                  context.read<AuthBloc>().add(LogOutRequestedEvent());
                }
              },
              child: CircleAvatar(
                radius: 24,
                backgroundColor: theme.scaffoldBackgroundColor,
                child: Icon(
                  isAuthenticated ? Icons.person : Icons.arrow_back,
                  color: theme.colorScheme.primary,
                  size: 28,
                ),
              ),
            );
          },
        ),
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: BlocBuilder<NumberFactBloc, NumberFactState>(
        builder: (context, state) {
          return NumberFactBody(
            fact: state.fact,
            number: state.number,
            isChecked: state.isChecked,
            checkedText: state.checkedText,
            isFactLoading: state.isFactLoading,
            isCheckLoading: state.isCheckLoading,
          );
        },
      ),
      floatingActionButton: SpeechButton(),
    );
  }
}
