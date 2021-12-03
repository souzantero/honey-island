import 'package:honey_island/expenses/expense.dart';

abstract class ExpenseRepository {
  Future<List<Expense>> getExpenses();
}