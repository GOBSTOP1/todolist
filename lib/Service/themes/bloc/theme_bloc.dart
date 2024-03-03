import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/Service/themes/theme.dart';
import 'package:todolist/repositories/taskExport.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeCurrent(AppThemes.lightTheme)) {
    on<darkThemeEvent>(_onSetDarkTheme);
    on<lightThemeEvent>(_onSetLightTheme);
    on<ThemeInitialEvent>(_onGetTheme);
  }
  _onGetTheme(event, emit) async {
  ThemeData themeData = await getTheme();
  emit(ThemeCurrent(themeData));
}

  _onSetDarkTheme(darkThemeEvent event, Emitter<ThemeState> emit) async {
    setDark();
    ThemeData themeData = await getTheme();
    emit(ThemeCurrent(themeData));
   
  }

  _onSetLightTheme(lightThemeEvent event, Emitter<ThemeState> emit) async {
    setLight();
    ThemeData themeData = await getTheme();
    emit(ThemeCurrent(themeData));
    
  }
}