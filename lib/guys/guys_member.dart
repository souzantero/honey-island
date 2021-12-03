class GuysMember {
  final int id;
  final String name;

  GuysMember({required this.id, required this.name});

  @override
  int get hashCode => id;

  @override
  bool operator == (Object other) => other is GuysMember && other.id == id;
}