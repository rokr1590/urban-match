// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events.dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventsDto _$EventsDtoFromJson(Map<String, dynamic> json) {
  return _EventsDto.fromJson(json);
}

/// @nodoc
mixin _$EventsDto {
  String get name => throw _privateConstructorUsedError;
  DateTime get time =>
      throw _privateConstructorUsedError; // Additional fields for internal use (not from API)
  String? get id => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  bool get isUpcoming => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;

  /// Serializes this EventsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventsDtoCopyWith<EventsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventsDtoCopyWith<$Res> {
  factory $EventsDtoCopyWith(EventsDto value, $Res Function(EventsDto) then) =
      _$EventsDtoCopyWithImpl<$Res, EventsDto>;
  @useResult
  $Res call(
      {String name,
      DateTime time,
      String? id,
      String? description,
      String? location,
      String? imageUrl,
      bool isUpcoming,
      double? latitude,
      double? longitude});
}

/// @nodoc
class _$EventsDtoCopyWithImpl<$Res, $Val extends EventsDto>
    implements $EventsDtoCopyWith<$Res> {
  _$EventsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? time = null,
    Object? id = freezed,
    Object? description = freezed,
    Object? location = freezed,
    Object? imageUrl = freezed,
    Object? isUpcoming = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isUpcoming: null == isUpcoming
          ? _value.isUpcoming
          : isUpcoming // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventsDtoImplCopyWith<$Res>
    implements $EventsDtoCopyWith<$Res> {
  factory _$$EventsDtoImplCopyWith(
          _$EventsDtoImpl value, $Res Function(_$EventsDtoImpl) then) =
      __$$EventsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      DateTime time,
      String? id,
      String? description,
      String? location,
      String? imageUrl,
      bool isUpcoming,
      double? latitude,
      double? longitude});
}

/// @nodoc
class __$$EventsDtoImplCopyWithImpl<$Res>
    extends _$EventsDtoCopyWithImpl<$Res, _$EventsDtoImpl>
    implements _$$EventsDtoImplCopyWith<$Res> {
  __$$EventsDtoImplCopyWithImpl(
      _$EventsDtoImpl _value, $Res Function(_$EventsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? time = null,
    Object? id = freezed,
    Object? description = freezed,
    Object? location = freezed,
    Object? imageUrl = freezed,
    Object? isUpcoming = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$EventsDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isUpcoming: null == isUpcoming
          ? _value.isUpcoming
          : isUpcoming // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventsDtoImpl with DiagnosticableTreeMixin implements _EventsDto {
  const _$EventsDtoImpl(
      {required this.name,
      required this.time,
      this.id,
      this.description,
      this.location,
      this.imageUrl,
      this.isUpcoming = false,
      this.latitude,
      this.longitude});

  factory _$EventsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventsDtoImplFromJson(json);

  @override
  final String name;
  @override
  final DateTime time;
// Additional fields for internal use (not from API)
  @override
  final String? id;
  @override
  final String? description;
  @override
  final String? location;
  @override
  final String? imageUrl;
  @override
  @JsonKey()
  final bool isUpcoming;
  @override
  final double? latitude;
  @override
  final double? longitude;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventsDto(name: $name, time: $time, id: $id, description: $description, location: $location, imageUrl: $imageUrl, isUpcoming: $isUpcoming, latitude: $latitude, longitude: $longitude)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EventsDto'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('isUpcoming', isUpcoming))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventsDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isUpcoming, isUpcoming) ||
                other.isUpcoming == isUpcoming) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, time, id, description,
      location, imageUrl, isUpcoming, latitude, longitude);

  /// Create a copy of EventsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventsDtoImplCopyWith<_$EventsDtoImpl> get copyWith =>
      __$$EventsDtoImplCopyWithImpl<_$EventsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventsDtoImplToJson(
      this,
    );
  }
}

abstract class _EventsDto implements EventsDto {
  const factory _EventsDto(
      {required final String name,
      required final DateTime time,
      final String? id,
      final String? description,
      final String? location,
      final String? imageUrl,
      final bool isUpcoming,
      final double? latitude,
      final double? longitude}) = _$EventsDtoImpl;

  factory _EventsDto.fromJson(Map<String, dynamic> json) =
      _$EventsDtoImpl.fromJson;

  @override
  String get name;
  @override
  DateTime get time; // Additional fields for internal use (not from API)
  @override
  String? get id;
  @override
  String? get description;
  @override
  String? get location;
  @override
  String? get imageUrl;
  @override
  bool get isUpcoming;
  @override
  double? get latitude;
  @override
  double? get longitude;

  /// Create a copy of EventsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventsDtoImplCopyWith<_$EventsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
