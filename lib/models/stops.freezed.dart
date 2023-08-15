// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stops.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Stops _$StopsFromJson(Map<String, dynamic> json) {
  return _Stops.fromJson(json);
}

/// @nodoc
mixin _$Stops {
  String get stopId => throw _privateConstructorUsedError; // 1
  String get stopName => throw _privateConstructorUsedError; // 3
  String get stopLat => throw _privateConstructorUsedError; // 5
  String get stopLon => throw _privateConstructorUsedError; // 6
  String get zoneId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StopsCopyWith<Stops> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StopsCopyWith<$Res> {
  factory $StopsCopyWith(Stops value, $Res Function(Stops) then) =
      _$StopsCopyWithImpl<$Res, Stops>;
  @useResult
  $Res call(
      {String stopId,
      String stopName,
      String stopLat,
      String stopLon,
      String zoneId});
}

/// @nodoc
class _$StopsCopyWithImpl<$Res, $Val extends Stops>
    implements $StopsCopyWith<$Res> {
  _$StopsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopId = null,
    Object? stopName = null,
    Object? stopLat = null,
    Object? stopLon = null,
    Object? zoneId = null,
  }) {
    return _then(_value.copyWith(
      stopId: null == stopId
          ? _value.stopId
          : stopId // ignore: cast_nullable_to_non_nullable
              as String,
      stopName: null == stopName
          ? _value.stopName
          : stopName // ignore: cast_nullable_to_non_nullable
              as String,
      stopLat: null == stopLat
          ? _value.stopLat
          : stopLat // ignore: cast_nullable_to_non_nullable
              as String,
      stopLon: null == stopLon
          ? _value.stopLon
          : stopLon // ignore: cast_nullable_to_non_nullable
              as String,
      zoneId: null == zoneId
          ? _value.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StopsCopyWith<$Res> implements $StopsCopyWith<$Res> {
  factory _$$_StopsCopyWith(_$_Stops value, $Res Function(_$_Stops) then) =
      __$$_StopsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stopId,
      String stopName,
      String stopLat,
      String stopLon,
      String zoneId});
}

/// @nodoc
class __$$_StopsCopyWithImpl<$Res> extends _$StopsCopyWithImpl<$Res, _$_Stops>
    implements _$$_StopsCopyWith<$Res> {
  __$$_StopsCopyWithImpl(_$_Stops _value, $Res Function(_$_Stops) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopId = null,
    Object? stopName = null,
    Object? stopLat = null,
    Object? stopLon = null,
    Object? zoneId = null,
  }) {
    return _then(_$_Stops(
      stopId: null == stopId
          ? _value.stopId
          : stopId // ignore: cast_nullable_to_non_nullable
              as String,
      stopName: null == stopName
          ? _value.stopName
          : stopName // ignore: cast_nullable_to_non_nullable
              as String,
      stopLat: null == stopLat
          ? _value.stopLat
          : stopLat // ignore: cast_nullable_to_non_nullable
              as String,
      stopLon: null == stopLon
          ? _value.stopLon
          : stopLon // ignore: cast_nullable_to_non_nullable
              as String,
      zoneId: null == zoneId
          ? _value.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Stops implements _Stops {
  const _$_Stops(
      {this.stopId = '',
      this.stopName = '',
      this.stopLat = '',
      this.stopLon = '',
      this.zoneId = ''});

  factory _$_Stops.fromJson(Map<String, dynamic> json) =>
      _$$_StopsFromJson(json);

  @override
  @JsonKey()
  final String stopId;
// 1
  @override
  @JsonKey()
  final String stopName;
// 3
  @override
  @JsonKey()
  final String stopLat;
// 5
  @override
  @JsonKey()
  final String stopLon;
// 6
  @override
  @JsonKey()
  final String zoneId;

  @override
  String toString() {
    return 'Stops(stopId: $stopId, stopName: $stopName, stopLat: $stopLat, stopLon: $stopLon, zoneId: $zoneId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Stops &&
            (identical(other.stopId, stopId) || other.stopId == stopId) &&
            (identical(other.stopName, stopName) ||
                other.stopName == stopName) &&
            (identical(other.stopLat, stopLat) || other.stopLat == stopLat) &&
            (identical(other.stopLon, stopLon) || other.stopLon == stopLon) &&
            (identical(other.zoneId, zoneId) || other.zoneId == zoneId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, stopId, stopName, stopLat, stopLon, zoneId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StopsCopyWith<_$_Stops> get copyWith =>
      __$$_StopsCopyWithImpl<_$_Stops>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StopsToJson(
      this,
    );
  }
}

abstract class _Stops implements Stops {
  const factory _Stops(
      {final String stopId,
      final String stopName,
      final String stopLat,
      final String stopLon,
      final String zoneId}) = _$_Stops;

  factory _Stops.fromJson(Map<String, dynamic> json) = _$_Stops.fromJson;

  @override
  String get stopId;
  @override // 1
  String get stopName;
  @override // 3
  String get stopLat;
  @override // 5
  String get stopLon;
  @override // 6
  String get zoneId;
  @override
  @JsonKey(ignore: true)
  _$$_StopsCopyWith<_$_Stops> get copyWith =>
      throw _privateConstructorUsedError;
}
