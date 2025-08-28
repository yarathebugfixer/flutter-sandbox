import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tut_app/core/themes/themes.dart';

class SettingsState {
  final bool darkMode;
  final String language;
  final Themes theme;

  ThemeData get themeData {
    switch (theme) {
      case Themes.blue:
        return appThemes[Themes.blue]!;
      case Themes.red:
        return appThemes[Themes.red]!;
      case Themes.purple:
        return appThemes[Themes.purple]!;
    }
  }
  Map<Themes, Color> get themeEntries => {
    Themes.blue: const Color(0xff546BEE),
    Themes.red: const Color(0xfff44336),
    Themes.purple: const Color(0xff8F61FF),
  };
  
 Color get color => themeEntries[theme] ?? const Color(0xff546BEE);

  SettingsState({
    required this.darkMode,
    required this.language,
    required this.theme,
  });

  //factory constructor. you can process stuff before returning
  //state from it here.
  factory SettingsState.fromJson(Map<String, dynamic> json) => SettingsState(
    darkMode: json["darkMode"] ?? false,
    language: json['language'] ?? "en",
    theme: Themes.values[json['theme'] as int],
  );

  SettingsState copyWith({bool? darkMode, String? language, Themes? theme}) {
    return SettingsState(
      darkMode: darkMode ?? this.darkMode,
      language: language ?? this.language,
      theme: theme ?? this.theme,
    );
  }

  Map<String, dynamic> toJson() => {
    'darkMode': darkMode,
    'language': language,
    'theme': theme.index,
  };
}
