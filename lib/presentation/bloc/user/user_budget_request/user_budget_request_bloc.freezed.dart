// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_budget_request_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserBudgetRequestEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(StoreBudgetRequestModel request) store,
    required TResult Function(int id, StoreBudgetRequestModel request) update,
    required TResult Function(int id) delete,
    required TResult Function(int id) submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(StoreBudgetRequestModel request)? store,
    TResult? Function(int id, StoreBudgetRequestModel request)? update,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? getAll,
    TResult Function(int id)? getDetail,
    TResult Function(StoreBudgetRequestModel request)? store,
    TResult Function(int id, StoreBudgetRequestModel request)? update,
    TResult Function(int id)? delete,
    TResult Function(int id)? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserBudgetRequestGetAll value) getAll,
    required TResult Function(UserBudgetRequestGetDetail value) getDetail,
    required TResult Function(UserBudgetRequestStore value) store,
    required TResult Function(UserBudgetRequestUpdate value) update,
    required TResult Function(UserBudgetRequestDelete value) delete,
    required TResult Function(UserBudgetRequestSubmit value) submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserBudgetRequestGetAll value)? getAll,
    TResult? Function(UserBudgetRequestGetDetail value)? getDetail,
    TResult? Function(UserBudgetRequestStore value)? store,
    TResult? Function(UserBudgetRequestUpdate value)? update,
    TResult? Function(UserBudgetRequestDelete value)? delete,
    TResult? Function(UserBudgetRequestSubmit value)? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserBudgetRequestGetAll value)? getAll,
    TResult Function(UserBudgetRequestGetDetail value)? getDetail,
    TResult Function(UserBudgetRequestStore value)? store,
    TResult Function(UserBudgetRequestUpdate value)? update,
    TResult Function(UserBudgetRequestDelete value)? delete,
    TResult Function(UserBudgetRequestSubmit value)? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBudgetRequestEventCopyWith<$Res> {
  factory $UserBudgetRequestEventCopyWith(UserBudgetRequestEvent value,
          $Res Function(UserBudgetRequestEvent) then) =
      _$UserBudgetRequestEventCopyWithImpl<$Res, UserBudgetRequestEvent>;
}

/// @nodoc
class _$UserBudgetRequestEventCopyWithImpl<$Res,
        $Val extends UserBudgetRequestEvent>
    implements $UserBudgetRequestEventCopyWith<$Res> {
  _$UserBudgetRequestEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UserBudgetRequestGetAllImplCopyWith<$Res> {
  factory _$$UserBudgetRequestGetAllImplCopyWith(
          _$UserBudgetRequestGetAllImpl value,
          $Res Function(_$UserBudgetRequestGetAllImpl) then) =
      __$$UserBudgetRequestGetAllImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, String? status});
}

/// @nodoc
class __$$UserBudgetRequestGetAllImplCopyWithImpl<$Res>
    extends _$UserBudgetRequestEventCopyWithImpl<$Res,
        _$UserBudgetRequestGetAllImpl>
    implements _$$UserBudgetRequestGetAllImplCopyWith<$Res> {
  __$$UserBudgetRequestGetAllImplCopyWithImpl(
      _$UserBudgetRequestGetAllImpl _value,
      $Res Function(_$UserBudgetRequestGetAllImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? status = freezed,
  }) {
    return _then(_$UserBudgetRequestGetAllImpl(
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

class _$UserBudgetRequestGetAllImpl implements UserBudgetRequestGetAll {
  const _$UserBudgetRequestGetAllImpl({this.page = 1, this.status});

  @override
  @JsonKey()
  final int page;
  @override
  final String? status;

  @override
  String toString() {
    return 'UserBudgetRequestEvent.getAll(page: $page, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBudgetRequestGetAllImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, status);

  /// Create a copy of UserBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBudgetRequestGetAllImplCopyWith<_$UserBudgetRequestGetAllImpl>
      get copyWith => __$$UserBudgetRequestGetAllImplCopyWithImpl<
          _$UserBudgetRequestGetAllImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(StoreBudgetRequestModel request) store,
    required TResult Function(int id, StoreBudgetRequestModel request) update,
    required TResult Function(int id) delete,
    required TResult Function(int id) submit,
  }) {
    return getAll(page, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(StoreBudgetRequestModel request)? store,
    TResult? Function(int id, StoreBudgetRequestModel request)? update,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? submit,
  }) {
    return getAll?.call(page, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? getAll,
    TResult Function(int id)? getDetail,
    TResult Function(StoreBudgetRequestModel request)? store,
    TResult Function(int id, StoreBudgetRequestModel request)? update,
    TResult Function(int id)? delete,
    TResult Function(int id)? submit,
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
    required TResult Function(UserBudgetRequestGetAll value) getAll,
    required TResult Function(UserBudgetRequestGetDetail value) getDetail,
    required TResult Function(UserBudgetRequestStore value) store,
    required TResult Function(UserBudgetRequestUpdate value) update,
    required TResult Function(UserBudgetRequestDelete value) delete,
    required TResult Function(UserBudgetRequestSubmit value) submit,
  }) {
    return getAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserBudgetRequestGetAll value)? getAll,
    TResult? Function(UserBudgetRequestGetDetail value)? getDetail,
    TResult? Function(UserBudgetRequestStore value)? store,
    TResult? Function(UserBudgetRequestUpdate value)? update,
    TResult? Function(UserBudgetRequestDelete value)? delete,
    TResult? Function(UserBudgetRequestSubmit value)? submit,
  }) {
    return getAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserBudgetRequestGetAll value)? getAll,
    TResult Function(UserBudgetRequestGetDetail value)? getDetail,
    TResult Function(UserBudgetRequestStore value)? store,
    TResult Function(UserBudgetRequestUpdate value)? update,
    TResult Function(UserBudgetRequestDelete value)? delete,
    TResult Function(UserBudgetRequestSubmit value)? submit,
    required TResult orElse(),
  }) {
    if (getAll != null) {
      return getAll(this);
    }
    return orElse();
  }
}

abstract class UserBudgetRequestGetAll implements UserBudgetRequestEvent {
  const factory UserBudgetRequestGetAll(
      {final int page, final String? status}) = _$UserBudgetRequestGetAllImpl;

  int get page;
  String? get status;

  /// Create a copy of UserBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBudgetRequestGetAllImplCopyWith<_$UserBudgetRequestGetAllImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserBudgetRequestGetDetailImplCopyWith<$Res> {
  factory _$$UserBudgetRequestGetDetailImplCopyWith(
          _$UserBudgetRequestGetDetailImpl value,
          $Res Function(_$UserBudgetRequestGetDetailImpl) then) =
      __$$UserBudgetRequestGetDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$UserBudgetRequestGetDetailImplCopyWithImpl<$Res>
    extends _$UserBudgetRequestEventCopyWithImpl<$Res,
        _$UserBudgetRequestGetDetailImpl>
    implements _$$UserBudgetRequestGetDetailImplCopyWith<$Res> {
  __$$UserBudgetRequestGetDetailImplCopyWithImpl(
      _$UserBudgetRequestGetDetailImpl _value,
      $Res Function(_$UserBudgetRequestGetDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$UserBudgetRequestGetDetailImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UserBudgetRequestGetDetailImpl implements UserBudgetRequestGetDetail {
  const _$UserBudgetRequestGetDetailImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'UserBudgetRequestEvent.getDetail(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBudgetRequestGetDetailImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of UserBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBudgetRequestGetDetailImplCopyWith<_$UserBudgetRequestGetDetailImpl>
      get copyWith => __$$UserBudgetRequestGetDetailImplCopyWithImpl<
          _$UserBudgetRequestGetDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(StoreBudgetRequestModel request) store,
    required TResult Function(int id, StoreBudgetRequestModel request) update,
    required TResult Function(int id) delete,
    required TResult Function(int id) submit,
  }) {
    return getDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(StoreBudgetRequestModel request)? store,
    TResult? Function(int id, StoreBudgetRequestModel request)? update,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? submit,
  }) {
    return getDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? getAll,
    TResult Function(int id)? getDetail,
    TResult Function(StoreBudgetRequestModel request)? store,
    TResult Function(int id, StoreBudgetRequestModel request)? update,
    TResult Function(int id)? delete,
    TResult Function(int id)? submit,
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
    required TResult Function(UserBudgetRequestGetAll value) getAll,
    required TResult Function(UserBudgetRequestGetDetail value) getDetail,
    required TResult Function(UserBudgetRequestStore value) store,
    required TResult Function(UserBudgetRequestUpdate value) update,
    required TResult Function(UserBudgetRequestDelete value) delete,
    required TResult Function(UserBudgetRequestSubmit value) submit,
  }) {
    return getDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserBudgetRequestGetAll value)? getAll,
    TResult? Function(UserBudgetRequestGetDetail value)? getDetail,
    TResult? Function(UserBudgetRequestStore value)? store,
    TResult? Function(UserBudgetRequestUpdate value)? update,
    TResult? Function(UserBudgetRequestDelete value)? delete,
    TResult? Function(UserBudgetRequestSubmit value)? submit,
  }) {
    return getDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserBudgetRequestGetAll value)? getAll,
    TResult Function(UserBudgetRequestGetDetail value)? getDetail,
    TResult Function(UserBudgetRequestStore value)? store,
    TResult Function(UserBudgetRequestUpdate value)? update,
    TResult Function(UserBudgetRequestDelete value)? delete,
    TResult Function(UserBudgetRequestSubmit value)? submit,
    required TResult orElse(),
  }) {
    if (getDetail != null) {
      return getDetail(this);
    }
    return orElse();
  }
}

abstract class UserBudgetRequestGetDetail implements UserBudgetRequestEvent {
  const factory UserBudgetRequestGetDetail(final int id) =
      _$UserBudgetRequestGetDetailImpl;

  int get id;

  /// Create a copy of UserBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBudgetRequestGetDetailImplCopyWith<_$UserBudgetRequestGetDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserBudgetRequestStoreImplCopyWith<$Res> {
  factory _$$UserBudgetRequestStoreImplCopyWith(
          _$UserBudgetRequestStoreImpl value,
          $Res Function(_$UserBudgetRequestStoreImpl) then) =
      __$$UserBudgetRequestStoreImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StoreBudgetRequestModel request});
}

/// @nodoc
class __$$UserBudgetRequestStoreImplCopyWithImpl<$Res>
    extends _$UserBudgetRequestEventCopyWithImpl<$Res,
        _$UserBudgetRequestStoreImpl>
    implements _$$UserBudgetRequestStoreImplCopyWith<$Res> {
  __$$UserBudgetRequestStoreImplCopyWithImpl(
      _$UserBudgetRequestStoreImpl _value,
      $Res Function(_$UserBudgetRequestStoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$UserBudgetRequestStoreImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as StoreBudgetRequestModel,
    ));
  }
}

/// @nodoc

class _$UserBudgetRequestStoreImpl implements UserBudgetRequestStore {
  const _$UserBudgetRequestStoreImpl(this.request);

  @override
  final StoreBudgetRequestModel request;

  @override
  String toString() {
    return 'UserBudgetRequestEvent.store(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBudgetRequestStoreImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of UserBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBudgetRequestStoreImplCopyWith<_$UserBudgetRequestStoreImpl>
      get copyWith => __$$UserBudgetRequestStoreImplCopyWithImpl<
          _$UserBudgetRequestStoreImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(StoreBudgetRequestModel request) store,
    required TResult Function(int id, StoreBudgetRequestModel request) update,
    required TResult Function(int id) delete,
    required TResult Function(int id) submit,
  }) {
    return store(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(StoreBudgetRequestModel request)? store,
    TResult? Function(int id, StoreBudgetRequestModel request)? update,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? submit,
  }) {
    return store?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? getAll,
    TResult Function(int id)? getDetail,
    TResult Function(StoreBudgetRequestModel request)? store,
    TResult Function(int id, StoreBudgetRequestModel request)? update,
    TResult Function(int id)? delete,
    TResult Function(int id)? submit,
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
    required TResult Function(UserBudgetRequestGetAll value) getAll,
    required TResult Function(UserBudgetRequestGetDetail value) getDetail,
    required TResult Function(UserBudgetRequestStore value) store,
    required TResult Function(UserBudgetRequestUpdate value) update,
    required TResult Function(UserBudgetRequestDelete value) delete,
    required TResult Function(UserBudgetRequestSubmit value) submit,
  }) {
    return store(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserBudgetRequestGetAll value)? getAll,
    TResult? Function(UserBudgetRequestGetDetail value)? getDetail,
    TResult? Function(UserBudgetRequestStore value)? store,
    TResult? Function(UserBudgetRequestUpdate value)? update,
    TResult? Function(UserBudgetRequestDelete value)? delete,
    TResult? Function(UserBudgetRequestSubmit value)? submit,
  }) {
    return store?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserBudgetRequestGetAll value)? getAll,
    TResult Function(UserBudgetRequestGetDetail value)? getDetail,
    TResult Function(UserBudgetRequestStore value)? store,
    TResult Function(UserBudgetRequestUpdate value)? update,
    TResult Function(UserBudgetRequestDelete value)? delete,
    TResult Function(UserBudgetRequestSubmit value)? submit,
    required TResult orElse(),
  }) {
    if (store != null) {
      return store(this);
    }
    return orElse();
  }
}

abstract class UserBudgetRequestStore implements UserBudgetRequestEvent {
  const factory UserBudgetRequestStore(final StoreBudgetRequestModel request) =
      _$UserBudgetRequestStoreImpl;

  StoreBudgetRequestModel get request;

  /// Create a copy of UserBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBudgetRequestStoreImplCopyWith<_$UserBudgetRequestStoreImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserBudgetRequestUpdateImplCopyWith<$Res> {
  factory _$$UserBudgetRequestUpdateImplCopyWith(
          _$UserBudgetRequestUpdateImpl value,
          $Res Function(_$UserBudgetRequestUpdateImpl) then) =
      __$$UserBudgetRequestUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, StoreBudgetRequestModel request});
}

/// @nodoc
class __$$UserBudgetRequestUpdateImplCopyWithImpl<$Res>
    extends _$UserBudgetRequestEventCopyWithImpl<$Res,
        _$UserBudgetRequestUpdateImpl>
    implements _$$UserBudgetRequestUpdateImplCopyWith<$Res> {
  __$$UserBudgetRequestUpdateImplCopyWithImpl(
      _$UserBudgetRequestUpdateImpl _value,
      $Res Function(_$UserBudgetRequestUpdateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? request = null,
  }) {
    return _then(_$UserBudgetRequestUpdateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as StoreBudgetRequestModel,
    ));
  }
}

/// @nodoc

class _$UserBudgetRequestUpdateImpl implements UserBudgetRequestUpdate {
  const _$UserBudgetRequestUpdateImpl(
      {required this.id, required this.request});

  @override
  final int id;
  @override
  final StoreBudgetRequestModel request;

  @override
  String toString() {
    return 'UserBudgetRequestEvent.update(id: $id, request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBudgetRequestUpdateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, request);

  /// Create a copy of UserBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBudgetRequestUpdateImplCopyWith<_$UserBudgetRequestUpdateImpl>
      get copyWith => __$$UserBudgetRequestUpdateImplCopyWithImpl<
          _$UserBudgetRequestUpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(StoreBudgetRequestModel request) store,
    required TResult Function(int id, StoreBudgetRequestModel request) update,
    required TResult Function(int id) delete,
    required TResult Function(int id) submit,
  }) {
    return update(id, request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(StoreBudgetRequestModel request)? store,
    TResult? Function(int id, StoreBudgetRequestModel request)? update,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? submit,
  }) {
    return update?.call(id, request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? getAll,
    TResult Function(int id)? getDetail,
    TResult Function(StoreBudgetRequestModel request)? store,
    TResult Function(int id, StoreBudgetRequestModel request)? update,
    TResult Function(int id)? delete,
    TResult Function(int id)? submit,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(id, request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserBudgetRequestGetAll value) getAll,
    required TResult Function(UserBudgetRequestGetDetail value) getDetail,
    required TResult Function(UserBudgetRequestStore value) store,
    required TResult Function(UserBudgetRequestUpdate value) update,
    required TResult Function(UserBudgetRequestDelete value) delete,
    required TResult Function(UserBudgetRequestSubmit value) submit,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserBudgetRequestGetAll value)? getAll,
    TResult? Function(UserBudgetRequestGetDetail value)? getDetail,
    TResult? Function(UserBudgetRequestStore value)? store,
    TResult? Function(UserBudgetRequestUpdate value)? update,
    TResult? Function(UserBudgetRequestDelete value)? delete,
    TResult? Function(UserBudgetRequestSubmit value)? submit,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserBudgetRequestGetAll value)? getAll,
    TResult Function(UserBudgetRequestGetDetail value)? getDetail,
    TResult Function(UserBudgetRequestStore value)? store,
    TResult Function(UserBudgetRequestUpdate value)? update,
    TResult Function(UserBudgetRequestDelete value)? delete,
    TResult Function(UserBudgetRequestSubmit value)? submit,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class UserBudgetRequestUpdate implements UserBudgetRequestEvent {
  const factory UserBudgetRequestUpdate(
          {required final int id,
          required final StoreBudgetRequestModel request}) =
      _$UserBudgetRequestUpdateImpl;

  int get id;
  StoreBudgetRequestModel get request;

  /// Create a copy of UserBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBudgetRequestUpdateImplCopyWith<_$UserBudgetRequestUpdateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserBudgetRequestDeleteImplCopyWith<$Res> {
  factory _$$UserBudgetRequestDeleteImplCopyWith(
          _$UserBudgetRequestDeleteImpl value,
          $Res Function(_$UserBudgetRequestDeleteImpl) then) =
      __$$UserBudgetRequestDeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$UserBudgetRequestDeleteImplCopyWithImpl<$Res>
    extends _$UserBudgetRequestEventCopyWithImpl<$Res,
        _$UserBudgetRequestDeleteImpl>
    implements _$$UserBudgetRequestDeleteImplCopyWith<$Res> {
  __$$UserBudgetRequestDeleteImplCopyWithImpl(
      _$UserBudgetRequestDeleteImpl _value,
      $Res Function(_$UserBudgetRequestDeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$UserBudgetRequestDeleteImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UserBudgetRequestDeleteImpl implements UserBudgetRequestDelete {
  const _$UserBudgetRequestDeleteImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'UserBudgetRequestEvent.delete(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBudgetRequestDeleteImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of UserBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBudgetRequestDeleteImplCopyWith<_$UserBudgetRequestDeleteImpl>
      get copyWith => __$$UserBudgetRequestDeleteImplCopyWithImpl<
          _$UserBudgetRequestDeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(StoreBudgetRequestModel request) store,
    required TResult Function(int id, StoreBudgetRequestModel request) update,
    required TResult Function(int id) delete,
    required TResult Function(int id) submit,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(StoreBudgetRequestModel request)? store,
    TResult? Function(int id, StoreBudgetRequestModel request)? update,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? submit,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? getAll,
    TResult Function(int id)? getDetail,
    TResult Function(StoreBudgetRequestModel request)? store,
    TResult Function(int id, StoreBudgetRequestModel request)? update,
    TResult Function(int id)? delete,
    TResult Function(int id)? submit,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserBudgetRequestGetAll value) getAll,
    required TResult Function(UserBudgetRequestGetDetail value) getDetail,
    required TResult Function(UserBudgetRequestStore value) store,
    required TResult Function(UserBudgetRequestUpdate value) update,
    required TResult Function(UserBudgetRequestDelete value) delete,
    required TResult Function(UserBudgetRequestSubmit value) submit,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserBudgetRequestGetAll value)? getAll,
    TResult? Function(UserBudgetRequestGetDetail value)? getDetail,
    TResult? Function(UserBudgetRequestStore value)? store,
    TResult? Function(UserBudgetRequestUpdate value)? update,
    TResult? Function(UserBudgetRequestDelete value)? delete,
    TResult? Function(UserBudgetRequestSubmit value)? submit,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserBudgetRequestGetAll value)? getAll,
    TResult Function(UserBudgetRequestGetDetail value)? getDetail,
    TResult Function(UserBudgetRequestStore value)? store,
    TResult Function(UserBudgetRequestUpdate value)? update,
    TResult Function(UserBudgetRequestDelete value)? delete,
    TResult Function(UserBudgetRequestSubmit value)? submit,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class UserBudgetRequestDelete implements UserBudgetRequestEvent {
  const factory UserBudgetRequestDelete(final int id) =
      _$UserBudgetRequestDeleteImpl;

  int get id;

  /// Create a copy of UserBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBudgetRequestDeleteImplCopyWith<_$UserBudgetRequestDeleteImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserBudgetRequestSubmitImplCopyWith<$Res> {
  factory _$$UserBudgetRequestSubmitImplCopyWith(
          _$UserBudgetRequestSubmitImpl value,
          $Res Function(_$UserBudgetRequestSubmitImpl) then) =
      __$$UserBudgetRequestSubmitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$UserBudgetRequestSubmitImplCopyWithImpl<$Res>
    extends _$UserBudgetRequestEventCopyWithImpl<$Res,
        _$UserBudgetRequestSubmitImpl>
    implements _$$UserBudgetRequestSubmitImplCopyWith<$Res> {
  __$$UserBudgetRequestSubmitImplCopyWithImpl(
      _$UserBudgetRequestSubmitImpl _value,
      $Res Function(_$UserBudgetRequestSubmitImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$UserBudgetRequestSubmitImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UserBudgetRequestSubmitImpl implements UserBudgetRequestSubmit {
  const _$UserBudgetRequestSubmitImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'UserBudgetRequestEvent.submit(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBudgetRequestSubmitImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of UserBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBudgetRequestSubmitImplCopyWith<_$UserBudgetRequestSubmitImpl>
      get copyWith => __$$UserBudgetRequestSubmitImplCopyWithImpl<
          _$UserBudgetRequestSubmitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(StoreBudgetRequestModel request) store,
    required TResult Function(int id, StoreBudgetRequestModel request) update,
    required TResult Function(int id) delete,
    required TResult Function(int id) submit,
  }) {
    return submit(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(StoreBudgetRequestModel request)? store,
    TResult? Function(int id, StoreBudgetRequestModel request)? update,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? submit,
  }) {
    return submit?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? getAll,
    TResult Function(int id)? getDetail,
    TResult Function(StoreBudgetRequestModel request)? store,
    TResult Function(int id, StoreBudgetRequestModel request)? update,
    TResult Function(int id)? delete,
    TResult Function(int id)? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserBudgetRequestGetAll value) getAll,
    required TResult Function(UserBudgetRequestGetDetail value) getDetail,
    required TResult Function(UserBudgetRequestStore value) store,
    required TResult Function(UserBudgetRequestUpdate value) update,
    required TResult Function(UserBudgetRequestDelete value) delete,
    required TResult Function(UserBudgetRequestSubmit value) submit,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserBudgetRequestGetAll value)? getAll,
    TResult? Function(UserBudgetRequestGetDetail value)? getDetail,
    TResult? Function(UserBudgetRequestStore value)? store,
    TResult? Function(UserBudgetRequestUpdate value)? update,
    TResult? Function(UserBudgetRequestDelete value)? delete,
    TResult? Function(UserBudgetRequestSubmit value)? submit,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserBudgetRequestGetAll value)? getAll,
    TResult Function(UserBudgetRequestGetDetail value)? getDetail,
    TResult Function(UserBudgetRequestStore value)? store,
    TResult Function(UserBudgetRequestUpdate value)? update,
    TResult Function(UserBudgetRequestDelete value)? delete,
    TResult Function(UserBudgetRequestSubmit value)? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class UserBudgetRequestSubmit implements UserBudgetRequestEvent {
  const factory UserBudgetRequestSubmit(final int id) =
      _$UserBudgetRequestSubmitImpl;

  int get id;

  /// Create a copy of UserBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBudgetRequestSubmitImplCopyWith<_$UserBudgetRequestSubmitImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserBudgetRequestState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(BudgetRequestListResponseModel data) loaded,
    required TResult Function(BudgetRequestModel data) detail,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BudgetRequestListResponseModel data)? loaded,
    TResult? Function(BudgetRequestModel data)? detail,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BudgetRequestListResponseModel data)? loaded,
    TResult Function(BudgetRequestModel data)? detail,
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
abstract class $UserBudgetRequestStateCopyWith<$Res> {
  factory $UserBudgetRequestStateCopyWith(UserBudgetRequestState value,
          $Res Function(UserBudgetRequestState) then) =
      _$UserBudgetRequestStateCopyWithImpl<$Res, UserBudgetRequestState>;
}

/// @nodoc
class _$UserBudgetRequestStateCopyWithImpl<$Res,
        $Val extends UserBudgetRequestState>
    implements $UserBudgetRequestStateCopyWith<$Res> {
  _$UserBudgetRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBudgetRequestState
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
    extends _$UserBudgetRequestStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBudgetRequestState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'UserBudgetRequestState.initial()';
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
    required TResult Function(BudgetRequestListResponseModel data) loaded,
    required TResult Function(BudgetRequestModel data) detail,
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
    TResult? Function(BudgetRequestListResponseModel data)? loaded,
    TResult? Function(BudgetRequestModel data)? detail,
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
    TResult Function(BudgetRequestListResponseModel data)? loaded,
    TResult Function(BudgetRequestModel data)? detail,
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

abstract class _Initial implements UserBudgetRequestState {
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
    extends _$UserBudgetRequestStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBudgetRequestState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'UserBudgetRequestState.loading()';
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
    required TResult Function(BudgetRequestListResponseModel data) loaded,
    required TResult Function(BudgetRequestModel data) detail,
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
    TResult? Function(BudgetRequestListResponseModel data)? loaded,
    TResult? Function(BudgetRequestModel data)? detail,
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
    TResult Function(BudgetRequestListResponseModel data)? loaded,
    TResult Function(BudgetRequestModel data)? detail,
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

abstract class _Loading implements UserBudgetRequestState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BudgetRequestListResponseModel data});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$UserBudgetRequestStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBudgetRequestState
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
              as BudgetRequestListResponseModel,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.data);

  @override
  final BudgetRequestListResponseModel data;

  @override
  String toString() {
    return 'UserBudgetRequestState.loaded(data: $data)';
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

  /// Create a copy of UserBudgetRequestState
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
    required TResult Function(BudgetRequestListResponseModel data) loaded,
    required TResult Function(BudgetRequestModel data) detail,
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
    TResult? Function(BudgetRequestListResponseModel data)? loaded,
    TResult? Function(BudgetRequestModel data)? detail,
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
    TResult Function(BudgetRequestListResponseModel data)? loaded,
    TResult Function(BudgetRequestModel data)? detail,
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

abstract class _Loaded implements UserBudgetRequestState {
  const factory _Loaded(final BudgetRequestListResponseModel data) =
      _$LoadedImpl;

  BudgetRequestListResponseModel get data;

  /// Create a copy of UserBudgetRequestState
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
  $Res call({BudgetRequestModel data});
}

/// @nodoc
class __$$DetailImplCopyWithImpl<$Res>
    extends _$UserBudgetRequestStateCopyWithImpl<$Res, _$DetailImpl>
    implements _$$DetailImplCopyWith<$Res> {
  __$$DetailImplCopyWithImpl(
      _$DetailImpl _value, $Res Function(_$DetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBudgetRequestState
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
              as BudgetRequestModel,
    ));
  }
}

/// @nodoc

class _$DetailImpl implements _Detail {
  const _$DetailImpl(this.data);

  @override
  final BudgetRequestModel data;

  @override
  String toString() {
    return 'UserBudgetRequestState.detail(data: $data)';
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

  /// Create a copy of UserBudgetRequestState
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
    required TResult Function(BudgetRequestListResponseModel data) loaded,
    required TResult Function(BudgetRequestModel data) detail,
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
    TResult? Function(BudgetRequestListResponseModel data)? loaded,
    TResult? Function(BudgetRequestModel data)? detail,
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
    TResult Function(BudgetRequestListResponseModel data)? loaded,
    TResult Function(BudgetRequestModel data)? detail,
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

abstract class _Detail implements UserBudgetRequestState {
  const factory _Detail(final BudgetRequestModel data) = _$DetailImpl;

  BudgetRequestModel get data;

  /// Create a copy of UserBudgetRequestState
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
    extends _$UserBudgetRequestStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBudgetRequestState
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
    return 'UserBudgetRequestState.success(message: $message)';
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

  /// Create a copy of UserBudgetRequestState
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
    required TResult Function(BudgetRequestListResponseModel data) loaded,
    required TResult Function(BudgetRequestModel data) detail,
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
    TResult? Function(BudgetRequestListResponseModel data)? loaded,
    TResult? Function(BudgetRequestModel data)? detail,
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
    TResult Function(BudgetRequestListResponseModel data)? loaded,
    TResult Function(BudgetRequestModel data)? detail,
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

abstract class _Success implements UserBudgetRequestState {
  const factory _Success(final String message) = _$SuccessImpl;

  String get message;

  /// Create a copy of UserBudgetRequestState
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
    extends _$UserBudgetRequestStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBudgetRequestState
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
    return 'UserBudgetRequestState.error(message: $message)';
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

  /// Create a copy of UserBudgetRequestState
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
    required TResult Function(BudgetRequestListResponseModel data) loaded,
    required TResult Function(BudgetRequestModel data) detail,
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
    TResult? Function(BudgetRequestListResponseModel data)? loaded,
    TResult? Function(BudgetRequestModel data)? detail,
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
    TResult Function(BudgetRequestListResponseModel data)? loaded,
    TResult Function(BudgetRequestModel data)? detail,
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

abstract class _Error implements UserBudgetRequestState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of UserBudgetRequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
