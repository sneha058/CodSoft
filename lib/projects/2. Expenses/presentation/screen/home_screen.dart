import 'package:codsoft/projects/2.%20Expenses/presentation/widget/add_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/transaction_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Expense Tracker"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(Icons.wallet),
            ),
          ],
        ),
        body: Stack(children:[TransactionCard(), AddButton()])
    );
  }

}