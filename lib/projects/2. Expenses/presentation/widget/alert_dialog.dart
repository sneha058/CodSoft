import 'package:codsoft/projects/2.%20Expenses/data/data_sources/expense_box.dart';
import 'package:codsoft/projects/2.%20Expenses/data/model/expense_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> alertDialog(BuildContext context) async {
  TextEditingController cashController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Add Transaction"),
        content: IntrinsicHeight(
          child: Column(
            children: [
              TextField(
                controller: cashController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter amount",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: categoryController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Enter category",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Column(
            children: [
              FilledButton(
                  onPressed: () {
                    Navigator.pop(context);

                    final data = ExpenseModel(
                        expense: cashController.text.toString(),
                        category: categoryController.text.toString());
                    final box = ExpenseBox.getExpense();
                    box.add(data);
                    cashController.clear();
                  },
                  child: Text("Expense")),
              FilledButton(
                  onPressed: () {
                    Navigator.pop(context);
                    final data = ExpenseModel(
                        income: cashController.text.toString(),
                        category: categoryController.text.toString());
                    final box = ExpenseBox.getExpense();
                    box.add(data);
                  },
                  child: Text("Income")),
              FilledButton(
                  onPressed: () {
                    cashController.clear();
                    categoryController.clear();
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
            ],
          ),
        ],
      );
    },
  );
}
