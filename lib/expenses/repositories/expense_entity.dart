class ExpenseEntity {
  final String id;
  final double amount;
  final String description;
  final String payerId;
  final List<String> splitterIds;

  ExpenseEntity({
    required this.id,
    required this.description,
    required this.amount,
    required this.payerId,
    required this.splitterIds,
  });

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator == (Object other) => other is ExpenseEntity && other.id == id;
}