import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'events.dtos.freezed.dart';
part 'events.dtos.g.dart';

@freezed
class EventsDto with _$EventsDto {
  const factory EventsDto({
    required String name,
    required DateTime time,
    // Additional fields for internal use (not from API)
    String? id,
    String? description,
    String? location,
    String? imageUrl,
    @Default(false) bool isUpcoming,
    double? latitude,
    double? longitude,
  }) = _EventsDto;

  factory EventsDto.fromJson(Map<String, dynamic> json) =>
      _$EventsDtoFromJson(json);
}

enum EventFilter { all, upcoming, past }
