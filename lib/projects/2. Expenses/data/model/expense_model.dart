import 'package:hive/hive.dart';
part 'expense_model.g.dart';

@HiveType(typeId: 0)
class ExpenseModel extends HiveObject{

  @HiveField(0)
  var income;

  @HiveField(1)
  var expense;

  @HiveField(2)
  var category;


  @HiveField(3)
  var total;

  @HiveField(4)
  bool? isIncome;

  ExpenseModel({this.income,this.expense,this.category,this.total,this.isIncome});

}