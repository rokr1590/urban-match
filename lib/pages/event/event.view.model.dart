import 'package:urban_match/core/models/events/events.dtos.dart';

class EventsState {
  final List<EventsDto> events;
  final List<EventsDto> filteredEvents;
  final EventFilter currentFilter;
  final bool isLoading;
  final String? error;

  EventsState({
    required this.events,
    required this.filteredEvents,
    required this.currentFilter,
    this.isLoading = false,
    this.error,
  });

  EventsState copyWith({
    List<EventsDto>? events,
    List<EventsDto>? filteredEvents,
    EventFilter? currentFilter,
    bool? isLoading,
    String? error,
  }) {
    return EventsState(
      events: events ?? this.events,
      filteredEvents: filteredEvents ?? this.filteredEvents,
      currentFilter: currentFilter ?? this.currentFilter,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
