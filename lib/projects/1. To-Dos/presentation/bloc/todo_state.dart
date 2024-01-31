
abstract class ToDoState {}

class ToDoInitialState extends ToDoState {}

class TaskEnterState extends ToDoState{}

class TaskAddState extends ToDoState {
  List<String> taskList;
  List<bool> taskStatusList = [];
  TaskAddState(this.taskList, this.taskStatusList){
    taskStatusList = List.generate(taskList.length, (index) => false);
  }

  bool updateStatus(int index){
    print (index);
   return taskStatusList[index] = !taskStatusList[index];
  }
}

class TaskCompleteState extends ToDoState {}

class TaskEmptyState extends ToDoState {
  String errorMessage;
  TaskEmptyState(this.errorMessage);
}

class TaskDeleteState extends ToDoState {}

class TaskEditState extends ToDoState {}


