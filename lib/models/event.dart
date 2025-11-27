enum EventStatus { upcoming, completed, cancelled }

class Event {
  final String id;
  final String name;
  final String type;
  final DateTime date;
  final String venue;
  final String clientId;
  final String clientName;
  final EventStatus status;
  final List<String> assignedTeamIds;
  final List<String> serviceIds;
  final double totalAmount;
  final double paidAmount;

  const Event({
    required this.id,
    required this.name,
    required this.type,
    required this.date,
    required this.venue,
    required this.clientId,
    required this.clientName,
    required this.status,
    this.assignedTeamIds = const [],
    this.serviceIds = const [],
    this.totalAmount = 0.0,
    this.paidAmount = 0.0,
  });

  double get dueAmount => totalAmount - paidAmount;
  double get paymentProgress =>
      totalAmount > 0 ? paidAmount / totalAmount : 0.0;

  // Mock data factory
  static List<Event> getMockEvents() {
    final now = DateTime.now();
    return [
      Event(
        id: 'EVT001',
        name: 'Sharma Wedding',
        type: 'Wedding',
        date: now.add(const Duration(days: 2)),
        venue: 'Grand Hyatt, Mumbai',
        clientId: 'CLT001',
        clientName: 'Rahul Sharma',
        status: EventStatus.upcoming,
        assignedTeamIds: ['TM001', 'TM002'],
        serviceIds: ['SRV001', 'SRV002'],
        totalAmount: 500000,
        paidAmount: 200000,
      ),
      Event(
        id: 'EVT002',
        name: 'Tech Corp Annual Meet',
        type: 'Corporate',
        date: now.add(const Duration(days: 5)),
        venue: 'Taj Lands End',
        clientId: 'CLT002',
        clientName: 'Tech Corp Ltd',
        status: EventStatus.upcoming,
        assignedTeamIds: ['TM003'],
        serviceIds: ['SRV003'],
        totalAmount: 150000,
        paidAmount: 150000,
      ),
      Event(
        id: 'EVT003',
        name: 'Birthday Bash',
        type: 'Birthday',
        date: now.subtract(const Duration(days: 2)),
        venue: 'Juhu Club',
        clientId: 'CLT003',
        clientName: 'Priya Singh',
        status: EventStatus.completed,
        assignedTeamIds: ['TM001'],
        serviceIds: ['SRV001'],
        totalAmount: 50000,
        paidAmount: 50000,
      ),
      Event(
        id: 'EVT004',
        name: 'Silver Jubilee',
        type: 'Anniversary',
        date: now.add(const Duration(days: 10)),
        venue: 'Ritz Carlton',
        clientId: 'CLT001',
        clientName: 'Rahul Sharma',
        status: EventStatus.upcoming,
        assignedTeamIds: [],
        serviceIds: ['SRV002'],
        totalAmount: 250000,
        paidAmount: 50000,
      ),
    ];
  }
}
