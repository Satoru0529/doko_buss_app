// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trips.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Trips _$TripsFromJson(Map<String, dynamic> json) {
  return _Trips.fromJson(json);
}

/// @nodoc
mixin _$Trips {
  String get id => throw _privateConstructorUsedError;
  String get routeId => throw _privateConstructorUsedError;
  String get tripId => throw _privateConstructorUsedError;
  String get tripHeadsign => throw _privateConstructorUsedError;
  int get directionId => throw _privateConstructorUsedError;
  int get jpPatternId => throw _privateConstructorUsedError;
  @LatLngConverter()
  LatLng get startPosition => throw _privateConstructorUsedError;
  @LatLngConverter()
  LatLng get endPosition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripsCopyWith<Trips> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripsCopyWith<$Res> {
  factory $TripsCopyWith(Trips value, $Res Function(Trips) then) =
      _$TripsCopyWithImpl<$Res, Trips>;
  @useResult
  $Res call(
      {String id,
      String routeId,
      String tripId,
      String tripHeadsign,
      int directionId,
      int jpPatternId,
      @LatLngConverter() LatLng startPosition,
      @LatLngConverter() LatLng endPosition});
}

/// @nodoc
class _$TripsCopyWithImpl<$Res, $Val extends Trips>
    implements $TripsCopyWith<$Res> {
  _$TripsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? routeId = null,
    Object? tripId = null,
    Object? tripHeadsign = null,
    Object? directionId = null,
    Object? jpPatternId = null,
    Object? startPosition = null,
    Object? endPosition = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      routeId: null == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as String,
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as String,
      tripHeadsign: null == tripHeadsign
          ? _value.tripHeadsign
          : tripHeadsign // ignore: cast_nullable_to_non_nullable
              as String,
      directionId: null == directionId
          ? _value.directionId
          : directionId // ignore: cast_nullable_to_non_nullable
              as int,
      jpPatternId: null == jpPatternId
          ? _value.jpPatternId
          : jpPatternId // ignore: cast_nullable_to_non_nullable
              as int,
      startPosition: null == startPosition
          ? _value.startPosition
          : startPosition // ignore: cast_nullable_to_non_nullable
              as LatLng,
      endPosition: null == endPosition
          ? _value.endPosition
          : endPosition // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TripsCopyWith<$Res> implements $TripsCopyWith<$Res> {
  factory _$$_TripsCopyWith(_$_Trips value, $Res Function(_$_Trips) then) =
      __$$_TripsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String routeId,
      String tripId,
      String tripHeadsign,
      int directionId,
      int jpPatternId,
      @LatLngConverter() LatLng startPosition,
      @LatLngConverter() LatLng endPosition});
}

/// @nodoc
class __$$_TripsCopyWithImpl<$Res> extends _$TripsCopyWithImpl<$Res, _$_Trips>
    implements _$$_TripsCopyWith<$Res> {
  __$$_TripsCopyWithImpl(_$_Trips _value, $Res Function(_$_Trips) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? routeId = null,
    Object? tripId = null,
    Object? tripHeadsign = null,
    Object? directionId = null,
    Object? jpPatternId = null,
    Object? startPosition = null,
    Object? endPosition = null,
  }) {
    return _then(_$_Trips(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      routeId: null == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as String,
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as String,
      tripHeadsign: null == tripHeadsign
          ? _value.tripHeadsign
          : tripHeadsign // ignore: cast_nullable_to_non_nullable
              as String,
      directionId: null == directionId
          ? _value.directionId
          : directionId // ignore: cast_nullable_to_non_nullable
              as int,
      jpPatternId: null == jpPatternId
          ? _value.jpPatternId
          : jpPatternId // ignore: cast_nullable_to_non_nullable
              as int,
      startPosition: null == startPosition
          ? _value.startPosition
          : startPosition // ignore: cast_nullable_to_non_nullable
              as LatLng,
      endPosition: null == endPosition
          ? _value.endPosition
          : endPosition // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Trips with DiagnosticableTreeMixin implements _Trips {
  const _$_Trips(
      {this.id = '',
      this.routeId = '',
      this.tripId = '',
      this.tripHeadsign = '',
      this.directionId = 0,
      this.jpPatternId = 0,
      @LatLngConverter() this.startPosition = const LatLng(0, 0),
      @LatLngConverter() this.endPosition = const LatLng(0, 0)});

  factory _$_Trips.fromJson(Map<String, dynamic> json) =>
      _$$_TripsFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String routeId;
  @override
  @JsonKey()
  final String tripId;
  @override
  @JsonKey()
  final String tripHeadsign;
  @override
  @JsonKey()
  final int directionId;
  @override
  @JsonKey()
  final int jpPatternId;
  @override
  @JsonKey()
  @LatLngConverter()
  final LatLng startPosition;
  @override
  @JsonKey()
  @LatLngConverter()
  final LatLng endPosition;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Trips(id: $id, routeId: $routeId, tripId: $tripId, tripHeadsign: $tripHeadsign, directionId: $directionId, jpPatternId: $jpPatternId, startPosition: $startPosition, endPosition: $endPosition)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Trips'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('routeId', routeId))
      ..add(DiagnosticsProperty('tripId', tripId))
      ..add(DiagnosticsProperty('tripHeadsign', tripHeadsign))
      ..add(DiagnosticsProperty('directionId', directionId))
      ..add(DiagnosticsProperty('jpPatternId', jpPatternId))
      ..add(DiagnosticsProperty('startPosition', startPosition))
      ..add(DiagnosticsProperty('endPosition', endPosition));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Trips &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.routeId, routeId) || other.routeId == routeId) &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            (identical(other.tripHeadsign, tripHeadsign) ||
                other.tripHeadsign == tripHeadsign) &&
            (identical(other.directionId, directionId) ||
                other.directionId == directionId) &&
            (identical(other.jpPatternId, jpPatternId) ||
                other.jpPatternId == jpPatternId) &&
            (identical(other.startPosition, startPosition) ||
                other.startPosition == startPosition) &&
            (identical(other.endPosition, endPosition) ||
                other.endPosition == endPosition));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, routeId, tripId,
      tripHeadsign, directionId, jpPatternId, startPosition, endPosition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TripsCopyWith<_$_Trips> get copyWith =>
      __$$_TripsCopyWithImpl<_$_Trips>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TripsToJson(
      this,
    );
  }
}

abstract class _Trips implements Trips {
  const factory _Trips(
      {final String id,
      final String routeId,
      final String tripId,
      final String tripHeadsign,
      final int directionId,
      final int jpPatternId,
      @LatLngConverter() final LatLng startPosition,
      @LatLngConverter() final LatLng endPosition}) = _$_Trips;

  factory _Trips.fromJson(Map<String, dynamic> json) = _$_Trips.fromJson;

  @override
  String get id;
  @override
  String get routeId;
  @override
  String get tripId;
  @override
  String get tripHeadsign;
  @override
  int get directionId;
  @override
  int get jpPatternId;
  @override
  @LatLngConverter()
  LatLng get startPosition;
  @override
  @LatLngConverter()
  LatLng get endPosition;
  @override
  @JsonKey(ignore: true)
  _$$_TripsCopyWith<_$_Trips> get copyWith =>
      throw _privateConstructorUsedError;
}
