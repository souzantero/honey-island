import 'package:flutter/material.dart';
import 'package:honey_island/expenses/models/expense_list.dart';
import 'package:honey_island/extensions.dart';
import 'package:honey_island/users/user_list.dart';
import 'package:provider/src/provider.dart';

class AmountsToPayAndReceivePerUser extends StatelessWidget {
  const AmountsToPayAndReceivePerUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    children.add(Text('Amounts To Pay And Receive Per User', style: Theme.of(context).textTheme.headline6));
    children.add(const SizedBox(height: 10));
    children.add(const Divider());

    final expenseList = context.watch<ExpenseList>();
    final userList = context.watch<UserList>();
    final users = userList.users;

    for (final payer in users) {
      final amounts = <String, double>{};
      for (final receiver in users) {
        if (payer == receiver) {
          continue;
        }

        final payerExpenses = expenseList.getExpensesByPayerAndSplitter(payer, receiver);
        final receiverExpenses = expenseList.getExpensesByPayerAndSplitter(receiver, payer);

        final payerExpensesAmount = payerExpenses.fold<double>(0, (sum, expense) => sum + expense.amoutDividedBySplitWith);
        final receiverExpensesAmount = receiverExpenses.fold<double>(0, (sum, expense) => sum + expense.amoutDividedBySplitWith);
        
        final amount = receiverExpensesAmount - payerExpensesAmount;

        if (amount > 0) {
          amounts[receiver.id] = amount;
        }
      }

      if (amounts.isNotEmpty) {
        children.add(
          ListTile(
            title: Text('${payer.name} should pay'),
            subtitle: Text(amounts.entries.map((entry) => '${entry.value.toCurrency()} to ${users.firstWhere((user) => user.id == entry.key).name}').join(', ')),
          )
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children
    );
  }
}