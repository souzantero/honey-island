import 'package:flutter/material.dart';
import 'package:honey_island/expenses/models/expense_list.dart';
import 'package:provider/src/provider.dart';
import 'package:honey_island/extensions.dart';

class TotalAmountOfExpenses extends StatelessWidget {
  const TotalAmountOfExpenses({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total Amount',
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          context.watch<ExpenseList>().totalAmount.toCurrency(),
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}