import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/features/number_fact/presentation/bloc/NumberFactBloc.dart';
import 'package:tut_app/features/number_fact/presentation/bloc/NumberFactState.dart';
import 'package:tut_app/features/number_fact/presentation/widgets/NumberFactBody.dart';
import 'package:tut_app/features/intent/presentation/widgets/IntentWidget.dart';

class NumberFactPage extends StatelessWidget {
  const NumberFactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      floatingActionButton: IntentWidget(),
    );
  }
}
