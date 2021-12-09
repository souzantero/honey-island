import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:honey_island/expenses/expense.dart';
import 'package:honey_island/expenses/expense_repository.dart';
import 'package:honey_island/users/user.dart';
import 'package:honey_island/users/user_list.dart';

class ExpenseList extends ChangeNotifier {
  final ExpenseRepository repository;

  final List<Expense> _expenses = [];

  late UserList _userList;

  bool _isLoading = false;

  ExpenseList({required this.repository});

  bool get isLoading => _isLoading;

  UnmodifiableListView<Expense> get expenses => UnmodifiableListView(_expenses);

  double get totalAmount => _expenses.fold(0.0, (total, expense) => total + expense.amount);

  List<User> get payers => _userList.users.where((user) => _expenses.any((expense) => expense.paidBy.id == user.id)).toList();

  void update({ required UserList userList }) {
    _userList = userList;
    _loadExpenses();
  }

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
          paidBy: _userList.users.firstWhere((user) => user.id == expenseEntity.payerId),
          splitWith: _userList.users.where((user) => expenseEntity.splitterIds.contains(user.id)).toList(),
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

  double getTotalAmountByUser(User user) {
    return _expenses.fold(0.0, (total, expense) => total + (expense.paidBy.id == user.id ? expense.amount : 0));
  }

  double getTotalAmountInPercentageByUser(User user) {
    return getTotalAmountByUser(user) / totalAmount * 100;
  }

  UnmodifiableListView<Expense> getExpensesByPayerAndSplitter(User payer, User splitter) {
    return UnmodifiableListView(_expenses.where((expense) => expense.paidBy.id == payer.id && expense.splitWith.contains(splitter)).toList());
  }
}