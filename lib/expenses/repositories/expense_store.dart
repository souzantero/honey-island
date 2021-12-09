import 'package:honey_island/expenses/repositories/expense_entity.dart';
import 'package:honey_island/expenses/repositories/expense_repository.dart';

class ExpenseStore implements ExpenseRepository {
  const ExpenseStore();

  @override
  Future<List<ExpenseEntity>> getExpenses() {
    return Future.value([
      ExpenseEntity(
        id: '1',
        payerId: '2',
        description: 'Gasolina, pedágio e ducha',
        amount: 130,
        splitterIds: ['1', '2', '5', '6'],
      ),
      ExpenseEntity(
        id: '2',
        payerId: '5',
        description: 'Lenha e carvão',
        amount: 100,
        splitterIds: ['1', '2', '3', '4', '5', '6'],
      ),
      ExpenseEntity(
        id: '3',
        payerId: '6',
        description: 'Lenha e carvão',
        amount: 65,
        splitterIds: ['1', '2', '3', '4', '5', '6'],
      ),
      ExpenseEntity(
        id: '4',
        payerId: '1',
        description: 'Salmão, pão e água',
        amount: 136,
        splitterIds: ['1', '2', '3', '4', '5', '6'],
      ),
      ExpenseEntity(
        id: '5',
        payerId: '1',
        description: 'Aluguel do camping',
        amount: 120,
        splitterIds: ['5', '6'],
      ),
      ExpenseEntity(
        id: '6',
        payerId: '3',
        description: 'Carnes',
        amount: 250,
        splitterIds: ['3', '4', '5', '6'],
      ),
      ExpenseEntity(
        id: '7',
        payerId: '3',
        description: 'Comidas e cervejas',
        amount: 919,
        splitterIds: ['1', '2', '3', '4', '5', '6'],
      ),
    ]);
  }
}