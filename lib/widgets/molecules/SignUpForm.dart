import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/features/auth/presentation/bloc/AuthBloc.dart';
import 'package:tut_app/features/auth/presentation/bloc/AuthEvent.dart';
import 'package:tut_app/features/auth/presentation/bloc/AuthState.dart';
import 'package:tut_app/widgets/atoms/button.dart';
import 'package:tut_app/widgets/atoms/input.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F5FF),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, '/home');
            });
          } else if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                PrimaryInput(
                  placeholder: "Name",
                  controller: nameController,
                  obscureText: true,
                  icon: Icons.person_2_outlined,
                ),
                const SizedBox(height: 10),
                PrimaryInput(
                  placeholder: "Email",
                  controller: emailController,
                  obscureText: true,
                  icon: Icons.email_outlined,
                ),
                const SizedBox(height: 10),
                PrimaryInput(
                  placeholder: "Password",
                  controller: passwordController,
                  obscureText: true,
                  icon: Icons.key_outlined,
                  stateOnIcon: Icons.visibility_off,
                  stateOffIcon: Icons.visibility_outlined,
                  onIconPressed: (state) => {},
                ),
                const SizedBox(height: 20),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                     return PrimaryButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        SignInRequestedEvent(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        ),
                      );
                    },
                    text: "Sign up",
                    isLoading: state is AuthLoading,
                    variant: ButtonVariant.outline,
                  );
                },
              ),
                  
                
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, "/signin"),
                  child: const Text('Already have an account? Sign In'),
                ),
              ],
          ),
        ),
      ),
    );
  }
}
