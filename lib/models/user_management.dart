class User {
  final String id;
  final String name;
  final String email;
  final String roleId;
  final String phone;
  final bool isActive;
  final String? avatarUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.roleId,
    required this.phone,
    this.isActive = true,
    this.avatarUrl,
  });
}

class Role {
  final String id;
  final String name;
  final List<String> permissions;
  final bool isActive;

  Role({
    required this.id,
    required this.name,
    required this.permissions,
    this.isActive = true,
  });
}
