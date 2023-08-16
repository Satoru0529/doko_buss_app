// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stop_times.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StopTimes _$StopTimesFromJson(Map<String, dynamic> json) {
  return _StopTimes.fromJson(json);
}

/// @nodoc
mixin _$StopTimes {
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StopTimesCopyWith<StopTimes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StopTimesCopyWith<$Res> {
  factory $StopTimesCopyWith(StopTimes value, $Res Function(StopTimes) then) =
      _$StopTimesCopyWithImpl<$Res, StopTimes>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$StopTimesCopyWithImpl<$Res, $Val extends StopTimes>
    implements $StopTimesCopyWith<$Res> {
  _$StopTimesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StopTimesCopyWith<$Res> implements $StopTimesCopyWith<$Res> {
  factory _$$_StopTimesCopyWith(
          _$_StopTimes value, $Res Function(_$_StopTimes) then) =
      __$$_StopTimesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_StopTimesCopyWithImpl<$Res>
    extends _$StopTimesCopyWithImpl<$Res, _$_StopTimes>
    implements _$$_StopTimesCopyWith<$Res> {
  __$$_StopTimesCopyWithImpl(
      _$_StopTimes _value, $Res Function(_$_StopTimes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_StopTimes(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StopTimes with DiagnosticableTreeMixin implements _StopTimes {
  const _$_StopTimes({required this.id});

  factory _$_StopTimes.fromJson(Map<String, dynamic> json) =>
      _$$_StopTimesFromJson(json);

  @override
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StopTimes(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StopTimes'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StopTimes &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StopTimesCopyWith<_$_StopTimes> get copyWith =>
      __$$_StopTimesCopyWithImpl<_$_StopTimes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StopTimesToJson(
      this,
    );
  }
}

abstract class _StopTimes implements StopTimes {
  const factory _StopTimes({required final String id}) = _$_StopTimes;

  factory _StopTimes.fromJson(Map<String, dynamic> json) =
      _$_StopTimes.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_StopTimesCopyWith<_$_StopTimes> get copyWith =>
      throw _privateConstructorUsedError;
}
