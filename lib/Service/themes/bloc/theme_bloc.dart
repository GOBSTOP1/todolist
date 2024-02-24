import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todolist/Service/themes/theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeLight(light)) {
    on<darkThemeEvent>(_onSetDarkTheme);
    on<lightThemeEvent>(_onSetLightTheme);
  }

  _onSetDarkTheme(darkThemeEvent event, Emitter<ThemeState> emit) {
    print('Switching to Dark Theme1');
    emit(ThemeDark(dark));
  }

  _onSetLightTheme(lightThemeEvent event, Emitter<ThemeState> emit) {
    print('Switching to Light Theme2');
    emit(ThemeLight(light));
  }
}