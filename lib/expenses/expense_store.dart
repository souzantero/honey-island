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
        payerId: '1',
        splitterIds: ['2', '3'],
      ),
      ExpenseEntity(
        id: '1',
        description: 'Bebidas',
        amount: 183.90,
        payerId: '1',
        splitterIds: ['2', '3'],
      ),
      ExpenseEntity(
        id: '2',
        description: 'Combustivel',
        amount: 80,
        payerId: '2',
        splitterIds: ['1', '3'],
      ),
      ExpenseEntity(
        id: '3',
        description: 'Camping',
        amount: 120,
        payerId: '3',
        splitterIds: ['1'],
      ),
    ]);
  }
}