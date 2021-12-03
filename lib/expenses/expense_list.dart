import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:honey_island/expenses/expense.dart';
import 'package:honey_island/expenses/expense_repository.dart';
import 'package:honey_island/users/user_list.dart';

class ExpenseList extends ChangeNotifier {
  final ExpenseRepository repository;

  final List<Expense> _expenses = [];

  late UserList _userList;

  bool _isLoading = false;

  ExpenseList({required this.repository});

  set userList(UserList userList) {
    _userList = userList;
    _loadExpenses();
  }

  bool get isLoading => _isLoading;

  UnmodifiableListView<Expense> get expenses => UnmodifiableListView(_expenses);

  Future<void> _loadExpenses() async {
    try {
      _isLoading = true;
      notifyListeners();

      final fetchedExpenses = await repository.getExpenses();
      _expenses.clear();
      _expenses.addAll(fetchedExpenses.map((expenseEntity) {
        return Expense(
          id: expenseEntity.id,
          amount: expenseEntity.amount,
          description: expenseEntity.description,
          paidBy: _userList.users.firstWhere((user) => user.id == expenseEntity.userId),
        );
      }));
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