import 'package:bloc/bloc.dart';

part 'task_hive_bloc_event.dart';
part 'task_hive_bloc_state.dart';

class TaskHiveBlocBloc extends Bloc<TaskHiveBlocEvent, TaskHiveBlocState> {
  TaskHiveBlocBloc() : super(TaskHiveBlocInitial()) {
    on<TaskHiveBlocEvent>((event, emit) {
      
    });
  }
}
