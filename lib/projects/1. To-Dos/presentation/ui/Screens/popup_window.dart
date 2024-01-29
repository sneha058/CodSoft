import 'package:codsoft/projects/1.%20To-Dos/presentation/bloc/todo_bloc.dart';
import 'package:codsoft/projects/1.%20To-Dos/presentation/bloc/todo_event.dart';
import 'package:codsoft/projects/1.%20To-Dos/presentation/bloc/todo_state.dart';
import 'package:codsoft/projects/1.%20To-Dos/presentation/ui/Screens/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PopUpWindow extends StatelessWidget {
  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 500,
            maxWidth: 400,
          ),
          child: FractionallySizedBox(
            heightFactor: 0.7,
            widthFactor: 0.8,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFD8E8EA),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2.0,
                        blurRadius: 16.0,
                        offset: Offset(0, 1))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: TextField(
                      controller: taskController,
                      decoration: InputDecoration(
                        labelText: "Enter Task",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //...........(3) Firing Event to trigger the TaskAddState on pressing the Add Task button.................

                  ElevatedButton(
                      onPressed: () {

                        BlocProvider.of<ToDoBloc>(context).add(TaskAddEvent(taskController.text.toString()));
                        

                      },
                      child: Text(
                        "Add Task",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blueGrey),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
