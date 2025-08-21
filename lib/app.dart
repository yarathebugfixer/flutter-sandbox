import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/core/theme/ThemeCubit.dart';

import 'package:tut_app/features/auth/presentation/pages/SignInPage.dart';
import 'package:tut_app/features/auth/presentation/pages/SignUpPage.dart';
import 'package:tut_app/features/number_fact/presentation/pages/NumberFactPage.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return MaterialApp(
          theme: theme,
          routes: {
            '/signin': (_) => SignInPage(),
            '/signup': (_) => SignUpPage(),
            '/home': (_) => NumberFactPage(),
          },
          home: NumberFactPage(),
        );
      },
    );
  }
}
