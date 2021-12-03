import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'expense_list.dart';

class ExpenseListView extends StatelessWidget{
  const ExpenseListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final expenseList = context.watch<ExpenseList>();
    
    return ListView.builder(
      itemCount: expenseList.expenses.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(expenseList.expenses[index].amount.toString()),
          subtitle: Text(expenseList.expenses[index].paidBy.name),
        );
      },
    );
  }
}