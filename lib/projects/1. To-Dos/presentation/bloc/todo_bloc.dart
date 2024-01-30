
import 'package:codsoft/projects/1.%20To-Dos/presentation/bloc/todo_event.dart';
import 'package:codsoft/projects/1.%20To-Dos/presentation/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState>{

  List<String> taskList= [];

  ToDoBloc(): super(ToDoInitialState()){

    on<TaskEnterEvent>((event, emit){
      if (event.enterTask.length >= 1){
        emit (TaskEnterState());
      }
      else {
        emit(TaskEmptyState("Please enter a task!!!"));
      }
    });

    on<TaskAddEvent>((event, emit) {
      if (event.task != null && event.task.isNotEmpty){
        taskList.add(event.task);
        emit(TaskAddState(taskList));
      }
      else {
        emit(TaskEmptyState("Please enter a task"));
      }
    });
    on<TaskDeleteEvent>((event, emit) => emit(TaskDeleteState()));
    on<TaskEditEvent>((event, emit) => emit(TaskEditState()));
    on<TaskCompleteEvent>((event, emit) => emit(TaskCompleteState()));
  }

}

