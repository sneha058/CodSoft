import 'package:codsoft/projects/1.%20To-Dos/presentation/bloc/todo_event.dart';
import 'package:codsoft/projects/1.%20To-Dos/presentation/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState>{
  ToDoBloc(): super(ToDoInitialState()){
    on<TaskCreateEvent>((event, emit) => emit(TaskCreateState()));
    on<TaskAddEvent>((event, emit) {
      if (event.task != null && event.task.isNotEmpty){
        emit(TaskAddState(event.task));
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

