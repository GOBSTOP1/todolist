import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/Service/Hive/bloc/task_hive_bloc_bloc.dart';
import 'package:todolist/Service/themes/bloc/theme_bloc.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/repositories/taskRepository.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController textEditingController = TextEditingController();
  final taskBloc = TaskBloc(
    TaskRepository(),
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
            TaskRepository().createTaskDialog(
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
                  icon: const Icon(Icons.delete))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              taskBloc.add(TaskCreating());
            },
            child: const Icon(Icons.add),
          ),
          body: BlocBuilder<TaskBloc, TaskState>(
            bloc: taskBloc,
            builder: (context, state) {
              if (state is TaskListLoaded) {
                return ListView.separated(
                    padding: const EdgeInsets.only(top: 16),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.taskList.length,
                    itemBuilder: (context, index) {
                      Task task = state.taskList[index];
                      return ListTile(
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
