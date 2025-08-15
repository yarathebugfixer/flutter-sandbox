import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
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
    
      backgroundColor: Color(0xffF3F5FF),
      body: BlocBuilder<NumberFactBloc, NumberFactState>(builder: (context, state){
     return (NumberFactBody(fact: state.fact, number: state.number,)
      );}),
      
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => {numberFactBloc.add(NumberFactRefreshedEvent())},
              icon: Icon(Icons.refresh_outlined),
            ),
          ],
        ),), 

    );

    
  }
}
