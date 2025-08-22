import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/features/number_fact/presentation/bloc/NumberFactBloc.dart';
import 'package:tut_app/features/number_fact/presentation/bloc/NumberFactEvent.dart';

class ReportDialogBox extends StatelessWidget {
  final String fact;


  const ReportDialogBox({
    required this.fact,
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
