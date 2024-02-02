import 'package:codsoft/projects/2.%20Expenses/data/data_sources/expense_box.dart';
import 'package:codsoft/projects/2.%20Expenses/data/model/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class TransactionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: ExpenseBox.getExpense().listenable(),
        builder: (context, box, _) {
          //..........casting all the data in the box as a list......

          var data = box.values.toList().cast<ExpenseModel>();

          //.......converting the expense value into integer......

          double sum = data.fold(0, (sum, expense) {
            double? intExpense = double.tryParse(expense.expense ?? '');
            return sum + (intExpense ?? 0.0);
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
                      style: TextStyle(fontSize: 23),
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

                                  }, icon: Icon(Icons.edit)),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data[index].expense.toString(),
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
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
            ],
          );
        });
  }
}
