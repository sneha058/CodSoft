import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            title: Text(state.task),
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
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            thickness: 3,
            height: 23,
            color: Colors.black,
          );
        },
        itemCount: 1);
  }
}
