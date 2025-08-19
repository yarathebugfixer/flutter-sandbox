// NumberFactPage.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/features/auth/presentation/bloc/AuthBloc.dart';
import 'package:tut_app/features/auth/presentation/bloc/AuthEvent.dart';
import 'package:tut_app/features/auth/presentation/bloc/AuthState.dart';
import 'package:tut_app/features/number_fact/presentation/bloc/NumberFactBloc.dart';
import 'package:tut_app/features/number_fact/presentation/bloc/NumberFactEvent.dart';
import 'package:tut_app/features/number_fact/presentation/bloc/NumberFactState.dart';
import 'package:tut_app/features/number_fact/presentation/widgets/NumberFactBody.dart';

class NumberFactPage extends StatelessWidget {
  const NumberFactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final numberFactBloc = context.read<NumberFactBloc>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF3F5FF),
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
                backgroundColor: const Color(0xffF3F5FF),
                child: Icon(
                  isAuthenticated ? Icons.person : Icons.arrow_back,
                  color: const Color.fromARGB(255, 89, 55, 148),
                  size: 28,
                ),
              ),
            );
          },
        ),
      ),
      backgroundColor: const Color(0xffF3F5FF),
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                numberFactBloc.add(NumberFactRefreshedEvent());
              },
              icon: const Icon(Icons.refresh_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
