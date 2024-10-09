class ItemModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final int stock;

  ItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      stock: json['stock'],
    );
  }
}
