
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todolist/Service/bloc/Task_Bloc/task_bloc.dart';
import 'package:todolist/Service/routes/router.dart';
import 'package:todolist/repositories/abstractTaskRepository.dart';
import 'package:todolist/repositories/models/task.dart';
import 'package:todolist/screens/widgets/createTaskWidget.dart';

@RoutePage() 
class TaskInfoScreen extends StatefulWidget {
  const TaskInfoScreen({super.key, required this.task});
  final Task task;

  @override
  State<TaskInfoScreen> createState() => _TaskState();
}

class _TaskState extends State<TaskInfoScreen> {
  TextEditingController textEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  String perehod = '';
  Task? task;
  bool saved = false;
  
  @override
  void initState() {
    task = widget.task;
    textEditingController.text = task!.description;
    super.initState();
  }
  // @override
  // void didChangeDependencies() {
  //   final args = ModalRoute.of(context)?.settings.arguments;
  //   if (args is int) {
  //     id = args;
  //   } else {
  //     return;
  //   }
  //   setState(() {});
  //   super.didChangeDependencies();
  // }
  
  
  @override
  Widget build(BuildContext context) {
    final taskBloc = TaskBloc(GetIt.I<AbstractTaskRepository>(),task!.id );
    return BlocProvider.value(
      value: taskBloc,
      child: BlocListener<TaskBloc, TaskState>(
        listener: (context, state) {
          if(state is TaskExit){
            showDialog(context: context, builder: (context){
              return NewWidget();
            });
          }
        },
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            return Scaffold(
                      appBar: AppBar(title:Text(task!.name), centerTitle: true, 
                      leading: 
                      IconButton(onPressed: (){
                        if(saved){
                          AutoRouter.of(context).pushAndPopUntil(HomeRoute(), predicate: (route) => false);
                        } else {
                          taskBloc.add(TaskExitingEvent());
                        }
                      }, icon:Icon(Icons.arrow_back_ios)),
                      actions: [IconButton(onPressed: (){
                        setState(() {
                          saved = true;
                        });
                        taskBloc.add(TaskCreatingEvent(name: task!.name, description: perehod));
                      }, icon: Icon(Icons.save))],
                      ),
                      body: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child:  Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: TextFormField(
                                  controller: textEditingController,
                                  maxLines: null,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value){
                                    setState(() {
                                      perehod = value;
                                    });
                                  },
                                ),
                              )
                            ],
                          ) ),
                      ),
                    );
          },
        ),
      ),
    );
  }
}
