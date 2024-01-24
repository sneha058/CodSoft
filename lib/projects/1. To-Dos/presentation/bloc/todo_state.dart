abstract class ToDoState{}

class ToDoInitialState extends ToDoState{}

class TaskCreateState extends ToDoState{}

class TaskAddState extends ToDoState{
  String task;
  TaskAddState(this.task);
}

class TaskEmptyState extends ToDoState{
  String errorMessage;
  TaskEmptyState(this.errorMessage);
}

class TaskDeleteState extends ToDoState{}

class TaskEditState extends ToDoState{}

class TaskCompleteState extends ToDoState{}


