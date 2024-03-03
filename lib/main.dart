import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/Service/routes/router.dart';
import 'package:todolist/Service/themes/bloc/theme_bloc.dart';
import 'package:todolist/repositories/taskExport.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton<AbstractTaskRepository>(TaskRepository());
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  // Hive.registerAdapter(ThemeAppAdapter());
  await Hive.openBox('theme');
  await Hive.openBox<Task>('todoBox');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final themeBloc = ThemeBloc();
  @override
  void initState() {
    themeBloc.add(ThemeInitialEvent());
    super.initState();
  }
  final _appRouter = AppRouter(); 
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: themeBloc,
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: _appRouter.config(),
            theme: state.currentTheme,
          );
        },
      ),
    );
  }
}
