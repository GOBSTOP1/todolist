

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todolist/repositories/taskExport.dart';

import '../Service/bloc/Home_Bloc/task_List_bloc.dart';
import '../Service/themes/bloc/theme_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController textEditingController = TextEditingController();
  final taskBloc = TaskBloc(
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
      child: BlocListener<TaskBloc, TaskState>(
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
                  onPressed: () {
                    if (theme.state is ThemeLight) {
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
                  icon: Icon(Icons.delete))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              taskBloc.add(TaskCreating());
            },
            child: Icon(Icons.add),
          ),
          body: BlocBuilder<TaskBloc, TaskState>(
            bloc: taskBloc,
            builder: (context, state) {
              if (state is TaskListLoaded) {
                return ListView.separated(
                    padding: EdgeInsets.only(top: 16),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: state.taskList.length,
                    itemBuilder: (context, index) {
                      Task task = state.taskList[index];
                      return ListTile(
                        title: Text(task.name),
                        subtitle: Text(task.description),
                        leading: Text(task.id.toString()),
                        trailing: (task.succes ? Text('da') : Text('net')),
                      );
                    });
              } else {
                return Center(
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
