import 'package:flutter/material.dart';
import 'package:honey_island/expenses/models/expense_list.dart';
import 'package:honey_island/extensions.dart';
import 'package:provider/src/provider.dart';

class ExpenseListView extends StatelessWidget{
  const ExpenseListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final expenseList = context.watch<ExpenseList>();
    
    return ListView.builder(
      itemCount: expenseList.expenses.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(expenseList.expenses[index].paidBy.name),
          subtitle: Text(expenseList.expenses[index].description),
          trailing: Text(expenseList.expenses[index].amount.toCurrency()),
        );
      },
    );
  }
}