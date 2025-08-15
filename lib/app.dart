import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/features/auth/presentation/pages/SignInPage.dart';
import 'package:tut_app/features/auth/presentation/pages/SignUpPage.dart';
import 'package:tut_app/features/number_fact/presentation/bloc/NumberFactBloc.dart';
import 'package:tut_app/features/number_fact/presentation/pages/NumberFactPage.dart';
import 'package:tut_app/service_locator.dart';

class App extends StatelessWidget {
  App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/signin': (_) => SignInPage(),
        '/signup': (_) => SignUpPage(),
        '/home': (_) => NumberFactPage(),
      },

      home: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => getIt<NumberFactBloc>())],
        child: NumberFactPage(),
      ),
    );
  }
}
