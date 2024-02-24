part of 'task_hive_bloc_bloc.dart';

abstract class TaskState {

}

class TaskHiveBlocInitial extends TaskState {
  
}
class TaskListLoading extends TaskState{

}
class TaskListLoaded extends TaskState{
  final List<Task> taskList;

  TaskListLoaded({required this.taskList});
}
class TaskBoxDeleted extends TaskState{

}
class TaskCreate extends TaskState{
  
}