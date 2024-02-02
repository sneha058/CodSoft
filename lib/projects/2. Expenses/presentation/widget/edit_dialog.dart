import 'dart:math';

import 'package:codsoft/projects/2.%20Expenses/data/data_sources/expense_box.dart';
import 'package:codsoft/projects/2.%20Expenses/data/model/expense_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> editDialog(BuildContext context, ExpenseModel expenseModel ,String category, bool? isIncome, String income, String expense) async {
  TextEditingController cashController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  categoryController.text = category;
  cashController.text = (isIncome == true)? income : expense;

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Edit Transaction"),
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
                  onPressed: () async {
                    Navigator.pop(context);

                    expenseModel.expense = cashController.text.toString();
                    expenseModel.category = categoryController.text.toString();
                    await expenseModel.save();
                    cashController.clear();
                    categoryController.clear();
                  },
                  child: Text("Expense")),
              FilledButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    expenseModel.income = cashController.text.toString();
                    expenseModel.category = categoryController.text.toString();
                    await expenseModel.save();
                    cashController.clear();
                    categoryController.clear();

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
