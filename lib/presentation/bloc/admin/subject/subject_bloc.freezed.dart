// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubjectEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadSubjects,
    required TResult Function(String subjectId) getSubjectDetail,
    required TResult Function(Map<String, dynamic> data) createSubject,
    required TResult Function(String subjectId, Map<String, dynamic> data)
        updateSubject,
    required TResult Function(String subjectId) deleteSubject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadSubjects,
    TResult? Function(String subjectId)? getSubjectDetail,
    TResult? Function(Map<String, dynamic> data)? createSubject,
    TResult? Function(String subjectId, Map<String, dynamic> data)?
        updateSubject,
    TResult? Function(String subjectId)? deleteSubject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadSubjects,
    TResult Function(String subjectId)? getSubjectDetail,
    TResult Function(Map<String, dynamic> data)? createSubject,
    TResult Function(String subjectId, Map<String, dynamic> data)?
        updateSubject,
    TResult Function(String subjectId)? deleteSubject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadSubjects value) loadSubjects,
    required TResult Function(_GetSubjectDetail value) getSubjectDetail,
    required TResult Function(_CreateSubject value) createSubject,
    required TResult Function(_UpdateSubject value) updateSubject,
    required TResult Function(_DeleteSubject value) deleteSubject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadSubjects value)? loadSubjects,
    TResult? Function(_GetSubjectDetail value)? getSubjectDetail,
    TResult? Function(_CreateSubject value)? createSubject,
    TResult? Function(_UpdateSubject value)? updateSubject,
    TResult? Function(_DeleteSubject value)? deleteSubject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadSubjects value)? loadSubjects,
    TResult Function(_GetSubjectDetail value)? getSubjectDetail,
    TResult Function(_CreateSubject value)? createSubject,
    TResult Function(_UpdateSubject value)? updateSubject,
    TResult Function(_DeleteSubject value)? deleteSubject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectEventCopyWith<$Res> {
  factory $SubjectEventCopyWith(
          SubjectEvent value, $Res Function(SubjectEvent) then) =
      _$SubjectEventCopyWithImpl<$Res, SubjectEvent>;
}

/// @nodoc
class _$SubjectEventCopyWithImpl<$Res, $Val extends SubjectEvent>
    implements $SubjectEventCopyWith<$Res> {
  _$SubjectEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubjectEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadSubjectsImplCopyWith<$Res> {
  factory _$$LoadSubjectsImplCopyWith(
          _$LoadSubjectsImpl value, $Res Function(_$LoadSubjectsImpl) then) =
      __$$LoadSubjectsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadSubjectsImplCopyWithImpl<$Res>
    extends _$SubjectEventCopyWithImpl<$Res, _$LoadSubjectsImpl>
    implements _$$LoadSubjectsImplCopyWith<$Res> {
  __$$LoadSubjectsImplCopyWithImpl(
      _$LoadSubjectsImpl _value, $Res Function(_$LoadSubjectsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadSubjectsImpl implements _LoadSubjects {
  const _$LoadSubjectsImpl();

  @override
  String toString() {
    return 'SubjectEvent.loadSubjects()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadSubjectsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadSubjects,
    required TResult Function(String subjectId) getSubjectDetail,
    required TResult Function(Map<String, dynamic> data) createSubject,
    required TResult Function(String subjectId, Map<String, dynamic> data)
        updateSubject,
    required TResult Function(String subjectId) deleteSubject,
  }) {
    return loadSubjects();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadSubjects,
    TResult? Function(String subjectId)? getSubjectDetail,
    TResult? Function(Map<String, dynamic> data)? createSubject,
    TResult? Function(String subjectId, Map<String, dynamic> data)?
        updateSubject,
    TResult? Function(String subjectId)? deleteSubject,
  }) {
    return loadSubjects?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadSubjects,
    TResult Function(String subjectId)? getSubjectDetail,
    TResult Function(Map<String, dynamic> data)? createSubject,
    TResult Function(String subjectId, Map<String, dynamic> data)?
        updateSubject,
    TResult Function(String subjectId)? deleteSubject,
    required TResult orElse(),
  }) {
    if (loadSubjects != null) {
      return loadSubjects();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadSubjects value) loadSubjects,
    required TResult Function(_GetSubjectDetail value) getSubjectDetail,
    required TResult Function(_CreateSubject value) createSubject,
    required TResult Function(_UpdateSubject value) updateSubject,
    required TResult Function(_DeleteSubject value) deleteSubject,
  }) {
    return loadSubjects(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadSubjects value)? loadSubjects,
    TResult? Function(_GetSubjectDetail value)? getSubjectDetail,
    TResult? Function(_CreateSubject value)? createSubject,
    TResult? Function(_UpdateSubject value)? updateSubject,
    TResult? Function(_DeleteSubject value)? deleteSubject,
  }) {
    return loadSubjects?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadSubjects value)? loadSubjects,
    TResult Function(_GetSubjectDetail value)? getSubjectDetail,
    TResult Function(_CreateSubject value)? createSubject,
    TResult Function(_UpdateSubject value)? updateSubject,
    TResult Function(_DeleteSubject value)? deleteSubject,
    required TResult orElse(),
  }) {
    if (loadSubjects != null) {
      return loadSubjects(this);
    }
    return orElse();
  }
}

abstract class _LoadSubjects implements SubjectEvent {
  const factory _LoadSubjects() = _$LoadSubjectsImpl;
}

/// @nodoc
abstract class _$$GetSubjectDetailImplCopyWith<$Res> {
  factory _$$GetSubjectDetailImplCopyWith(_$GetSubjectDetailImpl value,
          $Res Function(_$GetSubjectDetailImpl) then) =
      __$$GetSubjectDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String subjectId});
}

/// @nodoc
class __$$GetSubjectDetailImplCopyWithImpl<$Res>
    extends _$SubjectEventCopyWithImpl<$Res, _$GetSubjectDetailImpl>
    implements _$$GetSubjectDetailImplCopyWith<$Res> {
  __$$GetSubjectDetailImplCopyWithImpl(_$GetSubjectDetailImpl _value,
      $Res Function(_$GetSubjectDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectId = null,
  }) {
    return _then(_$GetSubjectDetailImpl(
      null == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetSubjectDetailImpl implements _GetSubjectDetail {
  const _$GetSubjectDetailImpl(this.subjectId);

  @override
  final String subjectId;

  @override
  String toString() {
    return 'SubjectEvent.getSubjectDetail(subjectId: $subjectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSubjectDetailImpl &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subjectId);

  /// Create a copy of SubjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSubjectDetailImplCopyWith<_$GetSubjectDetailImpl> get copyWith =>
      __$$GetSubjectDetailImplCopyWithImpl<_$GetSubjectDetailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadSubjects,
    required TResult Function(String subjectId) getSubjectDetail,
    required TResult Function(Map<String, dynamic> data) createSubject,
    required TResult Function(String subjectId, Map<String, dynamic> data)
        updateSubject,
    required TResult Function(String subjectId) deleteSubject,
  }) {
    return getSubjectDetail(subjectId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadSubjects,
    TResult? Function(String subjectId)? getSubjectDetail,
    TResult? Function(Map<String, dynamic> data)? createSubject,
    TResult? Function(String subjectId, Map<String, dynamic> data)?
        updateSubject,
    TResult? Function(String subjectId)? deleteSubject,
  }) {
    return getSubjectDetail?.call(subjectId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadSubjects,
    TResult Function(String subjectId)? getSubjectDetail,
    TResult Function(Map<String, dynamic> data)? createSubject,
    TResult Function(String subjectId, Map<String, dynamic> data)?
        updateSubject,
    TResult Function(String subjectId)? deleteSubject,
    required TResult orElse(),
  }) {
    if (getSubjectDetail != null) {
      return getSubjectDetail(subjectId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadSubjects value) loadSubjects,
    required TResult Function(_GetSubjectDetail value) getSubjectDetail,
    required TResult Function(_CreateSubject value) createSubject,
    required TResult Function(_UpdateSubject value) updateSubject,
    required TResult Function(_DeleteSubject value) deleteSubject,
  }) {
    return getSubjectDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadSubjects value)? loadSubjects,
    TResult? Function(_GetSubjectDetail value)? getSubjectDetail,
    TResult? Function(_CreateSubject value)? createSubject,
    TResult? Function(_UpdateSubject value)? updateSubject,
    TResult? Function(_DeleteSubject value)? deleteSubject,
  }) {
    return getSubjectDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadSubjects value)? loadSubjects,
    TResult Function(_GetSubjectDetail value)? getSubjectDetail,
    TResult Function(_CreateSubject value)? createSubject,
    TResult Function(_UpdateSubject value)? updateSubject,
    TResult Function(_DeleteSubject value)? deleteSubject,
    required TResult orElse(),
  }) {
    if (getSubjectDetail != null) {
      return getSubjectDetail(this);
    }
    return orElse();
  }
}

abstract class _GetSubjectDetail implements SubjectEvent {
  const factory _GetSubjectDetail(final String subjectId) =
      _$GetSubjectDetailImpl;

  String get subjectId;

  /// Create a copy of SubjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetSubjectDetailImplCopyWith<_$GetSubjectDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateSubjectImplCopyWith<$Res> {
  factory _$$CreateSubjectImplCopyWith(
          _$CreateSubjectImpl value, $Res Function(_$CreateSubjectImpl) then) =
      __$$CreateSubjectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$CreateSubjectImplCopyWithImpl<$Res>
    extends _$SubjectEventCopyWithImpl<$Res, _$CreateSubjectImpl>
    implements _$$CreateSubjectImplCopyWith<$Res> {
  __$$CreateSubjectImplCopyWithImpl(
      _$CreateSubjectImpl _value, $Res Function(_$CreateSubjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$CreateSubjectImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$CreateSubjectImpl implements _CreateSubject {
  const _$CreateSubjectImpl(final Map<String, dynamic> data) : _data = data;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'SubjectEvent.createSubject(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSubjectImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of SubjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSubjectImplCopyWith<_$CreateSubjectImpl> get copyWith =>
      __$$CreateSubjectImplCopyWithImpl<_$CreateSubjectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadSubjects,
    required TResult Function(String subjectId) getSubjectDetail,
    required TResult Function(Map<String, dynamic> data) createSubject,
    required TResult Function(String subjectId, Map<String, dynamic> data)
        updateSubject,
    required TResult Function(String subjectId) deleteSubject,
  }) {
    return createSubject(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadSubjects,
    TResult? Function(String subjectId)? getSubjectDetail,
    TResult? Function(Map<String, dynamic> data)? createSubject,
    TResult? Function(String subjectId, Map<String, dynamic> data)?
        updateSubject,
    TResult? Function(String subjectId)? deleteSubject,
  }) {
    return createSubject?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadSubjects,
    TResult Function(String subjectId)? getSubjectDetail,
    TResult Function(Map<String, dynamic> data)? createSubject,
    TResult Function(String subjectId, Map<String, dynamic> data)?
        updateSubject,
    TResult Function(String subjectId)? deleteSubject,
    required TResult orElse(),
  }) {
    if (createSubject != null) {
      return createSubject(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadSubjects value) loadSubjects,
    required TResult Function(_GetSubjectDetail value) getSubjectDetail,
    required TResult Function(_CreateSubject value) createSubject,
    required TResult Function(_UpdateSubject value) updateSubject,
    required TResult Function(_DeleteSubject value) deleteSubject,
  }) {
    return createSubject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadSubjects value)? loadSubjects,
    TResult? Function(_GetSubjectDetail value)? getSubjectDetail,
    TResult? Function(_CreateSubject value)? createSubject,
    TResult? Function(_UpdateSubject value)? updateSubject,
    TResult? Function(_DeleteSubject value)? deleteSubject,
  }) {
    return createSubject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadSubjects value)? loadSubjects,
    TResult Function(_GetSubjectDetail value)? getSubjectDetail,
    TResult Function(_CreateSubject value)? createSubject,
    TResult Function(_UpdateSubject value)? updateSubject,
    TResult Function(_DeleteSubject value)? deleteSubject,
    required TResult orElse(),
  }) {
    if (createSubject != null) {
      return createSubject(this);
    }
    return orElse();
  }
}

abstract class _CreateSubject implements SubjectEvent {
  const factory _CreateSubject(final Map<String, dynamic> data) =
      _$CreateSubjectImpl;

  Map<String, dynamic> get data;

  /// Create a copy of SubjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateSubjectImplCopyWith<_$CreateSubjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateSubjectImplCopyWith<$Res> {
  factory _$$UpdateSubjectImplCopyWith(
          _$UpdateSubjectImpl value, $Res Function(_$UpdateSubjectImpl) then) =
      __$$UpdateSubjectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String subjectId, Map<String, dynamic> data});
}

/// @nodoc
class __$$UpdateSubjectImplCopyWithImpl<$Res>
    extends _$SubjectEventCopyWithImpl<$Res, _$UpdateSubjectImpl>
    implements _$$UpdateSubjectImplCopyWith<$Res> {
  __$$UpdateSubjectImplCopyWithImpl(
      _$UpdateSubjectImpl _value, $Res Function(_$UpdateSubjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectId = null,
    Object? data = null,
  }) {
    return _then(_$UpdateSubjectImpl(
      subjectId: null == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$UpdateSubjectImpl implements _UpdateSubject {
  const _$UpdateSubjectImpl(
      {required this.subjectId, required final Map<String, dynamic> data})
      : _data = data;

  @override
  final String subjectId;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'SubjectEvent.updateSubject(subjectId: $subjectId, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSubjectImpl &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, subjectId, const DeepCollectionEquality().hash(_data));

  /// Create a copy of SubjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSubjectImplCopyWith<_$UpdateSubjectImpl> get copyWith =>
      __$$UpdateSubjectImplCopyWithImpl<_$UpdateSubjectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadSubjects,
    required TResult Function(String subjectId) getSubjectDetail,
    required TResult Function(Map<String, dynamic> data) createSubject,
    required TResult Function(String subjectId, Map<String, dynamic> data)
        updateSubject,
    required TResult Function(String subjectId) deleteSubject,
  }) {
    return updateSubject(subjectId, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadSubjects,
    TResult? Function(String subjectId)? getSubjectDetail,
    TResult? Function(Map<String, dynamic> data)? createSubject,
    TResult? Function(String subjectId, Map<String, dynamic> data)?
        updateSubject,
    TResult? Function(String subjectId)? deleteSubject,
  }) {
    return updateSubject?.call(subjectId, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadSubjects,
    TResult Function(String subjectId)? getSubjectDetail,
    TResult Function(Map<String, dynamic> data)? createSubject,
    TResult Function(String subjectId, Map<String, dynamic> data)?
        updateSubject,
    TResult Function(String subjectId)? deleteSubject,
    required TResult orElse(),
  }) {
    if (updateSubject != null) {
      return updateSubject(subjectId, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadSubjects value) loadSubjects,
    required TResult Function(_GetSubjectDetail value) getSubjectDetail,
    required TResult Function(_CreateSubject value) createSubject,
    required TResult Function(_UpdateSubject value) updateSubject,
    required TResult Function(_DeleteSubject value) deleteSubject,
  }) {
    return updateSubject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadSubjects value)? loadSubjects,
    TResult? Function(_GetSubjectDetail value)? getSubjectDetail,
    TResult? Function(_CreateSubject value)? createSubject,
    TResult? Function(_UpdateSubject value)? updateSubject,
    TResult? Function(_DeleteSubject value)? deleteSubject,
  }) {
    return updateSubject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadSubjects value)? loadSubjects,
    TResult Function(_GetSubjectDetail value)? getSubjectDetail,
    TResult Function(_CreateSubject value)? createSubject,
    TResult Function(_UpdateSubject value)? updateSubject,
    TResult Function(_DeleteSubject value)? deleteSubject,
    required TResult orElse(),
  }) {
    if (updateSubject != null) {
      return updateSubject(this);
    }
    return orElse();
  }
}

abstract class _UpdateSubject implements SubjectEvent {
  const factory _UpdateSubject(
      {required final String subjectId,
      required final Map<String, dynamic> data}) = _$UpdateSubjectImpl;

  String get subjectId;
  Map<String, dynamic> get data;

  /// Create a copy of SubjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSubjectImplCopyWith<_$UpdateSubjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteSubjectImplCopyWith<$Res> {
  factory _$$DeleteSubjectImplCopyWith(
          _$DeleteSubjectImpl value, $Res Function(_$DeleteSubjectImpl) then) =
      __$$DeleteSubjectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String subjectId});
}

/// @nodoc
class __$$DeleteSubjectImplCopyWithImpl<$Res>
    extends _$SubjectEventCopyWithImpl<$Res, _$DeleteSubjectImpl>
    implements _$$DeleteSubjectImplCopyWith<$Res> {
  __$$DeleteSubjectImplCopyWithImpl(
      _$DeleteSubjectImpl _value, $Res Function(_$DeleteSubjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectId = null,
  }) {
    return _then(_$DeleteSubjectImpl(
      null == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteSubjectImpl implements _DeleteSubject {
  const _$DeleteSubjectImpl(this.subjectId);

  @override
  final String subjectId;

  @override
  String toString() {
    return 'SubjectEvent.deleteSubject(subjectId: $subjectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteSubjectImpl &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subjectId);

  /// Create a copy of SubjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteSubjectImplCopyWith<_$DeleteSubjectImpl> get copyWith =>
      __$$DeleteSubjectImplCopyWithImpl<_$DeleteSubjectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadSubjects,
    required TResult Function(String subjectId) getSubjectDetail,
    required TResult Function(Map<String, dynamic> data) createSubject,
    required TResult Function(String subjectId, Map<String, dynamic> data)
        updateSubject,
    required TResult Function(String subjectId) deleteSubject,
  }) {
    return deleteSubject(subjectId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadSubjects,
    TResult? Function(String subjectId)? getSubjectDetail,
    TResult? Function(Map<String, dynamic> data)? createSubject,
    TResult? Function(String subjectId, Map<String, dynamic> data)?
        updateSubject,
    TResult? Function(String subjectId)? deleteSubject,
  }) {
    return deleteSubject?.call(subjectId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadSubjects,
    TResult Function(String subjectId)? getSubjectDetail,
    TResult Function(Map<String, dynamic> data)? createSubject,
    TResult Function(String subjectId, Map<String, dynamic> data)?
        updateSubject,
    TResult Function(String subjectId)? deleteSubject,
    required TResult orElse(),
  }) {
    if (deleteSubject != null) {
      return deleteSubject(subjectId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadSubjects value) loadSubjects,
    required TResult Function(_GetSubjectDetail value) getSubjectDetail,
    required TResult Function(_CreateSubject value) createSubject,
    required TResult Function(_UpdateSubject value) updateSubject,
    required TResult Function(_DeleteSubject value) deleteSubject,
  }) {
    return deleteSubject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadSubjects value)? loadSubjects,
    TResult? Function(_GetSubjectDetail value)? getSubjectDetail,
    TResult? Function(_CreateSubject value)? createSubject,
    TResult? Function(_UpdateSubject value)? updateSubject,
    TResult? Function(_DeleteSubject value)? deleteSubject,
  }) {
    return deleteSubject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadSubjects value)? loadSubjects,
    TResult Function(_GetSubjectDetail value)? getSubjectDetail,
    TResult Function(_CreateSubject value)? createSubject,
    TResult Function(_UpdateSubject value)? updateSubject,
    TResult Function(_DeleteSubject value)? deleteSubject,
    required TResult orElse(),
  }) {
    if (deleteSubject != null) {
      return deleteSubject(this);
    }
    return orElse();
  }
}

abstract class _DeleteSubject implements SubjectEvent {
  const factory _DeleteSubject(final String subjectId) = _$DeleteSubjectImpl;

  String get subjectId;

  /// Create a copy of SubjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteSubjectImplCopyWith<_$DeleteSubjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SubjectState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SubjectModel> subjects) loaded,
    required TResult Function(SubjectModel subject) detailLoaded,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubjectModel> subjects)? loaded,
    TResult? Function(SubjectModel subject)? detailLoaded,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubjectModel> subjects)? loaded,
    TResult Function(SubjectModel subject)? detailLoaded,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectStateCopyWith<$Res> {
  factory $SubjectStateCopyWith(
          SubjectState value, $Res Function(SubjectState) then) =
      _$SubjectStateCopyWithImpl<$Res, SubjectState>;
}

/// @nodoc
class _$SubjectStateCopyWithImpl<$Res, $Val extends SubjectState>
    implements $SubjectStateCopyWith<$Res> {
  _$SubjectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubjectState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SubjectStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SubjectState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SubjectModel> subjects) loaded,
    required TResult Function(SubjectModel subject) detailLoaded,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubjectModel> subjects)? loaded,
    TResult? Function(SubjectModel subject)? detailLoaded,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubjectModel> subjects)? loaded,
    TResult Function(SubjectModel subject)? detailLoaded,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SubjectState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SubjectStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SubjectState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SubjectModel> subjects) loaded,
    required TResult Function(SubjectModel subject) detailLoaded,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubjectModel> subjects)? loaded,
    TResult? Function(SubjectModel subject)? detailLoaded,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubjectModel> subjects)? loaded,
    TResult Function(SubjectModel subject)? detailLoaded,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SubjectState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SubjectModel> subjects});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$SubjectStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjects = null,
  }) {
    return _then(_$LoadedImpl(
      null == subjects
          ? _value._subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<SubjectModel>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<SubjectModel> subjects) : _subjects = subjects;

  final List<SubjectModel> _subjects;
  @override
  List<SubjectModel> get subjects {
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subjects);
  }

  @override
  String toString() {
    return 'SubjectState.loaded(subjects: $subjects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._subjects, _subjects));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_subjects));

  /// Create a copy of SubjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SubjectModel> subjects) loaded,
    required TResult Function(SubjectModel subject) detailLoaded,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return loaded(subjects);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubjectModel> subjects)? loaded,
    TResult? Function(SubjectModel subject)? detailLoaded,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(subjects);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubjectModel> subjects)? loaded,
    TResult Function(SubjectModel subject)? detailLoaded,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(subjects);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements SubjectState {
  const factory _Loaded(final List<SubjectModel> subjects) = _$LoadedImpl;

  List<SubjectModel> get subjects;

  /// Create a copy of SubjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailLoadedImplCopyWith<$Res> {
  factory _$$DetailLoadedImplCopyWith(
          _$DetailLoadedImpl value, $Res Function(_$DetailLoadedImpl) then) =
      __$$DetailLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SubjectModel subject});
}

/// @nodoc
class __$$DetailLoadedImplCopyWithImpl<$Res>
    extends _$SubjectStateCopyWithImpl<$Res, _$DetailLoadedImpl>
    implements _$$DetailLoadedImplCopyWith<$Res> {
  __$$DetailLoadedImplCopyWithImpl(
      _$DetailLoadedImpl _value, $Res Function(_$DetailLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
  }) {
    return _then(_$DetailLoadedImpl(
      null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as SubjectModel,
    ));
  }
}

/// @nodoc

class _$DetailLoadedImpl implements _DetailLoaded {
  const _$DetailLoadedImpl(this.subject);

  @override
  final SubjectModel subject;

  @override
  String toString() {
    return 'SubjectState.detailLoaded(subject: $subject)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailLoadedImpl &&
            (identical(other.subject, subject) || other.subject == subject));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subject);

  /// Create a copy of SubjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailLoadedImplCopyWith<_$DetailLoadedImpl> get copyWith =>
      __$$DetailLoadedImplCopyWithImpl<_$DetailLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SubjectModel> subjects) loaded,
    required TResult Function(SubjectModel subject) detailLoaded,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return detailLoaded(subject);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubjectModel> subjects)? loaded,
    TResult? Function(SubjectModel subject)? detailLoaded,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return detailLoaded?.call(subject);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubjectModel> subjects)? loaded,
    TResult Function(SubjectModel subject)? detailLoaded,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (detailLoaded != null) {
      return detailLoaded(subject);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return detailLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return detailLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (detailLoaded != null) {
      return detailLoaded(this);
    }
    return orElse();
  }
}

abstract class _DetailLoaded implements SubjectState {
  const factory _DetailLoaded(final SubjectModel subject) = _$DetailLoadedImpl;

  SubjectModel get subject;

  /// Create a copy of SubjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailLoadedImplCopyWith<_$DetailLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$SubjectStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SuccessImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SubjectState.success(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of SubjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SubjectModel> subjects) loaded,
    required TResult Function(SubjectModel subject) detailLoaded,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return success(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubjectModel> subjects)? loaded,
    TResult? Function(SubjectModel subject)? detailLoaded,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubjectModel> subjects)? loaded,
    TResult Function(SubjectModel subject)? detailLoaded,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements SubjectState {
  const factory _Success(final String message) = _$SuccessImpl;

  String get message;

  /// Create a copy of SubjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$SubjectStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SubjectState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of SubjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SubjectModel> subjects) loaded,
    required TResult Function(SubjectModel subject) detailLoaded,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SubjectModel> subjects)? loaded,
    TResult? Function(SubjectModel subject)? detailLoaded,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SubjectModel> subjects)? loaded,
    TResult Function(SubjectModel subject)? detailLoaded,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SubjectState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of SubjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
