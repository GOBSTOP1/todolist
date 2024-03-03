
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/repositories/abstractTaskRepository.dart';


part 'task_create_event.dart';
part 'task_create_state.dart';

class TaskCreateBloc extends Bloc<TaskCreateEvent, TaskCreateState> {
  TaskCreateBloc(this.taskRepository,) : super(TaskCreateInitial()) {
    on<TaskCreatingEvent>((event, emit) async {
     await taskRepository.createTask(event.name, event.description, event.id);
     int id = taskRepository.getId();
     emit(TaskCreated());
     emit(TaskIdReceived(id: id));
    });
    on<TaskGetId>((event,emit)async{
      int id = taskRepository.getId();
      emit(TaskIdReceived(id: id));
    });
    on<TaskExit>((event,emit){
      int id = taskRepository.getId();
      emit(TaskExiting());
      emit(TaskIdReceived(id: id));
    });
  }
  

  final AbstractTaskRepository taskRepository;
}
