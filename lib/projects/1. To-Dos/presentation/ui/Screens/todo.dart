import 'package:codsoft/projects/1.%20To-Dos/presentation/bloc/todo_bloc.dart';
import 'package:codsoft/projects/1.%20To-Dos/presentation/bloc/todo_event.dart';
import 'package:codsoft/projects/1.%20To-Dos/presentation/bloc/todo_state.dart';
import 'package:codsoft/projects/1.%20To-Dos/presentation/ui/Widgets/add_task_button.dart';
import 'package:codsoft/projects/1.%20To-Dos/presentation/ui/Widgets/tasks_list_widget.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo App",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: BlocProvider(
        create: (context) => ToDoBloc(),
        child: ToDoScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ToDoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "To-Dos!!!",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: Colors.deepPurple,
              ),
            ),
          ),
        ),
        body: BlocBuilder<ToDoBloc, ToDoState>(
          builder: (context, state) {
            if (state is TaskAddState){

              //.........If task is added the task List is built.......
              //........If task stauts is changed the task list is built with the checkbox ticked....

              return Stack(
                children: [
                  TaskListWidget(state),
                  AddTaskButton(),
                ],
              );
            }
            else {

              //.......Initially there's only the add button...........

              return AddTaskButton();
            }
          },
        )
    );
  }
}

