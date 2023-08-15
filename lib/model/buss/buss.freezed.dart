// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buss.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Buss _$BussFromJson(Map<String, dynamic> json) {
  return _Buss.fromJson(json);
}

/// @nodoc
mixin _$Buss {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get stopLat => throw _privateConstructorUsedError;
  double get stopLon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BussCopyWith<Buss> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BussCopyWith<$Res> {
  factory $BussCopyWith(Buss value, $Res Function(Buss) then) =
      _$BussCopyWithImpl<$Res, Buss>;
  @useResult
  $Res call({String id, String name, double stopLat, double stopLon});
}

/// @nodoc
class _$BussCopyWithImpl<$Res, $Val extends Buss>
    implements $BussCopyWith<$Res> {
  _$BussCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? stopLat = null,
    Object? stopLon = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      stopLat: null == stopLat
          ? _value.stopLat
          : stopLat // ignore: cast_nullable_to_non_nullable
              as double,
      stopLon: null == stopLon
          ? _value.stopLon
          : stopLon // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BussCopyWith<$Res> implements $BussCopyWith<$Res> {
  factory _$$_BussCopyWith(_$_Buss value, $Res Function(_$_Buss) then) =
      __$$_BussCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, double stopLat, double stopLon});
}

/// @nodoc
class __$$_BussCopyWithImpl<$Res> extends _$BussCopyWithImpl<$Res, _$_Buss>
    implements _$$_BussCopyWith<$Res> {
  __$$_BussCopyWithImpl(_$_Buss _value, $Res Function(_$_Buss) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? stopLat = null,
    Object? stopLon = null,
  }) {
    return _then(_$_Buss(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      stopLat: null == stopLat
          ? _value.stopLat
          : stopLat // ignore: cast_nullable_to_non_nullable
              as double,
      stopLon: null == stopLon
          ? _value.stopLon
          : stopLon // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Buss with DiagnosticableTreeMixin implements _Buss {
  const _$_Buss(
      {this.id = '', this.name = '', this.stopLat = 0, this.stopLon = 0});

  factory _$_Buss.fromJson(Map<String, dynamic> json) => _$$_BussFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final double stopLat;
  @override
  @JsonKey()
  final double stopLon;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Buss(id: $id, name: $name, stopLat: $stopLat, stopLon: $stopLon)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Buss'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('stopLat', stopLat))
      ..add(DiagnosticsProperty('stopLon', stopLon));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Buss &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.stopLat, stopLat) || other.stopLat == stopLat) &&
            (identical(other.stopLon, stopLon) || other.stopLon == stopLon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, stopLat, stopLon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BussCopyWith<_$_Buss> get copyWith =>
      __$$_BussCopyWithImpl<_$_Buss>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BussToJson(
      this,
    );
  }
}

abstract class _Buss implements Buss {
  const factory _Buss(
      {final String id,
      final String name,
      final double stopLat,
      final double stopLon}) = _$_Buss;

  factory _Buss.fromJson(Map<String, dynamic> json) = _$_Buss.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get stopLat;
  @override
  double get stopLon;
  @override
  @JsonKey(ignore: true)
  _$$_BussCopyWith<_$_Buss> get copyWith => throw _privateConstructorUsedError;
}
