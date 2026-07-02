// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_budget_verification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminBudgetVerificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(StoreBudgetVerificationModel request) store,
    required TResult Function(int id, StoreBudgetVerificationModel request)
        update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(StoreBudgetVerificationModel request)? store,
    TResult? Function(int id, StoreBudgetVerificationModel request)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? getAll,
    TResult Function(int id)? getDetail,
    TResult Function(StoreBudgetVerificationModel request)? store,
    TResult Function(int id, StoreBudgetVerificationModel request)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AdminBudgetVerificationGetAll value) getAll,
    required TResult Function(AdminBudgetVerificationGetDetail value) getDetail,
    required TResult Function(AdminBudgetVerificationStore value) store,
    required TResult Function(AdminBudgetVerificationUpdate value) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdminBudgetVerificationGetAll value)? getAll,
    TResult? Function(AdminBudgetVerificationGetDetail value)? getDetail,
    TResult? Function(AdminBudgetVerificationStore value)? store,
    TResult? Function(AdminBudgetVerificationUpdate value)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdminBudgetVerificationGetAll value)? getAll,
    TResult Function(AdminBudgetVerificationGetDetail value)? getDetail,
    TResult Function(AdminBudgetVerificationStore value)? store,
    TResult Function(AdminBudgetVerificationUpdate value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminBudgetVerificationEventCopyWith<$Res> {
  factory $AdminBudgetVerificationEventCopyWith(
          AdminBudgetVerificationEvent value,
          $Res Function(AdminBudgetVerificationEvent) then) =
      _$AdminBudgetVerificationEventCopyWithImpl<$Res,
          AdminBudgetVerificationEvent>;
}

/// @nodoc
class _$AdminBudgetVerificationEventCopyWithImpl<$Res,
        $Val extends AdminBudgetVerificationEvent>
    implements $AdminBudgetVerificationEventCopyWith<$Res> {
  _$AdminBudgetVerificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminBudgetVerificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AdminBudgetVerificationGetAllImplCopyWith<$Res> {
  factory _$$AdminBudgetVerificationGetAllImplCopyWith(
          _$AdminBudgetVerificationGetAllImpl value,
          $Res Function(_$AdminBudgetVerificationGetAllImpl) then) =
      __$$AdminBudgetVerificationGetAllImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, String? status});
}

/// @nodoc
class __$$AdminBudgetVerificationGetAllImplCopyWithImpl<$Res>
    extends _$AdminBudgetVerificationEventCopyWithImpl<$Res,
        _$AdminBudgetVerificationGetAllImpl>
    implements _$$AdminBudgetVerificationGetAllImplCopyWith<$Res> {
  __$$AdminBudgetVerificationGetAllImplCopyWithImpl(
      _$AdminBudgetVerificationGetAllImpl _value,
      $Res Function(_$AdminBudgetVerificationGetAllImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetVerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? status = freezed,
  }) {
    return _then(_$AdminBudgetVerificationGetAllImpl(
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

class _$AdminBudgetVerificationGetAllImpl
    implements AdminBudgetVerificationGetAll {
  const _$AdminBudgetVerificationGetAllImpl({this.page = 1, this.status});

  @override
  @JsonKey()
  final int page;
  @override
  final String? status;

  @override
  String toString() {
    return 'AdminBudgetVerificationEvent.getAll(page: $page, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminBudgetVerificationGetAllImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, status);

  /// Create a copy of AdminBudgetVerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminBudgetVerificationGetAllImplCopyWith<
          _$AdminBudgetVerificationGetAllImpl>
      get copyWith => __$$AdminBudgetVerificationGetAllImplCopyWithImpl<
          _$AdminBudgetVerificationGetAllImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(StoreBudgetVerificationModel request) store,
    required TResult Function(int id, StoreBudgetVerificationModel request)
        update,
  }) {
    return getAll(page, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(StoreBudgetVerificationModel request)? store,
    TResult? Function(int id, StoreBudgetVerificationModel request)? update,
  }) {
    return getAll?.call(page, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? getAll,
    TResult Function(int id)? getDetail,
    TResult Function(StoreBudgetVerificationModel request)? store,
    TResult Function(int id, StoreBudgetVerificationModel request)? update,
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
    required TResult Function(AdminBudgetVerificationGetAll value) getAll,
    required TResult Function(AdminBudgetVerificationGetDetail value) getDetail,
    required TResult Function(AdminBudgetVerificationStore value) store,
    required TResult Function(AdminBudgetVerificationUpdate value) update,
  }) {
    return getAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdminBudgetVerificationGetAll value)? getAll,
    TResult? Function(AdminBudgetVerificationGetDetail value)? getDetail,
    TResult? Function(AdminBudgetVerificationStore value)? store,
    TResult? Function(AdminBudgetVerificationUpdate value)? update,
  }) {
    return getAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdminBudgetVerificationGetAll value)? getAll,
    TResult Function(AdminBudgetVerificationGetDetail value)? getDetail,
    TResult Function(AdminBudgetVerificationStore value)? store,
    TResult Function(AdminBudgetVerificationUpdate value)? update,
    required TResult orElse(),
  }) {
    if (getAll != null) {
      return getAll(this);
    }
    return orElse();
  }
}

abstract class AdminBudgetVerificationGetAll
    implements AdminBudgetVerificationEvent {
  const factory AdminBudgetVerificationGetAll(
      {final int page,
      final String? status}) = _$AdminBudgetVerificationGetAllImpl;

  int get page;
  String? get status;

  /// Create a copy of AdminBudgetVerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminBudgetVerificationGetAllImplCopyWith<
          _$AdminBudgetVerificationGetAllImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdminBudgetVerificationGetDetailImplCopyWith<$Res> {
  factory _$$AdminBudgetVerificationGetDetailImplCopyWith(
          _$AdminBudgetVerificationGetDetailImpl value,
          $Res Function(_$AdminBudgetVerificationGetDetailImpl) then) =
      __$$AdminBudgetVerificationGetDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$AdminBudgetVerificationGetDetailImplCopyWithImpl<$Res>
    extends _$AdminBudgetVerificationEventCopyWithImpl<$Res,
        _$AdminBudgetVerificationGetDetailImpl>
    implements _$$AdminBudgetVerificationGetDetailImplCopyWith<$Res> {
  __$$AdminBudgetVerificationGetDetailImplCopyWithImpl(
      _$AdminBudgetVerificationGetDetailImpl _value,
      $Res Function(_$AdminBudgetVerificationGetDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetVerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$AdminBudgetVerificationGetDetailImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AdminBudgetVerificationGetDetailImpl
    implements AdminBudgetVerificationGetDetail {
  const _$AdminBudgetVerificationGetDetailImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'AdminBudgetVerificationEvent.getDetail(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminBudgetVerificationGetDetailImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of AdminBudgetVerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminBudgetVerificationGetDetailImplCopyWith<
          _$AdminBudgetVerificationGetDetailImpl>
      get copyWith => __$$AdminBudgetVerificationGetDetailImplCopyWithImpl<
          _$AdminBudgetVerificationGetDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(StoreBudgetVerificationModel request) store,
    required TResult Function(int id, StoreBudgetVerificationModel request)
        update,
  }) {
    return getDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(StoreBudgetVerificationModel request)? store,
    TResult? Function(int id, StoreBudgetVerificationModel request)? update,
  }) {
    return getDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? getAll,
    TResult Function(int id)? getDetail,
    TResult Function(StoreBudgetVerificationModel request)? store,
    TResult Function(int id, StoreBudgetVerificationModel request)? update,
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
    required TResult Function(AdminBudgetVerificationGetAll value) getAll,
    required TResult Function(AdminBudgetVerificationGetDetail value) getDetail,
    required TResult Function(AdminBudgetVerificationStore value) store,
    required TResult Function(AdminBudgetVerificationUpdate value) update,
  }) {
    return getDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdminBudgetVerificationGetAll value)? getAll,
    TResult? Function(AdminBudgetVerificationGetDetail value)? getDetail,
    TResult? Function(AdminBudgetVerificationStore value)? store,
    TResult? Function(AdminBudgetVerificationUpdate value)? update,
  }) {
    return getDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdminBudgetVerificationGetAll value)? getAll,
    TResult Function(AdminBudgetVerificationGetDetail value)? getDetail,
    TResult Function(AdminBudgetVerificationStore value)? store,
    TResult Function(AdminBudgetVerificationUpdate value)? update,
    required TResult orElse(),
  }) {
    if (getDetail != null) {
      return getDetail(this);
    }
    return orElse();
  }
}

abstract class AdminBudgetVerificationGetDetail
    implements AdminBudgetVerificationEvent {
  const factory AdminBudgetVerificationGetDetail(final int id) =
      _$AdminBudgetVerificationGetDetailImpl;

  int get id;

  /// Create a copy of AdminBudgetVerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminBudgetVerificationGetDetailImplCopyWith<
          _$AdminBudgetVerificationGetDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdminBudgetVerificationStoreImplCopyWith<$Res> {
  factory _$$AdminBudgetVerificationStoreImplCopyWith(
          _$AdminBudgetVerificationStoreImpl value,
          $Res Function(_$AdminBudgetVerificationStoreImpl) then) =
      __$$AdminBudgetVerificationStoreImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StoreBudgetVerificationModel request});
}

/// @nodoc
class __$$AdminBudgetVerificationStoreImplCopyWithImpl<$Res>
    extends _$AdminBudgetVerificationEventCopyWithImpl<$Res,
        _$AdminBudgetVerificationStoreImpl>
    implements _$$AdminBudgetVerificationStoreImplCopyWith<$Res> {
  __$$AdminBudgetVerificationStoreImplCopyWithImpl(
      _$AdminBudgetVerificationStoreImpl _value,
      $Res Function(_$AdminBudgetVerificationStoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetVerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$AdminBudgetVerificationStoreImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as StoreBudgetVerificationModel,
    ));
  }
}

/// @nodoc

class _$AdminBudgetVerificationStoreImpl
    implements AdminBudgetVerificationStore {
  const _$AdminBudgetVerificationStoreImpl(this.request);

  @override
  final StoreBudgetVerificationModel request;

  @override
  String toString() {
    return 'AdminBudgetVerificationEvent.store(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminBudgetVerificationStoreImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of AdminBudgetVerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminBudgetVerificationStoreImplCopyWith<
          _$AdminBudgetVerificationStoreImpl>
      get copyWith => __$$AdminBudgetVerificationStoreImplCopyWithImpl<
          _$AdminBudgetVerificationStoreImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(StoreBudgetVerificationModel request) store,
    required TResult Function(int id, StoreBudgetVerificationModel request)
        update,
  }) {
    return store(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(StoreBudgetVerificationModel request)? store,
    TResult? Function(int id, StoreBudgetVerificationModel request)? update,
  }) {
    return store?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? getAll,
    TResult Function(int id)? getDetail,
    TResult Function(StoreBudgetVerificationModel request)? store,
    TResult Function(int id, StoreBudgetVerificationModel request)? update,
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
    required TResult Function(AdminBudgetVerificationGetAll value) getAll,
    required TResult Function(AdminBudgetVerificationGetDetail value) getDetail,
    required TResult Function(AdminBudgetVerificationStore value) store,
    required TResult Function(AdminBudgetVerificationUpdate value) update,
  }) {
    return store(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdminBudgetVerificationGetAll value)? getAll,
    TResult? Function(AdminBudgetVerificationGetDetail value)? getDetail,
    TResult? Function(AdminBudgetVerificationStore value)? store,
    TResult? Function(AdminBudgetVerificationUpdate value)? update,
  }) {
    return store?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdminBudgetVerificationGetAll value)? getAll,
    TResult Function(AdminBudgetVerificationGetDetail value)? getDetail,
    TResult Function(AdminBudgetVerificationStore value)? store,
    TResult Function(AdminBudgetVerificationUpdate value)? update,
    required TResult orElse(),
  }) {
    if (store != null) {
      return store(this);
    }
    return orElse();
  }
}

abstract class AdminBudgetVerificationStore
    implements AdminBudgetVerificationEvent {
  const factory AdminBudgetVerificationStore(
          final StoreBudgetVerificationModel request) =
      _$AdminBudgetVerificationStoreImpl;

  StoreBudgetVerificationModel get request;

  /// Create a copy of AdminBudgetVerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminBudgetVerificationStoreImplCopyWith<
          _$AdminBudgetVerificationStoreImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdminBudgetVerificationUpdateImplCopyWith<$Res> {
  factory _$$AdminBudgetVerificationUpdateImplCopyWith(
          _$AdminBudgetVerificationUpdateImpl value,
          $Res Function(_$AdminBudgetVerificationUpdateImpl) then) =
      __$$AdminBudgetVerificationUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, StoreBudgetVerificationModel request});
}

/// @nodoc
class __$$AdminBudgetVerificationUpdateImplCopyWithImpl<$Res>
    extends _$AdminBudgetVerificationEventCopyWithImpl<$Res,
        _$AdminBudgetVerificationUpdateImpl>
    implements _$$AdminBudgetVerificationUpdateImplCopyWith<$Res> {
  __$$AdminBudgetVerificationUpdateImplCopyWithImpl(
      _$AdminBudgetVerificationUpdateImpl _value,
      $Res Function(_$AdminBudgetVerificationUpdateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetVerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? request = null,
  }) {
    return _then(_$AdminBudgetVerificationUpdateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as StoreBudgetVerificationModel,
    ));
  }
}

/// @nodoc

class _$AdminBudgetVerificationUpdateImpl
    implements AdminBudgetVerificationUpdate {
  const _$AdminBudgetVerificationUpdateImpl(
      {required this.id, required this.request});

  @override
  final int id;
  @override
  final StoreBudgetVerificationModel request;

  @override
  String toString() {
    return 'AdminBudgetVerificationEvent.update(id: $id, request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminBudgetVerificationUpdateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, request);

  /// Create a copy of AdminBudgetVerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminBudgetVerificationUpdateImplCopyWith<
          _$AdminBudgetVerificationUpdateImpl>
      get copyWith => __$$AdminBudgetVerificationUpdateImplCopyWithImpl<
          _$AdminBudgetVerificationUpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(StoreBudgetVerificationModel request) store,
    required TResult Function(int id, StoreBudgetVerificationModel request)
        update,
  }) {
    return update(id, request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(StoreBudgetVerificationModel request)? store,
    TResult? Function(int id, StoreBudgetVerificationModel request)? update,
  }) {
    return update?.call(id, request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? getAll,
    TResult Function(int id)? getDetail,
    TResult Function(StoreBudgetVerificationModel request)? store,
    TResult Function(int id, StoreBudgetVerificationModel request)? update,
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
    required TResult Function(AdminBudgetVerificationGetAll value) getAll,
    required TResult Function(AdminBudgetVerificationGetDetail value) getDetail,
    required TResult Function(AdminBudgetVerificationStore value) store,
    required TResult Function(AdminBudgetVerificationUpdate value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdminBudgetVerificationGetAll value)? getAll,
    TResult? Function(AdminBudgetVerificationGetDetail value)? getDetail,
    TResult? Function(AdminBudgetVerificationStore value)? store,
    TResult? Function(AdminBudgetVerificationUpdate value)? update,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdminBudgetVerificationGetAll value)? getAll,
    TResult Function(AdminBudgetVerificationGetDetail value)? getDetail,
    TResult Function(AdminBudgetVerificationStore value)? store,
    TResult Function(AdminBudgetVerificationUpdate value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class AdminBudgetVerificationUpdate
    implements AdminBudgetVerificationEvent {
  const factory AdminBudgetVerificationUpdate(
          {required final int id,
          required final StoreBudgetVerificationModel request}) =
      _$AdminBudgetVerificationUpdateImpl;

  int get id;
  StoreBudgetVerificationModel get request;

  /// Create a copy of AdminBudgetVerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminBudgetVerificationUpdateImplCopyWith<
          _$AdminBudgetVerificationUpdateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AdminBudgetVerificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(BudgetVerificationListResponseModel data) loaded,
    required TResult Function(BudgetVerificationModel data) detail,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BudgetVerificationListResponseModel data)? loaded,
    TResult? Function(BudgetVerificationModel data)? detail,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BudgetVerificationListResponseModel data)? loaded,
    TResult Function(BudgetVerificationModel data)? detail,
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
abstract class $AdminBudgetVerificationStateCopyWith<$Res> {
  factory $AdminBudgetVerificationStateCopyWith(
          AdminBudgetVerificationState value,
          $Res Function(AdminBudgetVerificationState) then) =
      _$AdminBudgetVerificationStateCopyWithImpl<$Res,
          AdminBudgetVerificationState>;
}

/// @nodoc
class _$AdminBudgetVerificationStateCopyWithImpl<$Res,
        $Val extends AdminBudgetVerificationState>
    implements $AdminBudgetVerificationStateCopyWith<$Res> {
  _$AdminBudgetVerificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminBudgetVerificationState
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
    extends _$AdminBudgetVerificationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetVerificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AdminBudgetVerificationState.initial()';
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
    required TResult Function(BudgetVerificationListResponseModel data) loaded,
    required TResult Function(BudgetVerificationModel data) detail,
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
    TResult? Function(BudgetVerificationListResponseModel data)? loaded,
    TResult? Function(BudgetVerificationModel data)? detail,
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
    TResult Function(BudgetVerificationListResponseModel data)? loaded,
    TResult Function(BudgetVerificationModel data)? detail,
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

abstract class _Initial implements AdminBudgetVerificationState {
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
    extends _$AdminBudgetVerificationStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetVerificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AdminBudgetVerificationState.loading()';
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
    required TResult Function(BudgetVerificationListResponseModel data) loaded,
    required TResult Function(BudgetVerificationModel data) detail,
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
    TResult? Function(BudgetVerificationListResponseModel data)? loaded,
    TResult? Function(BudgetVerificationModel data)? detail,
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
    TResult Function(BudgetVerificationListResponseModel data)? loaded,
    TResult Function(BudgetVerificationModel data)? detail,
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

abstract class _Loading implements AdminBudgetVerificationState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BudgetVerificationListResponseModel data});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$AdminBudgetVerificationStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetVerificationState
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
              as BudgetVerificationListResponseModel,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.data);

  @override
  final BudgetVerificationListResponseModel data;

  @override
  String toString() {
    return 'AdminBudgetVerificationState.loaded(data: $data)';
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

  /// Create a copy of AdminBudgetVerificationState
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
    required TResult Function(BudgetVerificationListResponseModel data) loaded,
    required TResult Function(BudgetVerificationModel data) detail,
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
    TResult? Function(BudgetVerificationListResponseModel data)? loaded,
    TResult? Function(BudgetVerificationModel data)? detail,
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
    TResult Function(BudgetVerificationListResponseModel data)? loaded,
    TResult Function(BudgetVerificationModel data)? detail,
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

abstract class _Loaded implements AdminBudgetVerificationState {
  const factory _Loaded(final BudgetVerificationListResponseModel data) =
      _$LoadedImpl;

  BudgetVerificationListResponseModel get data;

  /// Create a copy of AdminBudgetVerificationState
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
  $Res call({BudgetVerificationModel data});
}

/// @nodoc
class __$$DetailImplCopyWithImpl<$Res>
    extends _$AdminBudgetVerificationStateCopyWithImpl<$Res, _$DetailImpl>
    implements _$$DetailImplCopyWith<$Res> {
  __$$DetailImplCopyWithImpl(
      _$DetailImpl _value, $Res Function(_$DetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetVerificationState
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
              as BudgetVerificationModel,
    ));
  }
}

/// @nodoc

class _$DetailImpl implements _Detail {
  const _$DetailImpl(this.data);

  @override
  final BudgetVerificationModel data;

  @override
  String toString() {
    return 'AdminBudgetVerificationState.detail(data: $data)';
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

  /// Create a copy of AdminBudgetVerificationState
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
    required TResult Function(BudgetVerificationListResponseModel data) loaded,
    required TResult Function(BudgetVerificationModel data) detail,
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
    TResult? Function(BudgetVerificationListResponseModel data)? loaded,
    TResult? Function(BudgetVerificationModel data)? detail,
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
    TResult Function(BudgetVerificationListResponseModel data)? loaded,
    TResult Function(BudgetVerificationModel data)? detail,
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

abstract class _Detail implements AdminBudgetVerificationState {
  const factory _Detail(final BudgetVerificationModel data) = _$DetailImpl;

  BudgetVerificationModel get data;

  /// Create a copy of AdminBudgetVerificationState
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
    extends _$AdminBudgetVerificationStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetVerificationState
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
    return 'AdminBudgetVerificationState.success(message: $message)';
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

  /// Create a copy of AdminBudgetVerificationState
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
    required TResult Function(BudgetVerificationListResponseModel data) loaded,
    required TResult Function(BudgetVerificationModel data) detail,
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
    TResult? Function(BudgetVerificationListResponseModel data)? loaded,
    TResult? Function(BudgetVerificationModel data)? detail,
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
    TResult Function(BudgetVerificationListResponseModel data)? loaded,
    TResult Function(BudgetVerificationModel data)? detail,
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

abstract class _Success implements AdminBudgetVerificationState {
  const factory _Success(final String message) = _$SuccessImpl;

  String get message;

  /// Create a copy of AdminBudgetVerificationState
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
    extends _$AdminBudgetVerificationStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetVerificationState
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
    return 'AdminBudgetVerificationState.error(message: $message)';
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

  /// Create a copy of AdminBudgetVerificationState
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
    required TResult Function(BudgetVerificationListResponseModel data) loaded,
    required TResult Function(BudgetVerificationModel data) detail,
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
    TResult? Function(BudgetVerificationListResponseModel data)? loaded,
    TResult? Function(BudgetVerificationModel data)? detail,
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
    TResult Function(BudgetVerificationListResponseModel data)? loaded,
    TResult Function(BudgetVerificationModel data)? detail,
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

abstract class _Error implements AdminBudgetVerificationState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of AdminBudgetVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
