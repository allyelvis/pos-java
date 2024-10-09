class TableModel {
  final int id;
  final int tableNumber;
  final int capacity;
  final bool isAvailable;

  TableModel({
    required this.id,
    required this.tableNumber,
    required this.capacity,
    required this.isAvailable,
  });

  factory TableModel.fromJson(Map<String, dynamic> json) {
    return TableModel(
      id: json['id'],
      tableNumber: json['table_number'],
      capacity: json['capacity'],
      isAvailable: json['is_available'],
    );
  }
}
