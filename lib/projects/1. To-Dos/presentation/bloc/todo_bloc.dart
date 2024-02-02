
import 'package:codsoft/projects/1.%20To-Dos/presentation/bloc/todo_event.dart';
import 'package:codsoft/projects/1.%20To-Dos/presentation/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState>{

  List<String> taskList= [];
  List<bool> taskStatusList = [];

  ToDoBloc(): super(ToDoInitialState()){

    on<TaskAddEvent>((event, emit) => emit(TaskAddState()));
    on<TaskCompleteEvent>((event, emit) => emit(TaskCompleteState()));
    on<TaskDeleteEvent>((event, emit) => emit(TaskDeleteState()));
    on<TaskEditEvent>((event, emit) => emit(TaskEditState()));

  }

}

