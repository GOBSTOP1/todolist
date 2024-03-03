part of 'task_bloc.dart';

abstract class TaskEvent {}

class TaskLoadEvent extends TaskEvent{}

class TaskExitingEvent extends TaskEvent{}

class TaskCreatingEvent extends TaskEvent{
  final String name;
  final String description;

  TaskCreatingEvent({required this.name, required this.description});
}