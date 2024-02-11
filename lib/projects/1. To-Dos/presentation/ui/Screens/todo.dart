import 'package:codsoft/projects/1.%20To-Dos/data/model/to_do_model.dart';
import 'package:codsoft/projects/1.%20To-Dos/presentation/ui/Widgets/add_task_button.dart';
import 'package:codsoft/projects/1.%20To-Dos/presentation/ui/Widgets/tasks_list_widget.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ToDoModelAdapter());
  await Hive.openBox<ToDoModel>("task");
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
      home: ToDoScreen(),
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
        body:  Stack(
                children: [
                  TaskListWidget(),
                  AddTaskButton(),
                ],
              )
    );
  }
}

