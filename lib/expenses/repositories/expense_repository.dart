import 'package:honey_island/expenses/repositories/expense_entity.dart';

abstract class ExpenseRepository {
  Future<List<ExpenseEntity>> getExpenses();
}