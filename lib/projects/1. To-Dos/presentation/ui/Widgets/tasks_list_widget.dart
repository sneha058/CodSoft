import 'package:codsoft/projects/1.%20To-Dos/presentation/bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bloc/todo_bloc.dart';
import '../../bloc/todo_event.dart';

class TaskListWidget extends StatelessWidget {

  var state;

  TaskListWidget(this.state);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(state.taskList[index]),
            leading: Checkbox(
              value: false,
              onChanged: (value) {
                BlocProvider.of<ToDoBloc>(context)
                    .add(TaskCompleteEvent());

              },
            ),
            trailing: Container(

              //.............we wrap the Row inside the container to give it specific width to avoid Rendering error..............

              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                    },
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 30,right: 30,top: 8, bottom: 8),
            child: Divider(
              thickness: 1,
              color: Colors.black,
            ),
          );
        },
        itemCount: state.taskList.length);


}
}


