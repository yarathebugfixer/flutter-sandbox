import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tut_app/core/theme/themes.dart';


@singleton
class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(lightTheme);

  void setLight() => emit(lightTheme);
  void setDark() => emit(darkTheme);
  void toggle() => emit(state == lightTheme ? darkTheme : lightTheme);
}
