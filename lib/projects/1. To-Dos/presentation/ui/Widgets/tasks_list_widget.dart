import 'package:codsoft/projects/1.%20To-Dos/data/data_sources/boxes/to_do_box.dart';
import 'package:codsoft/projects/1.%20To-Dos/data/model/to_do_model.dart';
import 'package:codsoft/projects/1.%20To-Dos/presentation/bloc/todo_bloc.dart';
import 'package:codsoft/projects/1.%20To-Dos/presentation/bloc/todo_event.dart';
import 'package:codsoft/projects/1.%20To-Dos/presentation/bloc/todo_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskListWidget extends StatelessWidget {

 /* void taskStatus(BuildContext context, ToDoModel todoModel,bool newValue) async {
    todoModel.isCompleted = !newValue;
    await todoModel.save();
  }*/

  void delete(ToDoModel todoModel) async {
    await todoModel.delete();
  }

  Future<void> editTask(BuildContext context, ToDoModel todoModel,
      String task) async {
    TextEditingController taskController = TextEditingController();

    taskController.text = task;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Task"),
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
                  todoModel.task = taskController.text.toString();
                  await todoModel.save();
                  Navigator.pop(context);
                },
                child: Text("Edit")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<ToDoModel>>(
        valueListenable: ToDoBox.getData().listenable(),
        builder: (context, box, _) {
          return ListView.separated(
            itemCount: box.length,
            itemBuilder: (context, index) {

              var data = box.values.toList().cast<ToDoModel>();

              return ListTile(
                title: Text(data[index].task.toString()),

                leading: BlocBuilder<ToDoBloc, ToDoState>(
                  builder: (context, state) {
                    return Checkbox(
                        value: /*data[index].isCompleted ?? */ false,
                        onChanged:(value) {
                          /*taskStatus(context, data[index], value ?? false);*/
                        }
                    );
                  },
                ),

                trailing: Container(

                  //.............we wrap the Row inside the container to give it specific width to avoid Rendering error..............

                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.deepPurple,),
                        onPressed: () {
                          editTask(context, data[index], data[index].task.toString());
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete, color: Colors.deepPurple,),
                        onPressed: () {
                          delete(data[index]);
                        },
                      ),
                    ],
                  ),
                ),);
            },
            separatorBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 8, bottom: 8),
                child: Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
              );
            },
          );
        }

    );
  }
}