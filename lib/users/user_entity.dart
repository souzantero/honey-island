class UserEntity {
  final String id;
  final String name;

  UserEntity({required this.id, required this.name});

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator == (Object other) => other is UserEntity && other.id == id;
}