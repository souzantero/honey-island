class Event {
  final String id;
  final String name;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  
  Event({
    required this.id, 
    required this.name, 
    required this.description, 
    required this.startDate, 
    required this.endDate
  });

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator == (Object other) => other is Event && other.id == id;
}