import 'package:honey_island/users/user.dart';

class Expense {
  final String id;
  final double amount;
  final String description;
  final DateTime date;
  final User user;

  Expense({
    required this.id,
    required this.description,
    required this.amount,
    required this.date,
    required this.user,
  });

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator == (Object other) => other is Expense && other.id == id;
}