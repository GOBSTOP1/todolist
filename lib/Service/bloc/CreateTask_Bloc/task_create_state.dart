part of 'task_create_bloc.dart';

abstract class TaskCreateState {}

class TaskCreateInitial extends TaskCreateState {}

class TaskCreated extends TaskCreateState{}

class TaskIdReceived extends TaskCreateState{
  final int id;

  TaskIdReceived({required this.id});
}
class TaskExiting extends TaskCreateState{}
