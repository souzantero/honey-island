import 'package:flutter/material.dart';
import 'package:honey_island/expenses/expense_list_view.dart';

class ExpensePage extends StatelessWidget {
  const ExpensePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense'),
      ),
      body: const ExpenseListView(),
    );
  }
}