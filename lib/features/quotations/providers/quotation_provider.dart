import 'package:flutter/material.dart';
import 'package:ui_specification/models/quotation.dart';

class QuotationProvider extends ChangeNotifier {
  List<Quotation> _quotations = [];
  bool _isLoading = false;

  List<Quotation> get quotations => _quotations;
  bool get isLoading => _isLoading;

  QuotationProvider() {
    loadQuotations();
  }

  void loadQuotations() {
    _isLoading = true;
    notifyListeners();

    // Simulate API delay
    Future.delayed(const Duration(seconds: 1), () {
      _quotations = Quotation.getMockQuotations();
      _isLoading = false;
      notifyListeners();
    });
  }

  List<Quotation> getQuotationsByStatus(QuotationStatus status) {
    return _quotations.where((q) => q.status == status).toList();
  }

  Quotation? getQuotationById(String id) {
    try {
      return _quotations.firstWhere((q) => q.id == id);
    } catch (e) {
      return null;
    }
  }

  void addQuotation(Quotation quotation) {
    _quotations.add(quotation);
    notifyListeners();
  }

  void updateQuotation(Quotation quotation) {
    final index = _quotations.indexWhere((q) => q.id == quotation.id);
    if (index != -1) {
      _quotations[index] = quotation;
      notifyListeners();
    }
  }

  void deleteQuotation(String id) {
    _quotations.removeWhere((q) => q.id == id);
    notifyListeners();
  }
}
