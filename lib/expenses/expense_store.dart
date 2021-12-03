import 'package:honey_island/expenses/expense_entity.dart';
import 'package:honey_island/expenses/expense_repository.dart';

class ExpenseStore implements ExpenseRepository {
  const ExpenseStore();

  @override
  Future<List<ExpenseEntity>> getExpenses() {
    return Future.value([
      ExpenseEntity(
        id: '1',
        description: 'Mercado',
        amount: 100,
        userId: '1',
      ),
      ExpenseEntity(
        id: '2',
        description: 'Combustivel',
        amount: 80,
        userId: '2',
      ),
      ExpenseEntity(
        id: '3',
        description: 'Camping',
        amount: 120,
        userId: '3',
      ),
    ]);
  }
}