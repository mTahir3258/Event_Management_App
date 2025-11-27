import 'package:flutter/material.dart';
import 'package:ui_specification/models/order.dart';

class OrderProvider with ChangeNotifier {
  List<Order> _orders = [];
  bool _isLoading = false;
  String? _error;

  List<Order> get orders => _orders;
  bool get isLoading => _isLoading;
  String? get error => _error;

  List<Order> get upcomingOrders {
    final now = DateTime.now();
    return _orders.where((order) => order.eventDate.isAfter(now)).toList();
  }

  List<Order> get unassignedOrders {
    return _orders.where((order) => order.services.isEmpty).toList();
  }

  List<Order> get paymentDueOrders {
    return _orders
        .where(
          (order) =>
              order.paymentStatus == 'pending' ||
              order.paymentStatus == 'partial',
        )
        .toList();
  }

  Future<void> loadOrders() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      _orders = Order.generateMockList(15);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Order? getOrderById(String id) {
    try {
      return _orders.firstWhere((order) => order.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<void> addOrder(Order order) async {
    // TODO: Implement API call
    _orders.add(order);
    notifyListeners();
  }

  Future<void> updateOrder(Order order) async {
    // TODO: Implement API call
    final index = _orders.indexWhere((o) => o.id == order.id);
    if (index != -1) {
      _orders[index] = order;
      notifyListeners();
    }
  }

  Future<void> deleteOrder(String id) async {
    // TODO: Implement API call
    _orders.removeWhere((order) => order.id == id);
    notifyListeners();
  }
}
