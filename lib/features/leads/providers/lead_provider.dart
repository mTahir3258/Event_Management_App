import 'package:flutter/material.dart';
import 'package:ui_specification/models/lead.dart';

/// Lead provider for state management
class LeadProvider with ChangeNotifier {
  List<Lead> _leads = [];
  bool _isLoading = false;
  String? _error;

  List<Lead> get leads => _leads;
  bool get isLoading => _isLoading;
  String? get error => _error;

  /// Load leads (mock implementation)
  Future<void> loadLeads() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      _leads = Lead.getMockLeads();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Add lead (placeholder for future implementation)
  Future<void> addLead(Lead lead) async {
    // TODO: Implement in future
    _leads.add(lead);
    notifyListeners();
  }

  /// Update lead (placeholder for future implementation)
  Future<void> updateLead(String id, Lead lead) async {
    // TODO: Implement in future
    final index = _leads.indexWhere((l) => l.id == id);
    if (index != -1) {
      _leads[index] = lead;
      notifyListeners();
    }
  }

  /// Delete lead (placeholder for future implementation)
  Future<void> deleteLead(String id) async {
    // TODO: Implement in future
    _leads.removeWhere((l) => l.id == id);
    notifyListeners();
  }

  /// Get lead by ID
  Lead? getLeadById(String id) {
    try {
      return _leads.firstWhere((l) => l.id == id);
    } catch (e) {
      return null;
    }
  }
}
