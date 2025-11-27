class LeadSource {
  final String id;
  final String name;
  final bool isActive;

  LeadSource({required this.id, required this.name, this.isActive = true});
}

class EventType {
  final String id;
  final String name;
  final bool isActive;

  EventType({required this.id, required this.name, this.isActive = true});
}

class TeamCategory {
  final String id;
  final String name;
  final bool isActive;

  TeamCategory({required this.id, required this.name, this.isActive = true});
}

class Service {
  final String id;
  final String name;
  final bool isActive;

  Service({required this.id, required this.name, this.isActive = true});
}

class SubService {
  final String id;
  final String serviceId;
  final String name;
  final bool isActive;

  SubService({
    required this.id,
    required this.serviceId,
    required this.name,
    this.isActive = true,
  });
}

class AdminNotification {
  final String id;
  final String name;
  final String number;
  final bool isActive;

  AdminNotification({
    required this.id,
    required this.name,
    required this.number,
    this.isActive = true,
  });
}

class NotificationTemplate {
  final String id;
  final String name;
  final String content;
  final bool isActive;

  NotificationTemplate({
    required this.id,
    required this.name,
    required this.content,
    this.isActive = true,
  });
}

class Package {
  final String id;
  final String name;
  final double price;
  final String description;
  final bool isActive;

  Package({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    this.isActive = true,
  });
}
