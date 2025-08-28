import 'dart:ui';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tut_app/core/settings/UserSettingsState.dart';
import 'package:tut_app/core/themes/themes.dart';

@injectable
class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit()
    : super(
        SettingsState(
          darkMode: false,
          language: "en",
          theme: Themes.blue,
        ),
      );

  void setLanguage() => {emit(state.copyWith(language: state.language))};
  void setDarkMode() => {emit(state.copyWith(darkMode: false))};
  void setTheme(Color newColor) {
    final newTheme = state.themeEntries.entries
        .firstWhere((entry) => entry.value == newColor)
        .key;
    emit(state.copyWith(theme: newTheme));
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return state.toJson();
  }
}
