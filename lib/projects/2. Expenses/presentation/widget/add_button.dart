import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_dialog.dart';

class AddButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(onPressed: () async {
            return addDialog(context);
          },
            shape: CircleBorder(),
            child: Icon(Icons.add),)),
    );
  }
}