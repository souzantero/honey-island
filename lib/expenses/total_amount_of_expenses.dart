import 'package:flutter/material.dart';
import 'package:honey_island/expenses/expense_list.dart';
import 'package:provider/src/provider.dart';

class TotalAmountOfExpenses extends StatelessWidget {
  const TotalAmountOfExpenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalAmount = context.watch<ExpenseList>().totalAmount;
    
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total Amount',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            '$totalAmount',
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}