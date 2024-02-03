import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/themes/bloc/theme_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final theme = BlocProvider.of<ThemeBloc>(context);
    // TODO: implement build
   return BlocProvider(
     create: (context) => ThemeBloc(),
     child: Scaffold(
       appBar: AppBar(
         title: const Text('Список дел'),
         actions: [IconButton(onPressed: (){
          if(theme.state is ThemeLight){
            theme.add(darkThemeEvent());
          } else {
            theme.add(lightThemeEvent());
          }
         }, icon: const Icon(Icons.mood))],
       ),
       body: const Column(
        children: [
         
        ],
       ),
      ),
   );
  }

  
  }
