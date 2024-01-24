import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/todo_bloc.dart';
import '../../bloc/todo_event.dart';
import '../../bloc/todo_state.dart';
import '../Screens/popup_window.dart';

class RoundAddWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: InkWell(onTap: () {
          //................after tap pop the textfield window to enter the task..............//
          BlocProvider.of<ToDoBloc>(context)
              .add(TaskCreateEvent());
        }, child: BlocBuilder<ToDoBloc, ToDoState>(
          builder: (context, state) {
            if (state is TaskCreateState) {
              return PopUpWindow();
            } else {

              //..................................(1)Initially the screen has only a + button........................

              return Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueGrey,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 3.0,
                          blurRadius: 3.0,
                          offset: Offset(0, 1))
                    ]),
                child: Center(
                  child: Icon(
                    Icons.add,
                    size: 26,
                    color: Colors.white,
                  ),
                ),
              );
            }
          },
        )),
      ),
    );
  }
}
