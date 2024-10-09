class OrderModel {
  final int id;
  final int customerId;
  final int tableId;
  final DateTime orderDate;
  final double total;
  final bool isPaid;

  OrderModel({
    required this.id,
    required this.customerId,
    required this.tableId,
    required this.orderDate,
    required this.total,
    required this.isPaid,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      customerId: json['customer_id'],
      tableId: json['table_id'],
      orderDate: DateTime.parse(json['order_date']),
      total: json['total'].toDouble(),
      isPaid: json['is_paid'],
    );
  }
}
