import 'package:flutter/material.dart';
import 'package:honey_island/expenses/models/expense_list.dart';
import 'package:honey_island/extensions.dart';
import 'package:provider/src/provider.dart';

class AmountsToBePaidFromExpenses extends StatelessWidget {
  const AmountsToBePaidFromExpenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final expenseList = context.watch<ExpenseList>();
    final expenses = expenseList.expenses;
    
    final children = <Widget>[];
    children.add(Text('Amounts To Be Paid From Expenses', style: Theme.of(context).textTheme.headline6));
    children.add(const SizedBox(height: 10));
    children.add(const Divider());

    for (final expense in expenses) {
      children.add(ListTile(
        title: Text('${expense.paidBy.name}: ${expense.amount.toCurrency()} (${expense.description})'),
        subtitle: Text(expense.namesOfSplittersWithoutThePayer),
        trailing: Text(expense.amoutDividedBySplitWith.toCurrency()),
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }
}