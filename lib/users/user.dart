class User {
  final String id;
  final String name;

  User({required this.id, required this.name});

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator == (Object other) => other is User && other.id == id;
}