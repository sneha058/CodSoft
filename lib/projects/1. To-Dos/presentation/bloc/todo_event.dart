abstract class ToDoEvent {}

class TaskCreateEvent extends ToDoEvent{}

class TaskAddEvent extends ToDoEvent{
  String task;
  TaskAddEvent(this.task);
}

class TaskDeleteEvent extends ToDoEvent{}

class TaskEditEvent extends ToDoEvent{}

class TaskCompleteEvent extends ToDoEvent{}