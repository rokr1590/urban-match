// events_logic.dart - Updated Logic
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:urban_match/core/models/events/events.dtos.dart';
import 'dart:math';

import 'package:urban_match/pages/event/event.repository.dart';
import 'package:urban_match/pages/event/event.view.model.dart';

part 'event.logic.g.dart';

@Riverpod()
class EventsLogic extends _$EventsLogic {
  final EventRepository _repository = EventRepository();

  @override
  Future<EventsState> build() async {
    try {
      final events = await _repository.fetchEvents();

      // Add random coordinates for map markers since API doesn't provide them
      final eventsWithCoords = events.map((event) {
        final random = Random();
        return event.copyWith(
          latitude:
              37.7749 + (random.nextDouble() - 0.5) * 0.1, // Random around SF
          longitude: -122.4194 + (random.nextDouble() - 0.5) * 0.1,
        );
      }).toList();

      return EventsState(
        events: eventsWithCoords,
        filteredEvents: eventsWithCoords,
        currentFilter: EventFilter.all,
      );
    } catch (e) {
      throw Exception('Failed to load events: $e');
    }
  }

  void filterEvents(EventFilter filter) {
    final currentState = state.value;
    if (currentState == null) return;

    List<EventsDto> filtered;
    switch (filter) {
      case EventFilter.upcoming:
        filtered =
            currentState.events.where((event) => event.isUpcoming).toList();
        break;
      case EventFilter.past:
        filtered =
            currentState.events.where((event) => !event.isUpcoming).toList();
        break;
      case EventFilter.all:
      default:
        filtered = currentState.events;
        break;
    }

    state = AsyncValue.data(currentState.copyWith(
      filteredEvents: filtered,
      currentFilter: filter,
    ));
  }

  Future<void> refreshEvents() async {
    state = const AsyncValue.loading();
    ref.invalidateSelf();
  }
}
