
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/repositories/abstractTaskRepository.dart';


part 'task_create_event.dart';
part 'task_create_state.dart';

class TaskCreateBloc extends Bloc<TaskCreateEvent, TaskCreateState> {
  TaskCreateBloc(this.taskRepository, this.name, this.description, this.id,) : super(TaskCreateInitial()) {
    on<TaskCreatingEvent>((event, emit) async {
     await taskRepository.createTask(name, description, id);
     emit(TaskCreated());
    });
    on<TaskGetId>((event,emit)async{
      taskRepository.getId();
      emit(TaskIdReceived(id: id));
    });
    on<TaskExit>((event,emit){
      emit(TaskExiting());
    });
  }
  final int id;
  final String name;
  final String description;
  final AbstractTaskRepository taskRepository;
}
