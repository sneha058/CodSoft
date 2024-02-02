import 'package:hive/hive.dart';

import '../model/expense_model.dart';

class ExpenseBox {
  static Box<ExpenseModel> getExpense() => Hive.box("expense");
}