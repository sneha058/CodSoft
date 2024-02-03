import 'package:hive/hive.dart';
part 'to_do_model.g.dart';

@HiveType(typeId: 0)
class ToDoModel extends HiveObject{

@HiveField(0)
  String task;

@HiveField(1)
  bool? isCompleted;

  ToDoModel({required this.task , this.isCompleted});
}