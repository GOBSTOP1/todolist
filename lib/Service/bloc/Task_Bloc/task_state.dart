part of 'task_bloc.dart';

abstract class TaskState {

}
class TaskInitial extends TaskState{

}
class TaskLoadingState extends TaskState {

}
class TaskLoaded extends TaskState{
  final Task taskData;

  TaskLoaded({required this.taskData});
}
class TaskExit extends TaskState{}