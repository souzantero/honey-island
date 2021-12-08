import 'package:flutter/material.dart';
import 'package:honey_island/expenses/expense_list.dart';
import 'package:honey_island/extensions.dart';
import 'package:provider/provider.dart';

class TotalAmountOfExpensesPerUser extends StatelessWidget {
  const TotalAmountOfExpensesPerUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final expenseList = context.watch<ExpenseList>();
    final children = <Widget>[];
    children.add(Text('Total Amount Per User', style: Theme.of(context).textTheme.headline6));
    children.add(const SizedBox(height: 10));
    children.add(const Divider());
    
    for (var user in expenseList.payers) {
      children.add(ListTile(
        title: Text(user.name),
        subtitle: Text(expenseList.getTotalAmountInPercentageByUser(user).toPercentage()),
        trailing: Text(expenseList.getTotalAmountByUser(user).toCurrency()),
      ));
    }
    
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
    );
  }
}