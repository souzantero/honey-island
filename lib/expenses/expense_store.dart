import 'package:honey_island/expenses/expense.dart';
import 'package:honey_island/expenses/expense_repository.dart';

class ExpenseStore implements ExpenseRepository {
  const ExpenseStore();

  @override
  Future<List<Expense>> getExpenses() {
    return Future.value([]);
  }
}