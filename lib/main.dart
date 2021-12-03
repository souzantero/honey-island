import 'package:flutter/material.dart';
import 'package:honey_island/app.dart';
import 'package:honey_island/expenses/expense_local_storage.dart';
import 'package:honey_island/guys/guys_local_storage.dart';

void main() {
  runApp(const App(
    guysRepository: GuysLocalStorage(),
    expenseRepository: ExpenseLocalStorage(),
  ));
}
