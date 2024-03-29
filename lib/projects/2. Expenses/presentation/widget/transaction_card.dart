import 'package:codsoft/projects/2.%20Expenses/data/data_sources/expense_box.dart';
import 'package:codsoft/projects/2.%20Expenses/data/model/expense_model.dart';
import 'package:codsoft/projects/2.%20Expenses/presentation/widget/add_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'edit_dialog.dart';

class TransactionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: ExpenseBox.getExpense().listenable(),
        builder: (context, box, _) {
          //..........casting all the data in the box as a list......

          var initialData = box.values.toList();
          var reversedData = initialData.reversed.toList();
          var data = reversedData.cast<ExpenseModel>();

          //.......converting the expense value into integer......

          double sum = data.fold(0, (sum, model) {
            double? intExpense = double.tryParse(model.expense ?? '');
            double? intIncome = double.tryParse(model.income ?? '');

            return sum - (intExpense ?? 0.0) + (intIncome ?? 0.0);
          });

          return Column(
            children: [
              Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Status",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      sum.toString(),
                      style: TextStyle(
                          fontSize: 33,
                          color: (sum >= 0) ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 5, top: 5),
                      child: Container(
                        height: 80,
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    editDialog(context, data[index] ,data[index].category, data[index].isIncome, data[index].income.toString(), data[index].expense.toString());
                                  },
                                  icon: Icon(Icons.edit)),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    (data[index].isIncome == true)
                                        ? data[index].income.toString()
                                        : data[index].expense.toString(),
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                        color: (data[index].isIncome == true)
                                            ? Colors.green
                                            : Colors.red),
                                  ),
                                  Text(data[index].category.toString()),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    data[index].delete();
                                  },
                                  icon: Icon(Icons.delete))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 90,
              )
            ],
          );
        });
  }

}
