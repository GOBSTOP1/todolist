import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData currentTheme = light;
ThemeData light = ThemeData.light();
ThemeData dark = ThemeData.dark();
Future<void> getTheme() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? currentTheme2 = prefs.getString('theme');
    print(currentTheme);
  
  if (currentTheme2 == 'dark') {
    print('Получил темную тему $currentTheme');

    currentTheme = dark;
  } else {
    print('Получил белую тему $currentTheme');

    currentTheme = light;
  }
}
void SetTheme() async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? currentTheme2 = prefs.getString('theme');
  if(currentTheme2 == 'dark') {
    await prefs.setString('theme', 'light');
    print('Перезаписал на белую тему $currentTheme2');
  } else {
    await prefs.setString('theme', 'dark');
        print('Перезаписал на темную тему $currentTheme2');


  }
}