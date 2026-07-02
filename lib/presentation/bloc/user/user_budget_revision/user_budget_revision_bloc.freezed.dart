// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_budget_revision_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserBudgetRevisionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(StoreBudgetRevisionModel request) store,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(StoreBudgetRevisionModel request)? store,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? getAll,
    TResult Function(int id)? getDetail,
    TResult Function(StoreBudgetRevisionModel request)? store,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserBudgetRevisionGetAll value) getAll,
    required TResult Function(UserBudgetRevisionGetDetail value) getDetail,
    required TResult Function(UserBudgetRevisionStore value) store,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserBudgetRevisionGetAll value)? getAll,
    TResult? Function(UserBudgetRevisionGetDetail value)? getDetail,
    TResult? Function(UserBudgetRevisionStore value)? store,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserBudgetRevisionGetAll value)? getAll,
    TResult Function(UserBudgetRevisionGetDetail value)? getDetail,
    TResult Function(UserBudgetRevisionStore value)? store,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBudgetRevisionEventCopyWith<$Res> {
  factory $UserBudgetRevisionEventCopyWith(UserBudgetRevisionEvent value,
          $Res Function(UserBudgetRevisionEvent) then) =
      _$UserBudgetRevisionEventCopyWithImpl<$Res, UserBudgetRevisionEvent>;
}

/// @nodoc
class _$UserBudgetRevisionEventCopyWithImpl<$Res,
        $Val extends UserBudgetRevisionEvent>
    implements $UserBudgetRevisionEventCopyWith<$Res> {
  _$UserBudgetRevisionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UserBudgetRevisionGetAllImplCopyWith<$Res> {
  factory _$$UserBudgetRevisionGetAllImplCopyWith(
          _$UserBudgetRevisionGetAllImpl value,
          $Res Function(_$UserBudgetRevisionGetAllImpl) then) =
      __$$UserBudgetRevisionGetAllImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, String? status});
}

/// @nodoc
class __$$UserBudgetRevisionGetAllImplCopyWithImpl<$Res>
    extends _$UserBudgetRevisionEventCopyWithImpl<$Res,
        _$UserBudgetRevisionGetAllImpl>
    implements _$$UserBudgetRevisionGetAllImplCopyWith<$Res> {
  __$$UserBudgetRevisionGetAllImplCopyWithImpl(
      _$UserBudgetRevisionGetAllImpl _value,
      $Res Function(_$UserBudgetRevisionGetAllImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? status = freezed,
  }) {
    return _then(_$UserBudgetRevisionGetAllImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserBudgetRevisionGetAllImpl implements UserBudgetRevisionGetAll {
  const _$UserBudgetRevisionGetAllImpl({this.page = 1, this.status});

  @override
  @JsonKey()
  final int page;
  @override
  final String? status;

  @override
  String toString() {
    return 'UserBudgetRevisionEvent.getAll(page: $page, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBudgetRevisionGetAllImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, status);

  /// Create a copy of UserBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBudgetRevisionGetAllImplCopyWith<_$UserBudgetRevisionGetAllImpl>
      get copyWith => __$$UserBudgetRevisionGetAllImplCopyWithImpl<
          _$UserBudgetRevisionGetAllImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(StoreBudgetRevisionModel request) store,
  }) {
    return getAll(page, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(StoreBudgetRevisionModel request)? store,
  }) {
    return getAll?.call(page, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? getAll,
    TResult Function(int id)? getDetail,
    TResult Function(StoreBudgetRevisionModel request)? store,
    required TResult orElse(),
  }) {
    if (getAll != null) {
      return getAll(page, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserBudgetRevisionGetAll value) getAll,
    required TResult Function(UserBudgetRevisionGetDetail value) getDetail,
    required TResult Function(UserBudgetRevisionStore value) store,
  }) {
    return getAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserBudgetRevisionGetAll value)? getAll,
    TResult? Function(UserBudgetRevisionGetDetail value)? getDetail,
    TResult? Function(UserBudgetRevisionStore value)? store,
  }) {
    return getAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserBudgetRevisionGetAll value)? getAll,
    TResult Function(UserBudgetRevisionGetDetail value)? getDetail,
    TResult Function(UserBudgetRevisionStore value)? store,
    required TResult orElse(),
  }) {
    if (getAll != null) {
      return getAll(this);
    }
    return orElse();
  }
}

abstract class UserBudgetRevisionGetAll implements UserBudgetRevisionEvent {
  const factory UserBudgetRevisionGetAll(
      {final int page, final String? status}) = _$UserBudgetRevisionGetAllImpl;

  int get page;
  String? get status;

  /// Create a copy of UserBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBudgetRevisionGetAllImplCopyWith<_$UserBudgetRevisionGetAllImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserBudgetRevisionGetDetailImplCopyWith<$Res> {
  factory _$$UserBudgetRevisionGetDetailImplCopyWith(
          _$UserBudgetRevisionGetDetailImpl value,
          $Res Function(_$UserBudgetRevisionGetDetailImpl) then) =
      __$$UserBudgetRevisionGetDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$UserBudgetRevisionGetDetailImplCopyWithImpl<$Res>
    extends _$UserBudgetRevisionEventCopyWithImpl<$Res,
        _$UserBudgetRevisionGetDetailImpl>
    implements _$$UserBudgetRevisionGetDetailImplCopyWith<$Res> {
  __$$UserBudgetRevisionGetDetailImplCopyWithImpl(
      _$UserBudgetRevisionGetDetailImpl _value,
      $Res Function(_$UserBudgetRevisionGetDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$UserBudgetRevisionGetDetailImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UserBudgetRevisionGetDetailImpl implements UserBudgetRevisionGetDetail {
  const _$UserBudgetRevisionGetDetailImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'UserBudgetRevisionEvent.getDetail(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBudgetRevisionGetDetailImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of UserBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBudgetRevisionGetDetailImplCopyWith<_$UserBudgetRevisionGetDetailImpl>
      get copyWith => __$$UserBudgetRevisionGetDetailImplCopyWithImpl<
          _$UserBudgetRevisionGetDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(StoreBudgetRevisionModel request) store,
  }) {
    return getDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(StoreBudgetRevisionModel request)? store,
  }) {
    return getDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? getAll,
    TResult Function(int id)? getDetail,
    TResult Function(StoreBudgetRevisionModel request)? store,
    required TResult orElse(),
  }) {
    if (getDetail != null) {
      return getDetail(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserBudgetRevisionGetAll value) getAll,
    required TResult Function(UserBudgetRevisionGetDetail value) getDetail,
    required TResult Function(UserBudgetRevisionStore value) store,
  }) {
    return getDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserBudgetRevisionGetAll value)? getAll,
    TResult? Function(UserBudgetRevisionGetDetail value)? getDetail,
    TResult? Function(UserBudgetRevisionStore value)? store,
  }) {
    return getDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserBudgetRevisionGetAll value)? getAll,
    TResult Function(UserBudgetRevisionGetDetail value)? getDetail,
    TResult Function(UserBudgetRevisionStore value)? store,
    required TResult orElse(),
  }) {
    if (getDetail != null) {
      return getDetail(this);
    }
    return orElse();
  }
}

abstract class UserBudgetRevisionGetDetail implements UserBudgetRevisionEvent {
  const factory UserBudgetRevisionGetDetail(final int id) =
      _$UserBudgetRevisionGetDetailImpl;

  int get id;

  /// Create a copy of UserBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBudgetRevisionGetDetailImplCopyWith<_$UserBudgetRevisionGetDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserBudgetRevisionStoreImplCopyWith<$Res> {
  factory _$$UserBudgetRevisionStoreImplCopyWith(
          _$UserBudgetRevisionStoreImpl value,
          $Res Function(_$UserBudgetRevisionStoreImpl) then) =
      __$$UserBudgetRevisionStoreImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StoreBudgetRevisionModel request});
}

/// @nodoc
class __$$UserBudgetRevisionStoreImplCopyWithImpl<$Res>
    extends _$UserBudgetRevisionEventCopyWithImpl<$Res,
        _$UserBudgetRevisionStoreImpl>
    implements _$$UserBudgetRevisionStoreImplCopyWith<$Res> {
  __$$UserBudgetRevisionStoreImplCopyWithImpl(
      _$UserBudgetRevisionStoreImpl _value,
      $Res Function(_$UserBudgetRevisionStoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$UserBudgetRevisionStoreImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as StoreBudgetRevisionModel,
    ));
  }
}

/// @nodoc

class _$UserBudgetRevisionStoreImpl implements UserBudgetRevisionStore {
  const _$UserBudgetRevisionStoreImpl(this.request);

  @override
  final StoreBudgetRevisionModel request;

  @override
  String toString() {
    return 'UserBudgetRevisionEvent.store(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBudgetRevisionStoreImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of UserBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBudgetRevisionStoreImplCopyWith<_$UserBudgetRevisionStoreImpl>
      get copyWith => __$$UserBudgetRevisionStoreImplCopyWithImpl<
          _$UserBudgetRevisionStoreImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(StoreBudgetRevisionModel request) store,
  }) {
    return store(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(StoreBudgetRevisionModel request)? store,
  }) {
    return store?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? getAll,
    TResult Function(int id)? getDetail,
    TResult Function(StoreBudgetRevisionModel request)? store,
    required TResult orElse(),
  }) {
    if (store != null) {
      return store(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserBudgetRevisionGetAll value) getAll,
    required TResult Function(UserBudgetRevisionGetDetail value) getDetail,
    required TResult Function(UserBudgetRevisionStore value) store,
  }) {
    return store(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserBudgetRevisionGetAll value)? getAll,
    TResult? Function(UserBudgetRevisionGetDetail value)? getDetail,
    TResult? Function(UserBudgetRevisionStore value)? store,
  }) {
    return store?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserBudgetRevisionGetAll value)? getAll,
    TResult Function(UserBudgetRevisionGetDetail value)? getDetail,
    TResult Function(UserBudgetRevisionStore value)? store,
    required TResult orElse(),
  }) {
    if (store != null) {
      return store(this);
    }
    return orElse();
  }
}

abstract class UserBudgetRevisionStore implements UserBudgetRevisionEvent {
  const factory UserBudgetRevisionStore(
      final StoreBudgetRevisionModel request) = _$UserBudgetRevisionStoreImpl;

  StoreBudgetRevisionModel get request;

  /// Create a copy of UserBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBudgetRevisionStoreImplCopyWith<_$UserBudgetRevisionStoreImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserBudgetRevisionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(BudgetRevisionListResponseModel data) loaded,
    required TResult Function(BudgetRevisionModel data) detail,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BudgetRevisionListResponseModel data)? loaded,
    TResult? Function(BudgetRevisionModel data)? detail,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BudgetRevisionListResponseModel data)? loaded,
    TResult Function(BudgetRevisionModel data)? detail,
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
    required TResult Function(_Detail value) detail,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Detail value)? detail,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Detail value)? detail,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBudgetRevisionStateCopyWith<$Res> {
  factory $UserBudgetRevisionStateCopyWith(UserBudgetRevisionState value,
          $Res Function(UserBudgetRevisionState) then) =
      _$UserBudgetRevisionStateCopyWithImpl<$Res, UserBudgetRevisionState>;
}

/// @nodoc
class _$UserBudgetRevisionStateCopyWithImpl<$Res,
        $Val extends UserBudgetRevisionState>
    implements $UserBudgetRevisionStateCopyWith<$Res> {
  _$UserBudgetRevisionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBudgetRevisionState
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
    extends _$UserBudgetRevisionStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBudgetRevisionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'UserBudgetRevisionState.initial()';
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
    required TResult Function(BudgetRevisionListResponseModel data) loaded,
    required TResult Function(BudgetRevisionModel data) detail,
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
    TResult? Function(BudgetRevisionListResponseModel data)? loaded,
    TResult? Function(BudgetRevisionModel data)? detail,
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
    TResult Function(BudgetRevisionListResponseModel data)? loaded,
    TResult Function(BudgetRevisionModel data)? detail,
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
    required TResult Function(_Detail value) detail,
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
    TResult? Function(_Detail value)? detail,
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
    TResult Function(_Detail value)? detail,
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

abstract class _Initial implements UserBudgetRevisionState {
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
    extends _$UserBudgetRevisionStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBudgetRevisionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'UserBudgetRevisionState.loading()';
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
    required TResult Function(BudgetRevisionListResponseModel data) loaded,
    required TResult Function(BudgetRevisionModel data) detail,
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
    TResult? Function(BudgetRevisionListResponseModel data)? loaded,
    TResult? Function(BudgetRevisionModel data)? detail,
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
    TResult Function(BudgetRevisionListResponseModel data)? loaded,
    TResult Function(BudgetRevisionModel data)? detail,
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
    required TResult Function(_Detail value) detail,
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
    TResult? Function(_Detail value)? detail,
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
    TResult Function(_Detail value)? detail,
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

abstract class _Loading implements UserBudgetRevisionState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BudgetRevisionListResponseModel data});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$UserBudgetRevisionStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBudgetRevisionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadedImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as BudgetRevisionListResponseModel,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.data);

  @override
  final BudgetRevisionListResponseModel data;

  @override
  String toString() {
    return 'UserBudgetRevisionState.loaded(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of UserBudgetRevisionState
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
    required TResult Function(BudgetRevisionListResponseModel data) loaded,
    required TResult Function(BudgetRevisionModel data) detail,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BudgetRevisionListResponseModel data)? loaded,
    TResult? Function(BudgetRevisionModel data)? detail,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BudgetRevisionListResponseModel data)? loaded,
    TResult Function(BudgetRevisionModel data)? detail,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Detail value) detail,
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
    TResult? Function(_Detail value)? detail,
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
    TResult Function(_Detail value)? detail,
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

abstract class _Loaded implements UserBudgetRevisionState {
  const factory _Loaded(final BudgetRevisionListResponseModel data) =
      _$LoadedImpl;

  BudgetRevisionListResponseModel get data;

  /// Create a copy of UserBudgetRevisionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailImplCopyWith<$Res> {
  factory _$$DetailImplCopyWith(
          _$DetailImpl value, $Res Function(_$DetailImpl) then) =
      __$$DetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BudgetRevisionModel data});
}

/// @nodoc
class __$$DetailImplCopyWithImpl<$Res>
    extends _$UserBudgetRevisionStateCopyWithImpl<$Res, _$DetailImpl>
    implements _$$DetailImplCopyWith<$Res> {
  __$$DetailImplCopyWithImpl(
      _$DetailImpl _value, $Res Function(_$DetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBudgetRevisionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$DetailImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as BudgetRevisionModel,
    ));
  }
}

/// @nodoc

class _$DetailImpl implements _Detail {
  const _$DetailImpl(this.data);

  @override
  final BudgetRevisionModel data;

  @override
  String toString() {
    return 'UserBudgetRevisionState.detail(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of UserBudgetRevisionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailImplCopyWith<_$DetailImpl> get copyWith =>
      __$$DetailImplCopyWithImpl<_$DetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(BudgetRevisionListResponseModel data) loaded,
    required TResult Function(BudgetRevisionModel data) detail,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return detail(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BudgetRevisionListResponseModel data)? loaded,
    TResult? Function(BudgetRevisionModel data)? detail,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return detail?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BudgetRevisionListResponseModel data)? loaded,
    TResult Function(BudgetRevisionModel data)? detail,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (detail != null) {
      return detail(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Detail value) detail,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return detail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Detail value)? detail,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return detail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Detail value)? detail,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (detail != null) {
      return detail(this);
    }
    return orElse();
  }
}

abstract class _Detail implements UserBudgetRevisionState {
  const factory _Detail(final BudgetRevisionModel data) = _$DetailImpl;

  BudgetRevisionModel get data;

  /// Create a copy of UserBudgetRevisionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailImplCopyWith<_$DetailImpl> get copyWith =>
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
    extends _$UserBudgetRevisionStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBudgetRevisionState
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
    return 'UserBudgetRevisionState.success(message: $message)';
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

  /// Create a copy of UserBudgetRevisionState
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
    required TResult Function(BudgetRevisionListResponseModel data) loaded,
    required TResult Function(BudgetRevisionModel data) detail,
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
    TResult? Function(BudgetRevisionListResponseModel data)? loaded,
    TResult? Function(BudgetRevisionModel data)? detail,
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
    TResult Function(BudgetRevisionListResponseModel data)? loaded,
    TResult Function(BudgetRevisionModel data)? detail,
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
    required TResult Function(_Detail value) detail,
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
    TResult? Function(_Detail value)? detail,
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
    TResult Function(_Detail value)? detail,
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

abstract class _Success implements UserBudgetRevisionState {
  const factory _Success(final String message) = _$SuccessImpl;

  String get message;

  /// Create a copy of UserBudgetRevisionState
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
    extends _$UserBudgetRevisionStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBudgetRevisionState
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
    return 'UserBudgetRevisionState.error(message: $message)';
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

  /// Create a copy of UserBudgetRevisionState
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
    required TResult Function(BudgetRevisionListResponseModel data) loaded,
    required TResult Function(BudgetRevisionModel data) detail,
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
    TResult? Function(BudgetRevisionListResponseModel data)? loaded,
    TResult? Function(BudgetRevisionModel data)? detail,
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
    TResult Function(BudgetRevisionListResponseModel data)? loaded,
    TResult Function(BudgetRevisionModel data)? detail,
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
    required TResult Function(_Detail value) detail,
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
    TResult? Function(_Detail value)? detail,
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
    TResult Function(_Detail value)? detail,
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

abstract class _Error implements UserBudgetRevisionState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of UserBudgetRevisionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
