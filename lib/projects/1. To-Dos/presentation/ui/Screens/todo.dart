import 'package:codsoft/projects/1.%20To-Dos/presentation/bloc/todo_bloc.dart';
import 'package:codsoft/projects/1.%20To-Dos/presentation/bloc/todo_event.dart';
import 'package:codsoft/projects/1.%20To-Dos/presentation/bloc/todo_state.dart';
import 'package:codsoft/projects/1.%20To-Dos/presentation/ui/Screens/popup_window.dart';
import 'package:codsoft/projects/1.%20To-Dos/presentation/ui/Widgets/round_add_widget.dart';
import 'package:codsoft/projects/1.%20To-Dos/presentation/ui/Widgets/tasks_list_widget.dart';
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
        primarySwatch: Colors.grey,
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
                color: Colors.blueGrey,
              ),
            ),
          ),
        ),
        body: BlocBuilder<ToDoBloc, ToDoState>(builder: (context, state) {
          if (state is TaskAddState) {
            //.....................for (3) go to popup_window...................................
            //.....................(4) After clicking the Add Task button of the  pop-up window, with the task entered a list tile is created..................
            return Stack(children: [
              TaskListWidget(state),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    color: Colors.white,
                  )),
              RoundAddWidget(),
            ]);
          } else {
            //...............................................(1) Is on the round_add_widget file...................................................
            //..............................(2) After pressing the button a pop-up window to enter the task appears............................
            return RoundAddWidget();
          }
        }));
  }
}
