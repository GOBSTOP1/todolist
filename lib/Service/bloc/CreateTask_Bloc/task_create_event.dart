part of 'task_create_bloc.dart';

abstract class TaskCreateEvent {}

class TaskCreatingEvent extends TaskCreateEvent{
  final int id;
  final String name;
  final String description;
  TaskCreatingEvent(this.name, this.description, {required this.id});

  
}

class TaskGetId extends TaskCreateEvent{

}

class TaskExit extends TaskCreateEvent{}
