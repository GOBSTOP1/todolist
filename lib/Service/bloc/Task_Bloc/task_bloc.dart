import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todolist/repositories/taskExport.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc(this.taskRepository, this.id) : super(TaskInitial()) {
    on<TaskLoadEvent>((event, emit) {
      Task task = taskRepository.getTask(id) as Task;
      emit(TaskLoaded(taskData: task));
    });
    on<TaskExitingEvent>((event,emit){
      emit(TaskExit());
    });
    on<TaskCreatingEvent>((event,emit){
      taskRepository.createTask(event.name, event.description, id);
    });
  }
  final AbstractTaskRepository taskRepository;
  final int id;
}
