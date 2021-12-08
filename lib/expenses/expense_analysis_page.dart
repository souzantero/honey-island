import 'package:flutter/material.dart';
import 'package:honey_island/expenses/amounts_to_be_paid_from_expenses.dart';
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
      body: LayoutBuilder(
        builder: (context, viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 8, left: 8, right: 8), 
                    child: const Card(child: Padding(padding: EdgeInsets.all(8), child: TotalAmountOfExpenses()))
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8, right: 8), 
                    child: const Card(child: Padding(padding: EdgeInsets.all(8), child: TotalAmountOfExpensesPerUser()))
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8), 
                    child: const Card(child: Padding(padding: EdgeInsets.all(8), child: AmountsToBePaidFromExpenses()))
                  ),
                ],
              ),
          ),
        );
      })
    );
  }
}