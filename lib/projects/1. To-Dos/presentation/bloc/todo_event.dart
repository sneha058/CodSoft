abstract class ToDoEvent {}

class TaskCreateEvent extends ToDoEvent{}

class TaskAddEvent extends ToDoEvent{
  String task;
  TaskAddEvent(this.task);
}

class TaskDeleteEvent extends ToDoEvent{
  String task;
  TaskDeleteEvent(this.task);
}

class TaskEditEvent extends ToDoEvent{}

class TaskCompleteEvent extends ToDoEvent{}