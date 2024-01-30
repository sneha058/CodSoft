import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/todo_bloc.dart';
import '../../bloc/todo_event.dart';
import '../../bloc/todo_state.dart';

class AddTaskButton extends StatelessWidget {

  TextEditingController taskController = TextEditingController();

  void createNewTask(BuildContext context, ToDoBloc toDoBloc) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Task"),
          content: TextField(
            controller: taskController,
            decoration: InputDecoration(
                labelText: "Enter a task",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
          ),
          actions: [
            FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel")),
            FilledButton(
                onPressed: () {

                    toDoBloc.add(TaskAddEvent(taskController.text.toString()));
                    Navigator.pop(context);
                },
                child: Text("Add")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          onPressed: () {

            //.......Explicitly passing the Bloc context to avoid overriding.....
            createNewTask(context, BlocProvider.of<ToDoBloc>(context));

          },
          child: Icon(
            Icons.add,
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}