import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/table_model.dart';
import '../models/customer_model.dart';
import '../models/item_model.dart';
import '../models/order_model.dart';

class ApiService {
  static const String baseUrl = 'http://your-backend-url';

  Future<List<TableModel>> getTables() async {
    final response = await http.get(Uri.parse('$baseUrl/tables'));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((json) => TableModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load tables');
    }
  }

  Future<List<ItemModel>> getItems() async {
    final response = await http.get(Uri.parse('$baseUrl/items'));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((json) => ItemModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<List<CustomerModel>> getCustomers() async {
    final response = await http.get(Uri.parse('$baseUrl/customers'));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((json) => CustomerModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load customers');
    }
  }

  Future<void> createOrder(OrderModel order) async {
    final response = await http.post(
      Uri.parse('$baseUrl/orders'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(order),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create order');
    }
  }

  Future<void> payOrder(int orderId) async {
    final response = await http.put(Uri.parse('$baseUrl/orders/$orderId/pay'));
    if (response.statusCode != 200) {
      throw Exception('Failed to pay order');
    }
  }
}
