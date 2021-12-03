import 'package:flutter/material.dart';
import 'package:honey_island/expenses/total_amount_of_expenses.dart';
import 'package:honey_island/expenses/total_amount_of_expenses_per_user.dart';

class ExpenseAnalysisPage extends StatelessWidget {
  const ExpenseAnalysisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Analysis'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const <Widget>[
            Card(child: Padding(padding: EdgeInsets.all(8), child: TotalAmountOfExpenses())),
            Card(child: Padding(padding: EdgeInsets.all(8), child: TotalAmountOfExpensesPerUser())),
          ],
        ),
      ),
    );
  }
}