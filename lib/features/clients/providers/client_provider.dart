import 'package:flutter/material.dart';
import 'package:ui_specification/models/client.dart';

class ClientProvider with ChangeNotifier {
  List<Client> _clients = [];
  bool _isLoading = false;
  String? _error;

  List<Client> get clients => _clients;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadClients() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      _clients = Client.generateMockList(10);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Client? getClientById(String id) {
    try {
      return _clients.firstWhere((client) => client.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<void> addClient(Client client) async {
    // TODO: Implement API call
    _clients.add(client);
    notifyListeners();
  }

  Future<void> updateClient(Client client) async {
    // TODO: Implement API call
    final index = _clients.indexWhere((c) => c.id == client.id);
    if (index != -1) {
      _clients[index] = client;
      notifyListeners();
    }
  }

  Future<void> deleteClient(String id) async {
    // TODO: Implement API call
    _clients.removeWhere((client) => client.id == id);
    notifyListeners();
  }
}
