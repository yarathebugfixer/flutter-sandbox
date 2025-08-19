import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/features/auth/presentation/bloc/AuthBloc.dart';
import 'package:tut_app/features/auth/presentation/bloc/AuthEvent.dart';
import 'package:tut_app/features/auth/presentation/bloc/AuthState.dart';
import 'package:tut_app/features/auth/presentation/pages/SignInPage.dart';
import 'package:tut_app/features/auth/presentation/pages/SignUpPage.dart';
import 'package:tut_app/features/number_fact/presentation/bloc/NumberFactBloc.dart';
import 'package:tut_app/features/number_fact/presentation/pages/NumberFactPage.dart';
import 'package:tut_app/service_locator.dart';

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<NumberFactBloc>()),
        BlocProvider(
          create: (context) => getIt<AuthBloc>()..add(AppStartedEvent()),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/signin': (_) => SignInPage(),
          '/signup': (_) => SignUpPage(),
          '/home': (_) => NumberFactPage(),
        },
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Authenticated) {
              return NumberFactPage();
            } else if (state is Unauthenticated) {
              return SignInPage();
            }
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
