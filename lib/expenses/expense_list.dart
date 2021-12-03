import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:honey_island/expenses/expense.dart';
import 'package:honey_island/expenses/expense_repository.dart';

class ExpenseList extends ChangeNotifier {
  final ExpenseRepository repository;

  final List<Expense> _expenses = [];

  bool _isLoading = false;

  ExpenseList({required this.repository}) {
    _loadExpenses();
  }

  bool get isLoading => _isLoading;

  UnmodifiableListView<Expense> get expenses => UnmodifiableListView(_expenses);

  Future<void> _loadExpenses() async {
    try {
      _isLoading = true;
      notifyListeners();

      final expenses = await repository.getExpenses();
      _expenses.clear();
      _expenses.addAll(expenses);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void addExpense(Expense expense) {
    _expenses.add(expense);
    notifyListeners();
  }
}