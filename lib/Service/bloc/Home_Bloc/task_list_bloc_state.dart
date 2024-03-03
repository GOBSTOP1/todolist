part of 'task_List_bloc.dart';

abstract class TaskListState {

}

class TaskListInitial extends TaskListState {
  
}
class TaskListLoading extends TaskListState{

}
class TaskListLoaded extends TaskListState{
  final List<Task> taskList;

  TaskListLoaded({required this.taskList});
}
class TaskBoxDeleted extends TaskListState{

}
class TaskCreate extends TaskListState{
  
}