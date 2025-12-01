import 'package:flutter/material.dart';
import 'package:ui_specification/models/payment.dart';

class PaymentProvider with ChangeNotifier {
  List<Payment> _payments = Payment.generateMockList(20);

  List<Payment> get payments => _payments;

  void addPayment(Payment payment) {
    _payments.add(payment);
    notifyListeners();
  }

  void updatePayment(Payment updatedPayment) {
    final index = _payments.indexWhere((p) => p.id == updatedPayment.id);
    if (index != -1) {
      _payments[index] = updatedPayment;
      notifyListeners();
    }
  }

  void deletePayment(String id) {
    _payments.removeWhere((p) => p.id == id);
    notifyListeners();
  }

  Payment? getPaymentById(String id) {
    return _payments.firstWhere((p) => p.id == id);
  }
}
