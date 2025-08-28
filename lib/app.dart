import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/core/settings/UserSettingsCubit.dart';
import 'package:tut_app/core/settings/UserSettingsState.dart';
import 'package:tut_app/features/auth/presentation/bloc/AuthBloc.dart';
import 'package:tut_app/features/auth/presentation/bloc/AuthEvent.dart';
import 'package:tut_app/features/auth/presentation/bloc/AuthState.dart';
import 'package:tut_app/features/auth/presentation/pages/SignInPage.dart';
import 'package:tut_app/features/auth/presentation/pages/SignUpPage.dart';
import 'package:tut_app/features/number_fact/presentation/pages/NumberFactPage.dart';

// Example color list
final List<Color> colorList = [
  const Color(0xff546BEE),
  const Color(0xfff44336),
  const Color(0xff8F61FF),
];

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, settingsState) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            final bool isAuthenticated = authState is Authenticated;
            print(authState);
            print(settingsState.theme);
            return MaterialApp(
              theme: settingsState.themeData,
              initialRoute: '/signin',
              onGenerateRoute: (settings) {
                late Widget page;

                switch (settings.name) {
                  case '/signin':
                    page = SignInPage();
                    break;
                  case '/signup':
                    page = SignUpPage();
                    break;
                  case '/home':
                    page = isAuthenticated ? NumberFactPage() : SignInPage();
                    break;
                  default:
                    page = SignInPage();
                }

                return MaterialPageRoute(
                  builder: (_) => Scaffold(
                    appBar: AppBar(
                      actions: [
                        // Theme color dropdown
                        BlocBuilder<SettingsCubit, SettingsState>(
                          builder: (context, settingState) {
                            return SizedBox(
                              width: 60,
                              child: DropdownButton<Color>(
                                value: settingState.color,
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                                underline: const SizedBox(),
                                dropdownColor: Colors.grey[800],
                                items: colorList.map((color) {
                                  return DropdownMenuItem<Color>(
                                    value: color,
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: color,
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (Color? newColor) {
                                  if (newColor != null) {
                                    context.read<SettingsCubit>().setTheme(
                                      newColor,
                                    );
                                  
                                  }
                                },
                              ),
                            );
                          },
                        ),

                        // Avatar / logout button
                        GestureDetector(
                          onTap: () {
                            if (!isAuthenticated) {
                              Navigator.pushNamed(context, '/signin');
                            } else {
                              context.read<AuthBloc>().add(
                                LogOutRequestedEvent(),
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor:
                                  settingsState.themeData.scaffoldBackgroundColor,
                              child: Icon(
                                isAuthenticated
                                    ? Icons.person
                                    : Icons.arrow_back,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    body: page,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
