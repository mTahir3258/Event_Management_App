import 'package:flutter/material.dart';
import 'package:ui_specification/models/user_management.dart';

class UserManagementProvider extends ChangeNotifier {
  List<User> _users = [];
  List<Role> _roles = [];
  bool _isLoading = false;

  List<User> get users => _users;
  List<Role> get roles => _roles;
  bool get isLoading => _isLoading;

  UserManagementProvider() {
    _loadMockData();
  }

  void _loadMockData() {
    _isLoading = true;
    notifyListeners();

    Future.delayed(const Duration(seconds: 1), () {
      _roles = [
        Role(id: '1', name: 'Admin', permissions: ['all']),
        Role(id: '2', name: 'Manager', permissions: ['read', 'write']),
        Role(id: '3', name: 'Staff', permissions: ['read']),
      ];

      _users = [
        User(
          id: '1',
          name: 'John Doe',
          email: 'john@example.com',
          roleId: '1',
          phone: '+1234567890',
        ),
        User(
          id: '2',
          name: 'Jane Smith',
          email: 'jane@example.com',
          roleId: '2',
          phone: '+0987654321',
        ),
      ];

      _isLoading = false;
      notifyListeners();
    });
  }

  // User Operations
  void addUser(User user) {
    _users.add(user);
    notifyListeners();
  }

  void updateUser(User user) {
    final index = _users.indexWhere((u) => u.id == user.id);
    if (index != -1) {
      _users[index] = user;
      notifyListeners();
    }
  }

  void deleteUser(String id) {
    _users.removeWhere((u) => u.id == id);
    notifyListeners();
  }

  // Role Operations
  void addRole(Role role) {
    _roles.add(role);
    notifyListeners();
  }

  void updateRole(Role role) {
    final index = _roles.indexWhere((r) => r.id == role.id);
    if (index != -1) {
      _roles[index] = role;
      notifyListeners();
    }
  }

  void deleteRole(String id) {
    _roles.removeWhere((r) => r.id == id);
    notifyListeners();
  }
}
