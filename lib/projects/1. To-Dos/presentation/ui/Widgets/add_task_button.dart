import 'package:codsoft/projects/1.%20To-Dos/data/data_sources/boxes/to_do_box.dart';
import 'package:codsoft/projects/1.%20To-Dos/data/model/to_do_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';


class AddTaskButton extends StatelessWidget {

  TextEditingController taskController = TextEditingController();

  void createNewTask(BuildContext context) {
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
                onPressed: () async {

                    Navigator.pop(context);

                    //.......Implementing Hive........
                  final data = ToDoModel(task: taskController.text.toString() , isCompleted: false);
                   final box = ToDoBox.getData();
                   box.add(data);
                   taskController.clear();

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
            createNewTask(context);

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