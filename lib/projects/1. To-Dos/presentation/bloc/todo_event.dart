abstract class ToDoEvent {}

class TaskEnterEvent extends ToDoEvent{
  var enterTask;
  TaskEnterEvent(this.enterTask);
}

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