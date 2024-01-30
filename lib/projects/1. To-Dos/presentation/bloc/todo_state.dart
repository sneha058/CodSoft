abstract class ToDoState {}

class ToDoInitialState extends ToDoState {}

class TaskEnterState extends ToDoState{}

class TaskAddState extends ToDoState {
  List<String> taskList;
  TaskAddState(this.taskList);
}

class TaskEmptyState extends ToDoState {
  String errorMessage;
  TaskEmptyState(this.errorMessage);
}

class TaskDeleteState extends ToDoState {}

class TaskEditState extends ToDoState {}

class TaskCompleteState extends ToDoState {}
