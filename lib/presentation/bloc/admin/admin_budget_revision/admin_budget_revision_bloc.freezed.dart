// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_budget_revision_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminBudgetRevisionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(StoreBudgetRevisionModel request) store,
    required TResult Function(int id, StoreBudgetRevisionModel request) update,
    required TResult Function(int id, ApproveRejectRevisionModel request)
        approve,
    required TResult Function(int id, ApproveRejectRevisionModel request)
        reject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(StoreBudgetRevisionModel request)? store,
    TResult? Function(int id, StoreBudgetRevisionModel request)? update,
    TResult? Function(int id, ApproveRejectRevisionModel request)? approve,
    TResult? Function(int id, ApproveRejectRevisionModel request)? reject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? getAll,
    TResult Function(int id)? getDetail,
    TResult Function(StoreBudgetRevisionModel request)? store,
    TResult Function(int id, StoreBudgetRevisionModel request)? update,
    TResult Function(int id, ApproveRejectRevisionModel request)? approve,
    TResult Function(int id, ApproveRejectRevisionModel request)? reject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AdminBudgetRevisionGetAll value) getAll,
    required TResult Function(AdminBudgetRevisionGetDetail value) getDetail,
    required TResult Function(AdminBudgetRevisionStore value) store,
    required TResult Function(AdminBudgetRevisionUpdate value) update,
    required TResult Function(AdminBudgetRevisionApprove value) approve,
    required TResult Function(AdminBudgetRevisionReject value) reject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdminBudgetRevisionGetAll value)? getAll,
    TResult? Function(AdminBudgetRevisionGetDetail value)? getDetail,
    TResult? Function(AdminBudgetRevisionStore value)? store,
    TResult? Function(AdminBudgetRevisionUpdate value)? update,
    TResult? Function(AdminBudgetRevisionApprove value)? approve,
    TResult? Function(AdminBudgetRevisionReject value)? reject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdminBudgetRevisionGetAll value)? getAll,
    TResult Function(AdminBudgetRevisionGetDetail value)? getDetail,
    TResult Function(AdminBudgetRevisionStore value)? store,
    TResult Function(AdminBudgetRevisionUpdate value)? update,
    TResult Function(AdminBudgetRevisionApprove value)? approve,
    TResult Function(AdminBudgetRevisionReject value)? reject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminBudgetRevisionEventCopyWith<$Res> {
  factory $AdminBudgetRevisionEventCopyWith(AdminBudgetRevisionEvent value,
          $Res Function(AdminBudgetRevisionEvent) then) =
      _$AdminBudgetRevisionEventCopyWithImpl<$Res, AdminBudgetRevisionEvent>;
}

/// @nodoc
class _$AdminBudgetRevisionEventCopyWithImpl<$Res,
        $Val extends AdminBudgetRevisionEvent>
    implements $AdminBudgetRevisionEventCopyWith<$Res> {
  _$AdminBudgetRevisionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AdminBudgetRevisionGetAllImplCopyWith<$Res> {
  factory _$$AdminBudgetRevisionGetAllImplCopyWith(
          _$AdminBudgetRevisionGetAllImpl value,
          $Res Function(_$AdminBudgetRevisionGetAllImpl) then) =
      __$$AdminBudgetRevisionGetAllImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, String? status});
}

/// @nodoc
class __$$AdminBudgetRevisionGetAllImplCopyWithImpl<$Res>
    extends _$AdminBudgetRevisionEventCopyWithImpl<$Res,
        _$AdminBudgetRevisionGetAllImpl>
    implements _$$AdminBudgetRevisionGetAllImplCopyWith<$Res> {
  __$$AdminBudgetRevisionGetAllImplCopyWithImpl(
      _$AdminBudgetRevisionGetAllImpl _value,
      $Res Function(_$AdminBudgetRevisionGetAllImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? status = freezed,
  }) {
    return _then(_$AdminBudgetRevisionGetAllImpl(
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

class _$AdminBudgetRevisionGetAllImpl implements AdminBudgetRevisionGetAll {
  const _$AdminBudgetRevisionGetAllImpl({this.page = 1, this.status});

  @override
  @JsonKey()
  final int page;
  @override
  final String? status;

  @override
  String toString() {
    return 'AdminBudgetRevisionEvent.getAll(page: $page, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminBudgetRevisionGetAllImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, status);

  /// Create a copy of AdminBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminBudgetRevisionGetAllImplCopyWith<_$AdminBudgetRevisionGetAllImpl>
      get copyWith => __$$AdminBudgetRevisionGetAllImplCopyWithImpl<
          _$AdminBudgetRevisionGetAllImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(StoreBudgetRevisionModel request) store,
    required TResult Function(int id, StoreBudgetRevisionModel request) update,
    required TResult Function(int id, ApproveRejectRevisionModel request)
        approve,
    required TResult Function(int id, ApproveRejectRevisionModel request)
        reject,
  }) {
    return getAll(page, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(StoreBudgetRevisionModel request)? store,
    TResult? Function(int id, StoreBudgetRevisionModel request)? update,
    TResult? Function(int id, ApproveRejectRevisionModel request)? approve,
    TResult? Function(int id, ApproveRejectRevisionModel request)? reject,
  }) {
    return getAll?.call(page, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? getAll,
    TResult Function(int id)? getDetail,
    TResult Function(StoreBudgetRevisionModel request)? store,
    TResult Function(int id, StoreBudgetRevisionModel request)? update,
    TResult Function(int id, ApproveRejectRevisionModel request)? approve,
    TResult Function(int id, ApproveRejectRevisionModel request)? reject,
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
    required TResult Function(AdminBudgetRevisionGetAll value) getAll,
    required TResult Function(AdminBudgetRevisionGetDetail value) getDetail,
    required TResult Function(AdminBudgetRevisionStore value) store,
    required TResult Function(AdminBudgetRevisionUpdate value) update,
    required TResult Function(AdminBudgetRevisionApprove value) approve,
    required TResult Function(AdminBudgetRevisionReject value) reject,
  }) {
    return getAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdminBudgetRevisionGetAll value)? getAll,
    TResult? Function(AdminBudgetRevisionGetDetail value)? getDetail,
    TResult? Function(AdminBudgetRevisionStore value)? store,
    TResult? Function(AdminBudgetRevisionUpdate value)? update,
    TResult? Function(AdminBudgetRevisionApprove value)? approve,
    TResult? Function(AdminBudgetRevisionReject value)? reject,
  }) {
    return getAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdminBudgetRevisionGetAll value)? getAll,
    TResult Function(AdminBudgetRevisionGetDetail value)? getDetail,
    TResult Function(AdminBudgetRevisionStore value)? store,
    TResult Function(AdminBudgetRevisionUpdate value)? update,
    TResult Function(AdminBudgetRevisionApprove value)? approve,
    TResult Function(AdminBudgetRevisionReject value)? reject,
    required TResult orElse(),
  }) {
    if (getAll != null) {
      return getAll(this);
    }
    return orElse();
  }
}

abstract class AdminBudgetRevisionGetAll implements AdminBudgetRevisionEvent {
  const factory AdminBudgetRevisionGetAll(
      {final int page, final String? status}) = _$AdminBudgetRevisionGetAllImpl;

  int get page;
  String? get status;

  /// Create a copy of AdminBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminBudgetRevisionGetAllImplCopyWith<_$AdminBudgetRevisionGetAllImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdminBudgetRevisionGetDetailImplCopyWith<$Res> {
  factory _$$AdminBudgetRevisionGetDetailImplCopyWith(
          _$AdminBudgetRevisionGetDetailImpl value,
          $Res Function(_$AdminBudgetRevisionGetDetailImpl) then) =
      __$$AdminBudgetRevisionGetDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$AdminBudgetRevisionGetDetailImplCopyWithImpl<$Res>
    extends _$AdminBudgetRevisionEventCopyWithImpl<$Res,
        _$AdminBudgetRevisionGetDetailImpl>
    implements _$$AdminBudgetRevisionGetDetailImplCopyWith<$Res> {
  __$$AdminBudgetRevisionGetDetailImplCopyWithImpl(
      _$AdminBudgetRevisionGetDetailImpl _value,
      $Res Function(_$AdminBudgetRevisionGetDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$AdminBudgetRevisionGetDetailImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AdminBudgetRevisionGetDetailImpl
    implements AdminBudgetRevisionGetDetail {
  const _$AdminBudgetRevisionGetDetailImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'AdminBudgetRevisionEvent.getDetail(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminBudgetRevisionGetDetailImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of AdminBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminBudgetRevisionGetDetailImplCopyWith<
          _$AdminBudgetRevisionGetDetailImpl>
      get copyWith => __$$AdminBudgetRevisionGetDetailImplCopyWithImpl<
          _$AdminBudgetRevisionGetDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(StoreBudgetRevisionModel request) store,
    required TResult Function(int id, StoreBudgetRevisionModel request) update,
    required TResult Function(int id, ApproveRejectRevisionModel request)
        approve,
    required TResult Function(int id, ApproveRejectRevisionModel request)
        reject,
  }) {
    return getDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(StoreBudgetRevisionModel request)? store,
    TResult? Function(int id, StoreBudgetRevisionModel request)? update,
    TResult? Function(int id, ApproveRejectRevisionModel request)? approve,
    TResult? Function(int id, ApproveRejectRevisionModel request)? reject,
  }) {
    return getDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? getAll,
    TResult Function(int id)? getDetail,
    TResult Function(StoreBudgetRevisionModel request)? store,
    TResult Function(int id, StoreBudgetRevisionModel request)? update,
    TResult Function(int id, ApproveRejectRevisionModel request)? approve,
    TResult Function(int id, ApproveRejectRevisionModel request)? reject,
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
    required TResult Function(AdminBudgetRevisionGetAll value) getAll,
    required TResult Function(AdminBudgetRevisionGetDetail value) getDetail,
    required TResult Function(AdminBudgetRevisionStore value) store,
    required TResult Function(AdminBudgetRevisionUpdate value) update,
    required TResult Function(AdminBudgetRevisionApprove value) approve,
    required TResult Function(AdminBudgetRevisionReject value) reject,
  }) {
    return getDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdminBudgetRevisionGetAll value)? getAll,
    TResult? Function(AdminBudgetRevisionGetDetail value)? getDetail,
    TResult? Function(AdminBudgetRevisionStore value)? store,
    TResult? Function(AdminBudgetRevisionUpdate value)? update,
    TResult? Function(AdminBudgetRevisionApprove value)? approve,
    TResult? Function(AdminBudgetRevisionReject value)? reject,
  }) {
    return getDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdminBudgetRevisionGetAll value)? getAll,
    TResult Function(AdminBudgetRevisionGetDetail value)? getDetail,
    TResult Function(AdminBudgetRevisionStore value)? store,
    TResult Function(AdminBudgetRevisionUpdate value)? update,
    TResult Function(AdminBudgetRevisionApprove value)? approve,
    TResult Function(AdminBudgetRevisionReject value)? reject,
    required TResult orElse(),
  }) {
    if (getDetail != null) {
      return getDetail(this);
    }
    return orElse();
  }
}

abstract class AdminBudgetRevisionGetDetail
    implements AdminBudgetRevisionEvent {
  const factory AdminBudgetRevisionGetDetail(final int id) =
      _$AdminBudgetRevisionGetDetailImpl;

  int get id;

  /// Create a copy of AdminBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminBudgetRevisionGetDetailImplCopyWith<
          _$AdminBudgetRevisionGetDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdminBudgetRevisionStoreImplCopyWith<$Res> {
  factory _$$AdminBudgetRevisionStoreImplCopyWith(
          _$AdminBudgetRevisionStoreImpl value,
          $Res Function(_$AdminBudgetRevisionStoreImpl) then) =
      __$$AdminBudgetRevisionStoreImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StoreBudgetRevisionModel request});
}

/// @nodoc
class __$$AdminBudgetRevisionStoreImplCopyWithImpl<$Res>
    extends _$AdminBudgetRevisionEventCopyWithImpl<$Res,
        _$AdminBudgetRevisionStoreImpl>
    implements _$$AdminBudgetRevisionStoreImplCopyWith<$Res> {
  __$$AdminBudgetRevisionStoreImplCopyWithImpl(
      _$AdminBudgetRevisionStoreImpl _value,
      $Res Function(_$AdminBudgetRevisionStoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$AdminBudgetRevisionStoreImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as StoreBudgetRevisionModel,
    ));
  }
}

/// @nodoc

class _$AdminBudgetRevisionStoreImpl implements AdminBudgetRevisionStore {
  const _$AdminBudgetRevisionStoreImpl(this.request);

  @override
  final StoreBudgetRevisionModel request;

  @override
  String toString() {
    return 'AdminBudgetRevisionEvent.store(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminBudgetRevisionStoreImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of AdminBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminBudgetRevisionStoreImplCopyWith<_$AdminBudgetRevisionStoreImpl>
      get copyWith => __$$AdminBudgetRevisionStoreImplCopyWithImpl<
          _$AdminBudgetRevisionStoreImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(StoreBudgetRevisionModel request) store,
    required TResult Function(int id, StoreBudgetRevisionModel request) update,
    required TResult Function(int id, ApproveRejectRevisionModel request)
        approve,
    required TResult Function(int id, ApproveRejectRevisionModel request)
        reject,
  }) {
    return store(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(StoreBudgetRevisionModel request)? store,
    TResult? Function(int id, StoreBudgetRevisionModel request)? update,
    TResult? Function(int id, ApproveRejectRevisionModel request)? approve,
    TResult? Function(int id, ApproveRejectRevisionModel request)? reject,
  }) {
    return store?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? getAll,
    TResult Function(int id)? getDetail,
    TResult Function(StoreBudgetRevisionModel request)? store,
    TResult Function(int id, StoreBudgetRevisionModel request)? update,
    TResult Function(int id, ApproveRejectRevisionModel request)? approve,
    TResult Function(int id, ApproveRejectRevisionModel request)? reject,
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
    required TResult Function(AdminBudgetRevisionGetAll value) getAll,
    required TResult Function(AdminBudgetRevisionGetDetail value) getDetail,
    required TResult Function(AdminBudgetRevisionStore value) store,
    required TResult Function(AdminBudgetRevisionUpdate value) update,
    required TResult Function(AdminBudgetRevisionApprove value) approve,
    required TResult Function(AdminBudgetRevisionReject value) reject,
  }) {
    return store(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdminBudgetRevisionGetAll value)? getAll,
    TResult? Function(AdminBudgetRevisionGetDetail value)? getDetail,
    TResult? Function(AdminBudgetRevisionStore value)? store,
    TResult? Function(AdminBudgetRevisionUpdate value)? update,
    TResult? Function(AdminBudgetRevisionApprove value)? approve,
    TResult? Function(AdminBudgetRevisionReject value)? reject,
  }) {
    return store?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdminBudgetRevisionGetAll value)? getAll,
    TResult Function(AdminBudgetRevisionGetDetail value)? getDetail,
    TResult Function(AdminBudgetRevisionStore value)? store,
    TResult Function(AdminBudgetRevisionUpdate value)? update,
    TResult Function(AdminBudgetRevisionApprove value)? approve,
    TResult Function(AdminBudgetRevisionReject value)? reject,
    required TResult orElse(),
  }) {
    if (store != null) {
      return store(this);
    }
    return orElse();
  }
}

abstract class AdminBudgetRevisionStore implements AdminBudgetRevisionEvent {
  const factory AdminBudgetRevisionStore(
      final StoreBudgetRevisionModel request) = _$AdminBudgetRevisionStoreImpl;

  StoreBudgetRevisionModel get request;

  /// Create a copy of AdminBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminBudgetRevisionStoreImplCopyWith<_$AdminBudgetRevisionStoreImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdminBudgetRevisionUpdateImplCopyWith<$Res> {
  factory _$$AdminBudgetRevisionUpdateImplCopyWith(
          _$AdminBudgetRevisionUpdateImpl value,
          $Res Function(_$AdminBudgetRevisionUpdateImpl) then) =
      __$$AdminBudgetRevisionUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, StoreBudgetRevisionModel request});
}

/// @nodoc
class __$$AdminBudgetRevisionUpdateImplCopyWithImpl<$Res>
    extends _$AdminBudgetRevisionEventCopyWithImpl<$Res,
        _$AdminBudgetRevisionUpdateImpl>
    implements _$$AdminBudgetRevisionUpdateImplCopyWith<$Res> {
  __$$AdminBudgetRevisionUpdateImplCopyWithImpl(
      _$AdminBudgetRevisionUpdateImpl _value,
      $Res Function(_$AdminBudgetRevisionUpdateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? request = null,
  }) {
    return _then(_$AdminBudgetRevisionUpdateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as StoreBudgetRevisionModel,
    ));
  }
}

/// @nodoc

class _$AdminBudgetRevisionUpdateImpl implements AdminBudgetRevisionUpdate {
  const _$AdminBudgetRevisionUpdateImpl(
      {required this.id, required this.request});

  @override
  final int id;
  @override
  final StoreBudgetRevisionModel request;

  @override
  String toString() {
    return 'AdminBudgetRevisionEvent.update(id: $id, request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminBudgetRevisionUpdateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, request);

  /// Create a copy of AdminBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminBudgetRevisionUpdateImplCopyWith<_$AdminBudgetRevisionUpdateImpl>
      get copyWith => __$$AdminBudgetRevisionUpdateImplCopyWithImpl<
          _$AdminBudgetRevisionUpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(StoreBudgetRevisionModel request) store,
    required TResult Function(int id, StoreBudgetRevisionModel request) update,
    required TResult Function(int id, ApproveRejectRevisionModel request)
        approve,
    required TResult Function(int id, ApproveRejectRevisionModel request)
        reject,
  }) {
    return update(id, request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(StoreBudgetRevisionModel request)? store,
    TResult? Function(int id, StoreBudgetRevisionModel request)? update,
    TResult? Function(int id, ApproveRejectRevisionModel request)? approve,
    TResult? Function(int id, ApproveRejectRevisionModel request)? reject,
  }) {
    return update?.call(id, request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? getAll,
    TResult Function(int id)? getDetail,
    TResult Function(StoreBudgetRevisionModel request)? store,
    TResult Function(int id, StoreBudgetRevisionModel request)? update,
    TResult Function(int id, ApproveRejectRevisionModel request)? approve,
    TResult Function(int id, ApproveRejectRevisionModel request)? reject,
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
    required TResult Function(AdminBudgetRevisionGetAll value) getAll,
    required TResult Function(AdminBudgetRevisionGetDetail value) getDetail,
    required TResult Function(AdminBudgetRevisionStore value) store,
    required TResult Function(AdminBudgetRevisionUpdate value) update,
    required TResult Function(AdminBudgetRevisionApprove value) approve,
    required TResult Function(AdminBudgetRevisionReject value) reject,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdminBudgetRevisionGetAll value)? getAll,
    TResult? Function(AdminBudgetRevisionGetDetail value)? getDetail,
    TResult? Function(AdminBudgetRevisionStore value)? store,
    TResult? Function(AdminBudgetRevisionUpdate value)? update,
    TResult? Function(AdminBudgetRevisionApprove value)? approve,
    TResult? Function(AdminBudgetRevisionReject value)? reject,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdminBudgetRevisionGetAll value)? getAll,
    TResult Function(AdminBudgetRevisionGetDetail value)? getDetail,
    TResult Function(AdminBudgetRevisionStore value)? store,
    TResult Function(AdminBudgetRevisionUpdate value)? update,
    TResult Function(AdminBudgetRevisionApprove value)? approve,
    TResult Function(AdminBudgetRevisionReject value)? reject,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class AdminBudgetRevisionUpdate implements AdminBudgetRevisionEvent {
  const factory AdminBudgetRevisionUpdate(
          {required final int id,
          required final StoreBudgetRevisionModel request}) =
      _$AdminBudgetRevisionUpdateImpl;

  int get id;
  StoreBudgetRevisionModel get request;

  /// Create a copy of AdminBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminBudgetRevisionUpdateImplCopyWith<_$AdminBudgetRevisionUpdateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdminBudgetRevisionApproveImplCopyWith<$Res> {
  factory _$$AdminBudgetRevisionApproveImplCopyWith(
          _$AdminBudgetRevisionApproveImpl value,
          $Res Function(_$AdminBudgetRevisionApproveImpl) then) =
      __$$AdminBudgetRevisionApproveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, ApproveRejectRevisionModel request});
}

/// @nodoc
class __$$AdminBudgetRevisionApproveImplCopyWithImpl<$Res>
    extends _$AdminBudgetRevisionEventCopyWithImpl<$Res,
        _$AdminBudgetRevisionApproveImpl>
    implements _$$AdminBudgetRevisionApproveImplCopyWith<$Res> {
  __$$AdminBudgetRevisionApproveImplCopyWithImpl(
      _$AdminBudgetRevisionApproveImpl _value,
      $Res Function(_$AdminBudgetRevisionApproveImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? request = null,
  }) {
    return _then(_$AdminBudgetRevisionApproveImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as ApproveRejectRevisionModel,
    ));
  }
}

/// @nodoc

class _$AdminBudgetRevisionApproveImpl implements AdminBudgetRevisionApprove {
  const _$AdminBudgetRevisionApproveImpl(
      {required this.id, required this.request});

  @override
  final int id;
  @override
  final ApproveRejectRevisionModel request;

  @override
  String toString() {
    return 'AdminBudgetRevisionEvent.approve(id: $id, request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminBudgetRevisionApproveImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, request);

  /// Create a copy of AdminBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminBudgetRevisionApproveImplCopyWith<_$AdminBudgetRevisionApproveImpl>
      get copyWith => __$$AdminBudgetRevisionApproveImplCopyWithImpl<
          _$AdminBudgetRevisionApproveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(StoreBudgetRevisionModel request) store,
    required TResult Function(int id, StoreBudgetRevisionModel request) update,
    required TResult Function(int id, ApproveRejectRevisionModel request)
        approve,
    required TResult Function(int id, ApproveRejectRevisionModel request)
        reject,
  }) {
    return approve(id, request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(StoreBudgetRevisionModel request)? store,
    TResult? Function(int id, StoreBudgetRevisionModel request)? update,
    TResult? Function(int id, ApproveRejectRevisionModel request)? approve,
    TResult? Function(int id, ApproveRejectRevisionModel request)? reject,
  }) {
    return approve?.call(id, request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? getAll,
    TResult Function(int id)? getDetail,
    TResult Function(StoreBudgetRevisionModel request)? store,
    TResult Function(int id, StoreBudgetRevisionModel request)? update,
    TResult Function(int id, ApproveRejectRevisionModel request)? approve,
    TResult Function(int id, ApproveRejectRevisionModel request)? reject,
    required TResult orElse(),
  }) {
    if (approve != null) {
      return approve(id, request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AdminBudgetRevisionGetAll value) getAll,
    required TResult Function(AdminBudgetRevisionGetDetail value) getDetail,
    required TResult Function(AdminBudgetRevisionStore value) store,
    required TResult Function(AdminBudgetRevisionUpdate value) update,
    required TResult Function(AdminBudgetRevisionApprove value) approve,
    required TResult Function(AdminBudgetRevisionReject value) reject,
  }) {
    return approve(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdminBudgetRevisionGetAll value)? getAll,
    TResult? Function(AdminBudgetRevisionGetDetail value)? getDetail,
    TResult? Function(AdminBudgetRevisionStore value)? store,
    TResult? Function(AdminBudgetRevisionUpdate value)? update,
    TResult? Function(AdminBudgetRevisionApprove value)? approve,
    TResult? Function(AdminBudgetRevisionReject value)? reject,
  }) {
    return approve?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdminBudgetRevisionGetAll value)? getAll,
    TResult Function(AdminBudgetRevisionGetDetail value)? getDetail,
    TResult Function(AdminBudgetRevisionStore value)? store,
    TResult Function(AdminBudgetRevisionUpdate value)? update,
    TResult Function(AdminBudgetRevisionApprove value)? approve,
    TResult Function(AdminBudgetRevisionReject value)? reject,
    required TResult orElse(),
  }) {
    if (approve != null) {
      return approve(this);
    }
    return orElse();
  }
}

abstract class AdminBudgetRevisionApprove implements AdminBudgetRevisionEvent {
  const factory AdminBudgetRevisionApprove(
          {required final int id,
          required final ApproveRejectRevisionModel request}) =
      _$AdminBudgetRevisionApproveImpl;

  int get id;
  ApproveRejectRevisionModel get request;

  /// Create a copy of AdminBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminBudgetRevisionApproveImplCopyWith<_$AdminBudgetRevisionApproveImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdminBudgetRevisionRejectImplCopyWith<$Res> {
  factory _$$AdminBudgetRevisionRejectImplCopyWith(
          _$AdminBudgetRevisionRejectImpl value,
          $Res Function(_$AdminBudgetRevisionRejectImpl) then) =
      __$$AdminBudgetRevisionRejectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, ApproveRejectRevisionModel request});
}

/// @nodoc
class __$$AdminBudgetRevisionRejectImplCopyWithImpl<$Res>
    extends _$AdminBudgetRevisionEventCopyWithImpl<$Res,
        _$AdminBudgetRevisionRejectImpl>
    implements _$$AdminBudgetRevisionRejectImplCopyWith<$Res> {
  __$$AdminBudgetRevisionRejectImplCopyWithImpl(
      _$AdminBudgetRevisionRejectImpl _value,
      $Res Function(_$AdminBudgetRevisionRejectImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? request = null,
  }) {
    return _then(_$AdminBudgetRevisionRejectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as ApproveRejectRevisionModel,
    ));
  }
}

/// @nodoc

class _$AdminBudgetRevisionRejectImpl implements AdminBudgetRevisionReject {
  const _$AdminBudgetRevisionRejectImpl(
      {required this.id, required this.request});

  @override
  final int id;
  @override
  final ApproveRejectRevisionModel request;

  @override
  String toString() {
    return 'AdminBudgetRevisionEvent.reject(id: $id, request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminBudgetRevisionRejectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, request);

  /// Create a copy of AdminBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminBudgetRevisionRejectImplCopyWith<_$AdminBudgetRevisionRejectImpl>
      get copyWith => __$$AdminBudgetRevisionRejectImplCopyWithImpl<
          _$AdminBudgetRevisionRejectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(StoreBudgetRevisionModel request) store,
    required TResult Function(int id, StoreBudgetRevisionModel request) update,
    required TResult Function(int id, ApproveRejectRevisionModel request)
        approve,
    required TResult Function(int id, ApproveRejectRevisionModel request)
        reject,
  }) {
    return reject(id, request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(StoreBudgetRevisionModel request)? store,
    TResult? Function(int id, StoreBudgetRevisionModel request)? update,
    TResult? Function(int id, ApproveRejectRevisionModel request)? approve,
    TResult? Function(int id, ApproveRejectRevisionModel request)? reject,
  }) {
    return reject?.call(id, request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? getAll,
    TResult Function(int id)? getDetail,
    TResult Function(StoreBudgetRevisionModel request)? store,
    TResult Function(int id, StoreBudgetRevisionModel request)? update,
    TResult Function(int id, ApproveRejectRevisionModel request)? approve,
    TResult Function(int id, ApproveRejectRevisionModel request)? reject,
    required TResult orElse(),
  }) {
    if (reject != null) {
      return reject(id, request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AdminBudgetRevisionGetAll value) getAll,
    required TResult Function(AdminBudgetRevisionGetDetail value) getDetail,
    required TResult Function(AdminBudgetRevisionStore value) store,
    required TResult Function(AdminBudgetRevisionUpdate value) update,
    required TResult Function(AdminBudgetRevisionApprove value) approve,
    required TResult Function(AdminBudgetRevisionReject value) reject,
  }) {
    return reject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdminBudgetRevisionGetAll value)? getAll,
    TResult? Function(AdminBudgetRevisionGetDetail value)? getDetail,
    TResult? Function(AdminBudgetRevisionStore value)? store,
    TResult? Function(AdminBudgetRevisionUpdate value)? update,
    TResult? Function(AdminBudgetRevisionApprove value)? approve,
    TResult? Function(AdminBudgetRevisionReject value)? reject,
  }) {
    return reject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdminBudgetRevisionGetAll value)? getAll,
    TResult Function(AdminBudgetRevisionGetDetail value)? getDetail,
    TResult Function(AdminBudgetRevisionStore value)? store,
    TResult Function(AdminBudgetRevisionUpdate value)? update,
    TResult Function(AdminBudgetRevisionApprove value)? approve,
    TResult Function(AdminBudgetRevisionReject value)? reject,
    required TResult orElse(),
  }) {
    if (reject != null) {
      return reject(this);
    }
    return orElse();
  }
}

abstract class AdminBudgetRevisionReject implements AdminBudgetRevisionEvent {
  const factory AdminBudgetRevisionReject(
          {required final int id,
          required final ApproveRejectRevisionModel request}) =
      _$AdminBudgetRevisionRejectImpl;

  int get id;
  ApproveRejectRevisionModel get request;

  /// Create a copy of AdminBudgetRevisionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminBudgetRevisionRejectImplCopyWith<_$AdminBudgetRevisionRejectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AdminBudgetRevisionState {
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
abstract class $AdminBudgetRevisionStateCopyWith<$Res> {
  factory $AdminBudgetRevisionStateCopyWith(AdminBudgetRevisionState value,
          $Res Function(AdminBudgetRevisionState) then) =
      _$AdminBudgetRevisionStateCopyWithImpl<$Res, AdminBudgetRevisionState>;
}

/// @nodoc
class _$AdminBudgetRevisionStateCopyWithImpl<$Res,
        $Val extends AdminBudgetRevisionState>
    implements $AdminBudgetRevisionStateCopyWith<$Res> {
  _$AdminBudgetRevisionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminBudgetRevisionState
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
    extends _$AdminBudgetRevisionStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetRevisionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AdminBudgetRevisionState.initial()';
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

abstract class _Initial implements AdminBudgetRevisionState {
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
    extends _$AdminBudgetRevisionStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetRevisionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AdminBudgetRevisionState.loading()';
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

abstract class _Loading implements AdminBudgetRevisionState {
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
    extends _$AdminBudgetRevisionStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetRevisionState
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
    return 'AdminBudgetRevisionState.loaded(data: $data)';
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

  /// Create a copy of AdminBudgetRevisionState
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

abstract class _Loaded implements AdminBudgetRevisionState {
  const factory _Loaded(final BudgetRevisionListResponseModel data) =
      _$LoadedImpl;

  BudgetRevisionListResponseModel get data;

  /// Create a copy of AdminBudgetRevisionState
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
    extends _$AdminBudgetRevisionStateCopyWithImpl<$Res, _$DetailImpl>
    implements _$$DetailImplCopyWith<$Res> {
  __$$DetailImplCopyWithImpl(
      _$DetailImpl _value, $Res Function(_$DetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetRevisionState
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
    return 'AdminBudgetRevisionState.detail(data: $data)';
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

  /// Create a copy of AdminBudgetRevisionState
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

abstract class _Detail implements AdminBudgetRevisionState {
  const factory _Detail(final BudgetRevisionModel data) = _$DetailImpl;

  BudgetRevisionModel get data;

  /// Create a copy of AdminBudgetRevisionState
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
    extends _$AdminBudgetRevisionStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetRevisionState
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
    return 'AdminBudgetRevisionState.success(message: $message)';
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

  /// Create a copy of AdminBudgetRevisionState
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

abstract class _Success implements AdminBudgetRevisionState {
  const factory _Success(final String message) = _$SuccessImpl;

  String get message;

  /// Create a copy of AdminBudgetRevisionState
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
    extends _$AdminBudgetRevisionStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetRevisionState
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
    return 'AdminBudgetRevisionState.error(message: $message)';
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

  /// Create a copy of AdminBudgetRevisionState
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

abstract class _Error implements AdminBudgetRevisionState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of AdminBudgetRevisionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
