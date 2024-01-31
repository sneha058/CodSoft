abstract class ToDoEvent {}

class TaskEnterEvent extends ToDoEvent{
  var enterTask;
  TaskEnterEvent(this.enterTask);
}

class TaskAddEvent extends ToDoEvent{
  String task;
  int? taskIndex;
  TaskAddEvent(this.task){}
}

class TaskCompleteEvent extends ToDoEvent{
  int index;
  TaskCompleteEvent(this.index);
}

class TaskDeleteEvent extends ToDoEvent{
  String task;
  TaskDeleteEvent(this.task);
}

class TaskEditEvent extends ToDoEvent{}

