import 'package:honey_island/expenses/expense_entity.dart';
import 'package:honey_island/users/user.dart';
import 'package:uuid/uuid.dart';

class Expense {
  final String id;
  final double amount;
  final String description;
  final User paidBy;

  Expense({
    required this.id,
    required this.description,
    required this.amount,
    required this.paidBy,
  });

  factory Expense.create({
    required String description,
    required double amount,
    required User paidBy,
  }) {
    return Expense(
      id: const Uuid().v4(),
      description: description,
      amount: amount,
      paidBy: paidBy,
    );
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator == (Object other) => other is Expense && other.id == id;
}