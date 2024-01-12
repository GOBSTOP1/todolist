import 'package:flutter/material.dart';
import 'package:todolist/routes/routes.dart';
import 'package:todolist/themes/theme.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      initialRoute: '/',
      theme: currentTheme,
      
    );
  }
}