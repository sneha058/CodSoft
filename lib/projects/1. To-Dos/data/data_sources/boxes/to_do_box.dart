
import 'package:hive/hive.dart';

import '../../model/to_do_model.dart';

class ToDoBox {
  static Box<ToDoModel> getData() => Hive.box("task");
}