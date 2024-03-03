import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todolist/Service/bloc/CreateTask_Bloc/task_create_bloc.dart';
import 'package:todolist/Service/routes/router.dart';
import 'package:todolist/repositories/TaskExport.dart';

import 'widgets/createTaskWidget.dart';

@RoutePage()
class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key, required this.name});
  final String name;
  
  @override
  State<CreateTaskScreen> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTaskScreen> {
  TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String description = '';
  bool saved = false;
  int? id;
  final taskCreateBloc = TaskCreateBloc(
    GetIt.I<AbstractTaskRepository>(),
  );
  @override
  void initState() {
    taskCreateBloc.add(TaskGetId());
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   final args = ModalRoute.of(context)?.settings.arguments;
  //   if (args is TextEditingController) {
  //     receivedText = args;
  //     name = receivedText!.text;
  //   } else {
  //     return;
  //   }
  //   setState(() {});
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: taskCreateBloc,
      child: BlocListener<TaskCreateBloc, TaskCreateState>(
        listener: (context, state) {
          if (state is TaskExiting) {
            showDialog(
                context: context,
                builder: (context) {
                  return const NewWidget();
                });
          }
        },
        child: BlocBuilder<TaskCreateBloc, TaskCreateState>(
          bloc: taskCreateBloc,
          builder: (context, state) {
            if(state is TaskIdReceived ){
              return Scaffold(
              appBar: AppBar(
                title: Text(widget.name),
                centerTitle: true,
                leading: IconButton(
                    onPressed: () {
                      if (saved) {
                        // Navigator.pushNamedAndRemoveUntil(
                        //     context, '/', (route) => false);
                        AutoRouter.of(context).pushAndPopUntil(HomeRoute(), predicate: (route)=> false);
                      } else {
                        taskCreateBloc.add(TaskExit());
                      }
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                actions: [
                  IconButton(
                      onPressed: () {
                        taskCreateBloc.add(TaskCreatingEvent(
                            widget.name, description,
                            id: state.id));
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
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                  onChanged: (value) {
                                    setState(() {
                                      description = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          )));
                },
              ),
            );
            } else {
              return  const Center(child:CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
