import 'package:flutter/material.dart';
import 'package:ui_specification/models/event.dart';

class EventProvider extends ChangeNotifier {
  List<Event> _events = [];
  bool _isLoading = false;

  List<Event> get events => _events;
  bool get isLoading => _isLoading;

  // Get events for a specific day
  List<Event> getEventsForDay(DateTime day) {
    return _events.where((event) {
      return event.date.year == day.year &&
          event.date.month == day.month &&
          event.date.day == day.day;
    }).toList();
  }

  // Get upcoming events
  List<Event> get upcomingEvents =>
      _events.where((e) => e.status == EventStatus.upcoming).toList();

  Future<void> loadEvents() async {
    _isLoading = true;
    notifyListeners();

    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));
    _events = Event.getMockEvents();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addEvent(Event event) async {
    _events.add(event);
    notifyListeners();
  }

  Future<void> updateEvent(Event event) async {
    final index = _events.indexWhere((e) => e.id == event.id);
    if (index != -1) {
      _events[index] = event;
      notifyListeners();
    }
  }

  Event? getEventById(String id) {
    try {
      return _events.firstWhere((e) => e.id == id);
    } catch (e) {
      return null;
    }
  }
}
