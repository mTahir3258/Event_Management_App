enum PaymentStatus { pending, completed, failed }

class Payment {
  final String id;
  final String orderId;
  final String clientName;
  final double amount;
  final DateTime date;
  final PaymentStatus status;
  final String method; // cash, upi, card, bank_transfer

  Payment({
    required this.id,
    required this.orderId,
    required this.clientName,
    required this.amount,
    required this.date,
    required this.status,
    required this.method,
  });

  static List<Payment> generateMockList(int count) {
    final methods = ['Cash', 'UPI', 'Card', 'Bank Transfer'];
    final statuses = [
      PaymentStatus.pending,
      PaymentStatus.completed,
      PaymentStatus.failed,
    ];

    return List.generate(count, (index) {
      return Payment(
        id: 'PAY${index.toString().padLeft(3, '0')}',
        orderId: 'ORD${index.toString().padLeft(3, '0')}',
        clientName: [
          'Rajesh & Priya',
          'Amit & Sneha',
          'Vikram & Kavita',
        ][index % 3],
        amount: 10000 + (index * 5000),
        date: DateTime.now().subtract(Duration(days: index * 2)),
        status: statuses[index % 3],
        method: methods[index % 4],
      );
    });
  }
}
