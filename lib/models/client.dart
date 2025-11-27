class Client {
  final String id;
  final String fullName;
  final String whatsappNumber;
  final String? alternateNumber;
  final String? email;
  final String source;
  final String createdBy;
  final DateTime createdDate;
  final List<ContactPerson> contactPersons;
  final String? notes;

  Client({
    required this.id,
    required this.fullName,
    required this.whatsappNumber,
    this.alternateNumber,
    this.email,
    required this.source,
    required this.createdBy,
    required this.createdDate,
    this.contactPersons = const [],
    this.notes,
  });

  factory Client.mock(int index) {
    return Client(
      id: 'CLT${index.toString().padLeft(3, '0')}',
      fullName: [
        'Rajesh & Priya',
        'Amit & Sneha',
        'Vikram & Kavita',
      ][index % 3],
      whatsappNumber: '+91 ${98765 + index} ${43210 + index}',
      alternateNumber: index % 2 == 0
          ? '+91 ${98766 + index} ${43211 + index}'
          : null,
      email: index % 2 == 0 ? 'client$index@example.com' : null,
      source: ['Referral', 'Facebook', 'Instagram', 'Website'][index % 4],
      createdBy: 'Admin',
      createdDate: DateTime.now().subtract(Duration(days: index * 5)),
      contactPersons: [
        ContactPerson(
          name: 'Rajesh',
          phone: '+91 98765 ${43210 + index}',
          isPrimary: true,
        ),
        if (index % 2 == 0)
          ContactPerson(
            name: 'Priya',
            phone: '+91 98766 ${43211 + index}',
            isPrimary: false,
          ),
      ],
      notes: index % 2 == 0 ? 'VIP client - high budget wedding' : null,
    );
  }

  static List<Client> generateMockList(int count) {
    return List.generate(count, (index) => Client.mock(index));
  }
}

class ContactPerson {
  final String name;
  final String phone;
  final bool isPrimary;

  ContactPerson({
    required this.name,
    required this.phone,
    this.isPrimary = false,
  });
}
