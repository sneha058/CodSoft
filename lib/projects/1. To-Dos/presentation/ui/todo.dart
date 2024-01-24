import 'package:codsoft/projects/1.%20To-Dos/presentation/bloc/todo_bloc.dart';
import 'package:codsoft/projects/1.%20To-Dos/presentation/bloc/todo_event.dart';
import 'package:codsoft/projects/1.%20To-Dos/presentation/bloc/todo_state.dart';
import 'package:codsoft/projects/1.%20To-Dos/presentation/ui/popup_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
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
        body: BlocBuilder<ToDoBloc, ToDoState>(
          builder: (context, state) {
            if (state is TaskAddState) {
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
            } else {
              return Center(
                child: InkWell(onTap: () {
                  //................after tap pop the textfield window to enter the task..............//
                  BlocProvider.of<ToDoBloc>(context)
                      .add(TaskCreateEvent());
                }, child: BlocBuilder<ToDoBloc, ToDoState>(
                  builder: (context, state) {
                    if (state is TaskCreateState) {
                      return PopUpWindow();
                    } else {
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
              );
            }
            }
        ));
  }
}
