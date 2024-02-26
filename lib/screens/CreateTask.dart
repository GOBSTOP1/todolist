import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todolist/Service/bloc/CreateTask_Bloc/task_create_bloc.dart';
import 'package:todolist/repositories/TaskExport.dart';


import 'widgets/createTaskWidget.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  TextEditingController? receivedText;
  String? name;
  TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String description = '';
  bool saved = false;
  int? id;
  @override
  void initState() {
    int response = GetIt.I<AbstractTaskRepository>().getId();
    id = response;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is TextEditingController) {
      receivedText = args;
      name = receivedText!.text;
    } else {
      return;
    }
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final taskCreateBloc =
        TaskCreateBloc(GetIt.I<AbstractTaskRepository>(), name!, description, id!);
    return BlocProvider.value(
      value: taskCreateBloc,
      child: BlocListener<TaskCreateBloc, TaskCreateState>(
        listener: (context, state) {
          if(state is TaskExiting){
            showDialog(
                    context: context,
                    builder: (context) {
                      return const NewWidget();
                    });
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(name!),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  if (saved) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  } else {
                    taskCreateBloc.add(TaskExit());
                  }
                },
                icon: const Icon(Icons.arrow_back_ios)),
            actions: [
              IconButton(
                  onPressed: () {
                    taskCreateBloc.add(TaskCreatingEvent());
                    setState(() {
                      saved = true;
                    });
                  },
                  icon: const Icon(Icons.save))
            ],
          ),
          body: BlocBuilder<TaskCreateBloc, TaskCreateState>(
            bloc: taskCreateBloc,
            builder: (context, state) {
              return SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          controller: descriptionController,
                          maxLines: null,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          onChanged: (value) {
                            setState(() {
                              description = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ))
              );   
            },
          ),
        ),
      ),
    );
  }
}
