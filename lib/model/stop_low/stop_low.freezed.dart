// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stop_low.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StopLow _$StopLowFromJson(Map<String, dynamic> json) {
  return _StopLow.fromJson(json);
}

/// @nodoc
mixin _$StopLow {
  /// Doc ID
  String get id => throw _privateConstructorUsedError;

  /// num_1 or num_2 (上り or 下り)
  String get stopId => throw _privateConstructorUsedError;

  /// バス停名
  String get stopName => throw _privateConstructorUsedError;

  /// バス停の緯度
  double get stopLat => throw _privateConstructorUsedError;

  /// バス停の経度
  double get stopLon => throw _privateConstructorUsedError;

  /// バス停名の bi-gram
  Map<dynamic, dynamic> get biGramMap => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StopLowCopyWith<StopLow> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StopLowCopyWith<$Res> {
  factory $StopLowCopyWith(StopLow value, $Res Function(StopLow) then) =
      _$StopLowCopyWithImpl<$Res, StopLow>;
  @useResult
  $Res call(
      {String id,
      String stopId,
      String stopName,
      double stopLat,
      double stopLon,
      Map<dynamic, dynamic> biGramMap});
}

/// @nodoc
class _$StopLowCopyWithImpl<$Res, $Val extends StopLow>
    implements $StopLowCopyWith<$Res> {
  _$StopLowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stopId = null,
    Object? stopName = null,
    Object? stopLat = null,
    Object? stopLon = null,
    Object? biGramMap = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
              as double,
      stopLon: null == stopLon
          ? _value.stopLon
          : stopLon // ignore: cast_nullable_to_non_nullable
              as double,
      biGramMap: null == biGramMap
          ? _value.biGramMap
          : biGramMap // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StopLowCopyWith<$Res> implements $StopLowCopyWith<$Res> {
  factory _$$_StopLowCopyWith(
          _$_StopLow value, $Res Function(_$_StopLow) then) =
      __$$_StopLowCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String stopId,
      String stopName,
      double stopLat,
      double stopLon,
      Map<dynamic, dynamic> biGramMap});
}

/// @nodoc
class __$$_StopLowCopyWithImpl<$Res>
    extends _$StopLowCopyWithImpl<$Res, _$_StopLow>
    implements _$$_StopLowCopyWith<$Res> {
  __$$_StopLowCopyWithImpl(_$_StopLow _value, $Res Function(_$_StopLow) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stopId = null,
    Object? stopName = null,
    Object? stopLat = null,
    Object? stopLon = null,
    Object? biGramMap = null,
  }) {
    return _then(_$_StopLow(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
              as double,
      stopLon: null == stopLon
          ? _value.stopLon
          : stopLon // ignore: cast_nullable_to_non_nullable
              as double,
      biGramMap: null == biGramMap
          ? _value._biGramMap
          : biGramMap // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StopLow with DiagnosticableTreeMixin implements _StopLow {
  const _$_StopLow(
      {this.id = '',
      this.stopId = '',
      this.stopName = '',
      this.stopLat = 0,
      this.stopLon = 0,
      final Map<dynamic, dynamic> biGramMap = const {'': ''}})
      : _biGramMap = biGramMap;

  factory _$_StopLow.fromJson(Map<String, dynamic> json) =>
      _$$_StopLowFromJson(json);

  /// Doc ID
  @override
  @JsonKey()
  final String id;

  /// num_1 or num_2 (上り or 下り)
  @override
  @JsonKey()
  final String stopId;

  /// バス停名
  @override
  @JsonKey()
  final String stopName;

  /// バス停の緯度
  @override
  @JsonKey()
  final double stopLat;

  /// バス停の経度
  @override
  @JsonKey()
  final double stopLon;

  /// バス停名の bi-gram
  final Map<dynamic, dynamic> _biGramMap;

  /// バス停名の bi-gram
  @override
  @JsonKey()
  Map<dynamic, dynamic> get biGramMap {
    if (_biGramMap is EqualUnmodifiableMapView) return _biGramMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_biGramMap);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StopLow(id: $id, stopId: $stopId, stopName: $stopName, stopLat: $stopLat, stopLon: $stopLon, biGramMap: $biGramMap)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StopLow'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('stopId', stopId))
      ..add(DiagnosticsProperty('stopName', stopName))
      ..add(DiagnosticsProperty('stopLat', stopLat))
      ..add(DiagnosticsProperty('stopLon', stopLon))
      ..add(DiagnosticsProperty('biGramMap', biGramMap));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StopLow &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stopId, stopId) || other.stopId == stopId) &&
            (identical(other.stopName, stopName) ||
                other.stopName == stopName) &&
            (identical(other.stopLat, stopLat) || other.stopLat == stopLat) &&
            (identical(other.stopLon, stopLon) || other.stopLon == stopLon) &&
            const DeepCollectionEquality()
                .equals(other._biGramMap, _biGramMap));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, stopId, stopName, stopLat,
      stopLon, const DeepCollectionEquality().hash(_biGramMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StopLowCopyWith<_$_StopLow> get copyWith =>
      __$$_StopLowCopyWithImpl<_$_StopLow>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StopLowToJson(
      this,
    );
  }
}

abstract class _StopLow implements StopLow {
  const factory _StopLow(
      {final String id,
      final String stopId,
      final String stopName,
      final double stopLat,
      final double stopLon,
      final Map<dynamic, dynamic> biGramMap}) = _$_StopLow;

  factory _StopLow.fromJson(Map<String, dynamic> json) = _$_StopLow.fromJson;

  @override

  /// Doc ID
  String get id;
  @override

  /// num_1 or num_2 (上り or 下り)
  String get stopId;
  @override

  /// バス停名
  String get stopName;
  @override

  /// バス停の緯度
  double get stopLat;
  @override

  /// バス停の経度
  double get stopLon;
  @override

  /// バス停名の bi-gram
  Map<dynamic, dynamic> get biGramMap;
  @override
  @JsonKey(ignore: true)
  _$$_StopLowCopyWith<_$_StopLow> get copyWith =>
      throw _privateConstructorUsedError;
}
