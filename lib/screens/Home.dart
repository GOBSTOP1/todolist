

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todolist/Service/routes/router.dart';
import 'package:todolist/Service/themes/theme.dart';
import 'package:todolist/repositories/taskExport.dart';

import '../Service/bloc/Home_Bloc/task_List_bloc.dart';
import '../Service/themes/bloc/theme_bloc.dart';
@RoutePage() 
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  final TextEditingController textEditingController = TextEditingController();
  final taskBloc = TaskListBloc(
    GetIt.I<AbstractTaskRepository>(),
  );

  @override
  void initState() {
    taskBloc.add(LoadTaskList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = BlocProvider.of<ThemeBloc>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(create: (context) => taskBloc)
      ],
      child: BlocListener<TaskListBloc, TaskListState>(
        listener: (context, state) {
          if(state is TaskCreate){
           GetIt.I<AbstractTaskRepository>().createTaskDialog(
                context,
                textEditingController,
              );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Список дел'),
            actions: [
              IconButton(
                  onPressed: () async {
                    if (theme.state.currentTheme == AppThemes.lightTheme) {
                      theme.add(darkThemeEvent());
                    } else {
                      theme.add(lightThemeEvent());
                    }
                  },
                  icon: const Icon(Icons.mood)),
              IconButton(
                  onPressed: () async {
                    taskBloc.add(TaskDeleteBox());
                  },
                  icon: const Icon(Icons.delete))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              taskBloc.add(TaskCreating());
            },
            child: const Icon(Icons.add),
          ),
          body: BlocBuilder<TaskListBloc, TaskListState>(
            bloc: taskBloc,
            builder: (context, state) {
              if (state is TaskListLoaded) {
                return ListView.separated(
                    padding: const EdgeInsets.only(top: 16),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.taskList.length,
                    itemBuilder: (context, index) {
                      
                    final task = state.taskList[index];
                      return ListTile(
                        onTap: ()=> AutoRouter.of(context).pushAndPopUntil(TaskInfoRoute(task: task),predicate: (route) => false),
                        title: Text(task.name),
                        subtitle: Text(task.description),
                        leading: Text(task.id.toString()),
                        trailing: (task.succes ? const Text('da') : const Text('net')),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
