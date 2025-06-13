// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventsDtoImpl _$$EventsDtoImplFromJson(Map<String, dynamic> json) =>
    _$EventsDtoImpl(
      name: json['name'] as String,
      time: DateTime.parse(json['time'] as String),
      id: json['id'] as String?,
      description: json['description'] as String?,
      location: json['location'] as String?,
      imageUrl: json['imageUrl'] as String?,
      isUpcoming: json['isUpcoming'] as bool? ?? false,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$EventsDtoImplToJson(_$EventsDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'time': instance.time.toIso8601String(),
      'id': instance.id,
      'description': instance.description,
      'location': instance.location,
      'imageUrl': instance.imageUrl,
      'isUpcoming': instance.isUpcoming,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
