/// Lead model
class Lead {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String whatsapp;
  final String? address;
  final String status; // new, in_progress, success, failed
  final String? communicationStatus;
  final String source;
  final DateTime createdAt;
  final DateTime updatedAt;

  Lead({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.whatsapp,
    this.address,
    required this.status,
    this.communicationStatus,
    required this.source,
    required this.createdAt,
    required this.updatedAt,
  });

  String get fullName => '$firstName $lastName';

  // Mock data factory
  static List<Lead> getMockLeads() {
    return [
      Lead(
        id: '1',
        firstName: 'John',
        lastName: 'Doe',
        email: 'john.doe@example.com',
        phone: '+91 98765 43210',
        whatsapp: '+91 98765 43210',
        address: '123 Main St, City',
        status: 'new',
        communicationStatus: 'pending',
        source: 'Facebook',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        updatedAt: DateTime.now(),
      ),
      Lead(
        id: '2',
        firstName: 'Jane',
        lastName: 'Smith',
        email: 'jane.smith@example.com',
        phone: '+91 98765 43211',
        whatsapp: '+91 98765 43211',
        status: 'in_progress',
        source: 'Instagram',
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];
  }
}
