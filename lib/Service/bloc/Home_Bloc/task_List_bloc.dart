import 'package:bloc/bloc.dart';
import '../../../repositories/taskExport.dart';

part 'task_list_bloc_event.dart';
part 'task_list_bloc_state.dart';

class TaskBloc extends Bloc<TaskHiveBlocEvent, TaskState> {
  TaskBloc(this.taskRepository,) : super(TaskHiveBlocInitial()) {
    on<LoadTaskList>((event, emit) async {
      final taskList = await taskRepository.getTasks();
      emit(TaskListLoaded(taskList: taskList));
    }); 
    on<TaskDeleteBox>((event,emit) async {
     taskRepository.deleteBox();
     final taskList = await taskRepository.getTasks();
     emit(TaskListLoaded(taskList: taskList));
   }); 
   on<TaskCreating>((event,emit) async {
    final taskList = await taskRepository.getTasks();
    emit(TaskCreate()); 
    emit(TaskListLoaded(taskList: taskList));
   });
  }
 
  final AbstractTaskRepository taskRepository;

 
}
