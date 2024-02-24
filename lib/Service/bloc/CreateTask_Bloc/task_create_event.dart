part of 'task_create_bloc.dart';

abstract class TaskCreateEvent {}

class TaskCreatingEvent extends TaskCreateEvent{}

class TaskGetId extends TaskCreateEvent{}

class TaskExit extends TaskCreateEvent{}
