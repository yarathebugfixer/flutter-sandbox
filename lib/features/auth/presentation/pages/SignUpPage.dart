import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/features/auth/presentation/bloc/AuthBloc.dart';
import 'package:tut_app/features/auth/presentation/bloc/AuthState.dart';
import 'package:tut_app/widgets/molecules/SignUpForm.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F5FF),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: SignUpForm()
      ),
    );
  }
}
