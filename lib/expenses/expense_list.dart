import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:honey_island/expenses/expense.dart';
import 'package:honey_island/expenses/expense_repository.dart';

class ExpenseList extends ChangeNotifier {
  final ExpenseRepository repository;

  final List<Expense> _expenses = [];

  ExpenseList({required this.repository});

  UnmodifiableListView<Expense> get expenses => UnmodifiableListView(_expenses);

  void addExpense(Expense expense) {
    _expenses.add(expense);
    notifyListeners();
  }
}