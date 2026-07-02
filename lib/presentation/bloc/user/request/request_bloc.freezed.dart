// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RequestEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) loadMyRequests,
    required TResult Function(int page, String? status) loadAllRequests,
    required TResult Function(int id) loadDetail,
    required TResult Function(StoreStockRequestModel request) storeRequest,
    required TResult Function(int id, UpdateStockRequestModel request)
        updateRequest,
    required TResult Function(int id) deleteRequest,
    required TResult Function(int id, ApproveRequestModel request)
        approveRequest,
    required TResult Function(int id, RejectRequestModel request) rejectRequest,
    required TResult Function(int id) completeRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? loadMyRequests,
    TResult? Function(int page, String? status)? loadAllRequests,
    TResult? Function(int id)? loadDetail,
    TResult? Function(StoreStockRequestModel request)? storeRequest,
    TResult? Function(int id, UpdateStockRequestModel request)? updateRequest,
    TResult? Function(int id)? deleteRequest,
    TResult? Function(int id, ApproveRequestModel request)? approveRequest,
    TResult? Function(int id, RejectRequestModel request)? rejectRequest,
    TResult? Function(int id)? completeRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? loadMyRequests,
    TResult Function(int page, String? status)? loadAllRequests,
    TResult Function(int id)? loadDetail,
    TResult Function(StoreStockRequestModel request)? storeRequest,
    TResult Function(int id, UpdateStockRequestModel request)? updateRequest,
    TResult Function(int id)? deleteRequest,
    TResult Function(int id, ApproveRequestModel request)? approveRequest,
    TResult Function(int id, RejectRequestModel request)? rejectRequest,
    TResult Function(int id)? completeRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMyRequests value) loadMyRequests,
    required TResult Function(_LoadAllRequests value) loadAllRequests,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_StoreRequest value) storeRequest,
    required TResult Function(_UpdateRequest value) updateRequest,
    required TResult Function(_DeleteRequest value) deleteRequest,
    required TResult Function(_ApproveRequest value) approveRequest,
    required TResult Function(_RejectRequest value) rejectRequest,
    required TResult Function(_CompleteRequest value) completeRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadMyRequests value)? loadMyRequests,
    TResult? Function(_LoadAllRequests value)? loadAllRequests,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_StoreRequest value)? storeRequest,
    TResult? Function(_UpdateRequest value)? updateRequest,
    TResult? Function(_DeleteRequest value)? deleteRequest,
    TResult? Function(_ApproveRequest value)? approveRequest,
    TResult? Function(_RejectRequest value)? rejectRequest,
    TResult? Function(_CompleteRequest value)? completeRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMyRequests value)? loadMyRequests,
    TResult Function(_LoadAllRequests value)? loadAllRequests,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_StoreRequest value)? storeRequest,
    TResult Function(_UpdateRequest value)? updateRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
    TResult Function(_ApproveRequest value)? approveRequest,
    TResult Function(_RejectRequest value)? rejectRequest,
    TResult Function(_CompleteRequest value)? completeRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestEventCopyWith<$Res> {
  factory $RequestEventCopyWith(
          RequestEvent value, $Res Function(RequestEvent) then) =
      _$RequestEventCopyWithImpl<$Res, RequestEvent>;
}

/// @nodoc
class _$RequestEventCopyWithImpl<$Res, $Val extends RequestEvent>
    implements $RequestEventCopyWith<$Res> {
  _$RequestEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadMyRequestsImplCopyWith<$Res> {
  factory _$$LoadMyRequestsImplCopyWith(_$LoadMyRequestsImpl value,
          $Res Function(_$LoadMyRequestsImpl) then) =
      __$$LoadMyRequestsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, String? status});
}

/// @nodoc
class __$$LoadMyRequestsImplCopyWithImpl<$Res>
    extends _$RequestEventCopyWithImpl<$Res, _$LoadMyRequestsImpl>
    implements _$$LoadMyRequestsImplCopyWith<$Res> {
  __$$LoadMyRequestsImplCopyWithImpl(
      _$LoadMyRequestsImpl _value, $Res Function(_$LoadMyRequestsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? status = freezed,
  }) {
    return _then(_$LoadMyRequestsImpl(
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

class _$LoadMyRequestsImpl implements _LoadMyRequests {
  const _$LoadMyRequestsImpl({this.page = 1, this.status});

  @override
  @JsonKey()
  final int page;
  @override
  final String? status;

  @override
  String toString() {
    return 'RequestEvent.loadMyRequests(page: $page, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMyRequestsImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, status);

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMyRequestsImplCopyWith<_$LoadMyRequestsImpl> get copyWith =>
      __$$LoadMyRequestsImplCopyWithImpl<_$LoadMyRequestsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) loadMyRequests,
    required TResult Function(int page, String? status) loadAllRequests,
    required TResult Function(int id) loadDetail,
    required TResult Function(StoreStockRequestModel request) storeRequest,
    required TResult Function(int id, UpdateStockRequestModel request)
        updateRequest,
    required TResult Function(int id) deleteRequest,
    required TResult Function(int id, ApproveRequestModel request)
        approveRequest,
    required TResult Function(int id, RejectRequestModel request) rejectRequest,
    required TResult Function(int id) completeRequest,
  }) {
    return loadMyRequests(page, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? loadMyRequests,
    TResult? Function(int page, String? status)? loadAllRequests,
    TResult? Function(int id)? loadDetail,
    TResult? Function(StoreStockRequestModel request)? storeRequest,
    TResult? Function(int id, UpdateStockRequestModel request)? updateRequest,
    TResult? Function(int id)? deleteRequest,
    TResult? Function(int id, ApproveRequestModel request)? approveRequest,
    TResult? Function(int id, RejectRequestModel request)? rejectRequest,
    TResult? Function(int id)? completeRequest,
  }) {
    return loadMyRequests?.call(page, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? loadMyRequests,
    TResult Function(int page, String? status)? loadAllRequests,
    TResult Function(int id)? loadDetail,
    TResult Function(StoreStockRequestModel request)? storeRequest,
    TResult Function(int id, UpdateStockRequestModel request)? updateRequest,
    TResult Function(int id)? deleteRequest,
    TResult Function(int id, ApproveRequestModel request)? approveRequest,
    TResult Function(int id, RejectRequestModel request)? rejectRequest,
    TResult Function(int id)? completeRequest,
    required TResult orElse(),
  }) {
    if (loadMyRequests != null) {
      return loadMyRequests(page, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMyRequests value) loadMyRequests,
    required TResult Function(_LoadAllRequests value) loadAllRequests,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_StoreRequest value) storeRequest,
    required TResult Function(_UpdateRequest value) updateRequest,
    required TResult Function(_DeleteRequest value) deleteRequest,
    required TResult Function(_ApproveRequest value) approveRequest,
    required TResult Function(_RejectRequest value) rejectRequest,
    required TResult Function(_CompleteRequest value) completeRequest,
  }) {
    return loadMyRequests(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadMyRequests value)? loadMyRequests,
    TResult? Function(_LoadAllRequests value)? loadAllRequests,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_StoreRequest value)? storeRequest,
    TResult? Function(_UpdateRequest value)? updateRequest,
    TResult? Function(_DeleteRequest value)? deleteRequest,
    TResult? Function(_ApproveRequest value)? approveRequest,
    TResult? Function(_RejectRequest value)? rejectRequest,
    TResult? Function(_CompleteRequest value)? completeRequest,
  }) {
    return loadMyRequests?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMyRequests value)? loadMyRequests,
    TResult Function(_LoadAllRequests value)? loadAllRequests,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_StoreRequest value)? storeRequest,
    TResult Function(_UpdateRequest value)? updateRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
    TResult Function(_ApproveRequest value)? approveRequest,
    TResult Function(_RejectRequest value)? rejectRequest,
    TResult Function(_CompleteRequest value)? completeRequest,
    required TResult orElse(),
  }) {
    if (loadMyRequests != null) {
      return loadMyRequests(this);
    }
    return orElse();
  }
}

abstract class _LoadMyRequests implements RequestEvent {
  const factory _LoadMyRequests({final int page, final String? status}) =
      _$LoadMyRequestsImpl;

  int get page;
  String? get status;

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadMyRequestsImplCopyWith<_$LoadMyRequestsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadAllRequestsImplCopyWith<$Res> {
  factory _$$LoadAllRequestsImplCopyWith(_$LoadAllRequestsImpl value,
          $Res Function(_$LoadAllRequestsImpl) then) =
      __$$LoadAllRequestsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, String? status});
}

/// @nodoc
class __$$LoadAllRequestsImplCopyWithImpl<$Res>
    extends _$RequestEventCopyWithImpl<$Res, _$LoadAllRequestsImpl>
    implements _$$LoadAllRequestsImplCopyWith<$Res> {
  __$$LoadAllRequestsImplCopyWithImpl(
      _$LoadAllRequestsImpl _value, $Res Function(_$LoadAllRequestsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? status = freezed,
  }) {
    return _then(_$LoadAllRequestsImpl(
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

class _$LoadAllRequestsImpl implements _LoadAllRequests {
  const _$LoadAllRequestsImpl({this.page = 1, this.status});

  @override
  @JsonKey()
  final int page;
  @override
  final String? status;

  @override
  String toString() {
    return 'RequestEvent.loadAllRequests(page: $page, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadAllRequestsImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, status);

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadAllRequestsImplCopyWith<_$LoadAllRequestsImpl> get copyWith =>
      __$$LoadAllRequestsImplCopyWithImpl<_$LoadAllRequestsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) loadMyRequests,
    required TResult Function(int page, String? status) loadAllRequests,
    required TResult Function(int id) loadDetail,
    required TResult Function(StoreStockRequestModel request) storeRequest,
    required TResult Function(int id, UpdateStockRequestModel request)
        updateRequest,
    required TResult Function(int id) deleteRequest,
    required TResult Function(int id, ApproveRequestModel request)
        approveRequest,
    required TResult Function(int id, RejectRequestModel request) rejectRequest,
    required TResult Function(int id) completeRequest,
  }) {
    return loadAllRequests(page, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? loadMyRequests,
    TResult? Function(int page, String? status)? loadAllRequests,
    TResult? Function(int id)? loadDetail,
    TResult? Function(StoreStockRequestModel request)? storeRequest,
    TResult? Function(int id, UpdateStockRequestModel request)? updateRequest,
    TResult? Function(int id)? deleteRequest,
    TResult? Function(int id, ApproveRequestModel request)? approveRequest,
    TResult? Function(int id, RejectRequestModel request)? rejectRequest,
    TResult? Function(int id)? completeRequest,
  }) {
    return loadAllRequests?.call(page, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? loadMyRequests,
    TResult Function(int page, String? status)? loadAllRequests,
    TResult Function(int id)? loadDetail,
    TResult Function(StoreStockRequestModel request)? storeRequest,
    TResult Function(int id, UpdateStockRequestModel request)? updateRequest,
    TResult Function(int id)? deleteRequest,
    TResult Function(int id, ApproveRequestModel request)? approveRequest,
    TResult Function(int id, RejectRequestModel request)? rejectRequest,
    TResult Function(int id)? completeRequest,
    required TResult orElse(),
  }) {
    if (loadAllRequests != null) {
      return loadAllRequests(page, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMyRequests value) loadMyRequests,
    required TResult Function(_LoadAllRequests value) loadAllRequests,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_StoreRequest value) storeRequest,
    required TResult Function(_UpdateRequest value) updateRequest,
    required TResult Function(_DeleteRequest value) deleteRequest,
    required TResult Function(_ApproveRequest value) approveRequest,
    required TResult Function(_RejectRequest value) rejectRequest,
    required TResult Function(_CompleteRequest value) completeRequest,
  }) {
    return loadAllRequests(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadMyRequests value)? loadMyRequests,
    TResult? Function(_LoadAllRequests value)? loadAllRequests,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_StoreRequest value)? storeRequest,
    TResult? Function(_UpdateRequest value)? updateRequest,
    TResult? Function(_DeleteRequest value)? deleteRequest,
    TResult? Function(_ApproveRequest value)? approveRequest,
    TResult? Function(_RejectRequest value)? rejectRequest,
    TResult? Function(_CompleteRequest value)? completeRequest,
  }) {
    return loadAllRequests?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMyRequests value)? loadMyRequests,
    TResult Function(_LoadAllRequests value)? loadAllRequests,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_StoreRequest value)? storeRequest,
    TResult Function(_UpdateRequest value)? updateRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
    TResult Function(_ApproveRequest value)? approveRequest,
    TResult Function(_RejectRequest value)? rejectRequest,
    TResult Function(_CompleteRequest value)? completeRequest,
    required TResult orElse(),
  }) {
    if (loadAllRequests != null) {
      return loadAllRequests(this);
    }
    return orElse();
  }
}

abstract class _LoadAllRequests implements RequestEvent {
  const factory _LoadAllRequests({final int page, final String? status}) =
      _$LoadAllRequestsImpl;

  int get page;
  String? get status;

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadAllRequestsImplCopyWith<_$LoadAllRequestsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadDetailImplCopyWith<$Res> {
  factory _$$LoadDetailImplCopyWith(
          _$LoadDetailImpl value, $Res Function(_$LoadDetailImpl) then) =
      __$$LoadDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$LoadDetailImplCopyWithImpl<$Res>
    extends _$RequestEventCopyWithImpl<$Res, _$LoadDetailImpl>
    implements _$$LoadDetailImplCopyWith<$Res> {
  __$$LoadDetailImplCopyWithImpl(
      _$LoadDetailImpl _value, $Res Function(_$LoadDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$LoadDetailImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadDetailImpl implements _LoadDetail {
  const _$LoadDetailImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'RequestEvent.loadDetail(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadDetailImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadDetailImplCopyWith<_$LoadDetailImpl> get copyWith =>
      __$$LoadDetailImplCopyWithImpl<_$LoadDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) loadMyRequests,
    required TResult Function(int page, String? status) loadAllRequests,
    required TResult Function(int id) loadDetail,
    required TResult Function(StoreStockRequestModel request) storeRequest,
    required TResult Function(int id, UpdateStockRequestModel request)
        updateRequest,
    required TResult Function(int id) deleteRequest,
    required TResult Function(int id, ApproveRequestModel request)
        approveRequest,
    required TResult Function(int id, RejectRequestModel request) rejectRequest,
    required TResult Function(int id) completeRequest,
  }) {
    return loadDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? loadMyRequests,
    TResult? Function(int page, String? status)? loadAllRequests,
    TResult? Function(int id)? loadDetail,
    TResult? Function(StoreStockRequestModel request)? storeRequest,
    TResult? Function(int id, UpdateStockRequestModel request)? updateRequest,
    TResult? Function(int id)? deleteRequest,
    TResult? Function(int id, ApproveRequestModel request)? approveRequest,
    TResult? Function(int id, RejectRequestModel request)? rejectRequest,
    TResult? Function(int id)? completeRequest,
  }) {
    return loadDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? loadMyRequests,
    TResult Function(int page, String? status)? loadAllRequests,
    TResult Function(int id)? loadDetail,
    TResult Function(StoreStockRequestModel request)? storeRequest,
    TResult Function(int id, UpdateStockRequestModel request)? updateRequest,
    TResult Function(int id)? deleteRequest,
    TResult Function(int id, ApproveRequestModel request)? approveRequest,
    TResult Function(int id, RejectRequestModel request)? rejectRequest,
    TResult Function(int id)? completeRequest,
    required TResult orElse(),
  }) {
    if (loadDetail != null) {
      return loadDetail(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMyRequests value) loadMyRequests,
    required TResult Function(_LoadAllRequests value) loadAllRequests,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_StoreRequest value) storeRequest,
    required TResult Function(_UpdateRequest value) updateRequest,
    required TResult Function(_DeleteRequest value) deleteRequest,
    required TResult Function(_ApproveRequest value) approveRequest,
    required TResult Function(_RejectRequest value) rejectRequest,
    required TResult Function(_CompleteRequest value) completeRequest,
  }) {
    return loadDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadMyRequests value)? loadMyRequests,
    TResult? Function(_LoadAllRequests value)? loadAllRequests,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_StoreRequest value)? storeRequest,
    TResult? Function(_UpdateRequest value)? updateRequest,
    TResult? Function(_DeleteRequest value)? deleteRequest,
    TResult? Function(_ApproveRequest value)? approveRequest,
    TResult? Function(_RejectRequest value)? rejectRequest,
    TResult? Function(_CompleteRequest value)? completeRequest,
  }) {
    return loadDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMyRequests value)? loadMyRequests,
    TResult Function(_LoadAllRequests value)? loadAllRequests,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_StoreRequest value)? storeRequest,
    TResult Function(_UpdateRequest value)? updateRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
    TResult Function(_ApproveRequest value)? approveRequest,
    TResult Function(_RejectRequest value)? rejectRequest,
    TResult Function(_CompleteRequest value)? completeRequest,
    required TResult orElse(),
  }) {
    if (loadDetail != null) {
      return loadDetail(this);
    }
    return orElse();
  }
}

abstract class _LoadDetail implements RequestEvent {
  const factory _LoadDetail(final int id) = _$LoadDetailImpl;

  int get id;

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadDetailImplCopyWith<_$LoadDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoreRequestImplCopyWith<$Res> {
  factory _$$StoreRequestImplCopyWith(
          _$StoreRequestImpl value, $Res Function(_$StoreRequestImpl) then) =
      __$$StoreRequestImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StoreStockRequestModel request});
}

/// @nodoc
class __$$StoreRequestImplCopyWithImpl<$Res>
    extends _$RequestEventCopyWithImpl<$Res, _$StoreRequestImpl>
    implements _$$StoreRequestImplCopyWith<$Res> {
  __$$StoreRequestImplCopyWithImpl(
      _$StoreRequestImpl _value, $Res Function(_$StoreRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$StoreRequestImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as StoreStockRequestModel,
    ));
  }
}

/// @nodoc

class _$StoreRequestImpl implements _StoreRequest {
  const _$StoreRequestImpl(this.request);

  @override
  final StoreStockRequestModel request;

  @override
  String toString() {
    return 'RequestEvent.storeRequest(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreRequestImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreRequestImplCopyWith<_$StoreRequestImpl> get copyWith =>
      __$$StoreRequestImplCopyWithImpl<_$StoreRequestImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) loadMyRequests,
    required TResult Function(int page, String? status) loadAllRequests,
    required TResult Function(int id) loadDetail,
    required TResult Function(StoreStockRequestModel request) storeRequest,
    required TResult Function(int id, UpdateStockRequestModel request)
        updateRequest,
    required TResult Function(int id) deleteRequest,
    required TResult Function(int id, ApproveRequestModel request)
        approveRequest,
    required TResult Function(int id, RejectRequestModel request) rejectRequest,
    required TResult Function(int id) completeRequest,
  }) {
    return storeRequest(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? loadMyRequests,
    TResult? Function(int page, String? status)? loadAllRequests,
    TResult? Function(int id)? loadDetail,
    TResult? Function(StoreStockRequestModel request)? storeRequest,
    TResult? Function(int id, UpdateStockRequestModel request)? updateRequest,
    TResult? Function(int id)? deleteRequest,
    TResult? Function(int id, ApproveRequestModel request)? approveRequest,
    TResult? Function(int id, RejectRequestModel request)? rejectRequest,
    TResult? Function(int id)? completeRequest,
  }) {
    return storeRequest?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? loadMyRequests,
    TResult Function(int page, String? status)? loadAllRequests,
    TResult Function(int id)? loadDetail,
    TResult Function(StoreStockRequestModel request)? storeRequest,
    TResult Function(int id, UpdateStockRequestModel request)? updateRequest,
    TResult Function(int id)? deleteRequest,
    TResult Function(int id, ApproveRequestModel request)? approveRequest,
    TResult Function(int id, RejectRequestModel request)? rejectRequest,
    TResult Function(int id)? completeRequest,
    required TResult orElse(),
  }) {
    if (storeRequest != null) {
      return storeRequest(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMyRequests value) loadMyRequests,
    required TResult Function(_LoadAllRequests value) loadAllRequests,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_StoreRequest value) storeRequest,
    required TResult Function(_UpdateRequest value) updateRequest,
    required TResult Function(_DeleteRequest value) deleteRequest,
    required TResult Function(_ApproveRequest value) approveRequest,
    required TResult Function(_RejectRequest value) rejectRequest,
    required TResult Function(_CompleteRequest value) completeRequest,
  }) {
    return storeRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadMyRequests value)? loadMyRequests,
    TResult? Function(_LoadAllRequests value)? loadAllRequests,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_StoreRequest value)? storeRequest,
    TResult? Function(_UpdateRequest value)? updateRequest,
    TResult? Function(_DeleteRequest value)? deleteRequest,
    TResult? Function(_ApproveRequest value)? approveRequest,
    TResult? Function(_RejectRequest value)? rejectRequest,
    TResult? Function(_CompleteRequest value)? completeRequest,
  }) {
    return storeRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMyRequests value)? loadMyRequests,
    TResult Function(_LoadAllRequests value)? loadAllRequests,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_StoreRequest value)? storeRequest,
    TResult Function(_UpdateRequest value)? updateRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
    TResult Function(_ApproveRequest value)? approveRequest,
    TResult Function(_RejectRequest value)? rejectRequest,
    TResult Function(_CompleteRequest value)? completeRequest,
    required TResult orElse(),
  }) {
    if (storeRequest != null) {
      return storeRequest(this);
    }
    return orElse();
  }
}

abstract class _StoreRequest implements RequestEvent {
  const factory _StoreRequest(final StoreStockRequestModel request) =
      _$StoreRequestImpl;

  StoreStockRequestModel get request;

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreRequestImplCopyWith<_$StoreRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateRequestImplCopyWith<$Res> {
  factory _$$UpdateRequestImplCopyWith(
          _$UpdateRequestImpl value, $Res Function(_$UpdateRequestImpl) then) =
      __$$UpdateRequestImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, UpdateStockRequestModel request});
}

/// @nodoc
class __$$UpdateRequestImplCopyWithImpl<$Res>
    extends _$RequestEventCopyWithImpl<$Res, _$UpdateRequestImpl>
    implements _$$UpdateRequestImplCopyWith<$Res> {
  __$$UpdateRequestImplCopyWithImpl(
      _$UpdateRequestImpl _value, $Res Function(_$UpdateRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? request = null,
  }) {
    return _then(_$UpdateRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as UpdateStockRequestModel,
    ));
  }
}

/// @nodoc

class _$UpdateRequestImpl implements _UpdateRequest {
  const _$UpdateRequestImpl({required this.id, required this.request});

  @override
  final int id;
  @override
  final UpdateStockRequestModel request;

  @override
  String toString() {
    return 'RequestEvent.updateRequest(id: $id, request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, request);

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateRequestImplCopyWith<_$UpdateRequestImpl> get copyWith =>
      __$$UpdateRequestImplCopyWithImpl<_$UpdateRequestImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) loadMyRequests,
    required TResult Function(int page, String? status) loadAllRequests,
    required TResult Function(int id) loadDetail,
    required TResult Function(StoreStockRequestModel request) storeRequest,
    required TResult Function(int id, UpdateStockRequestModel request)
        updateRequest,
    required TResult Function(int id) deleteRequest,
    required TResult Function(int id, ApproveRequestModel request)
        approveRequest,
    required TResult Function(int id, RejectRequestModel request) rejectRequest,
    required TResult Function(int id) completeRequest,
  }) {
    return updateRequest(id, request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? loadMyRequests,
    TResult? Function(int page, String? status)? loadAllRequests,
    TResult? Function(int id)? loadDetail,
    TResult? Function(StoreStockRequestModel request)? storeRequest,
    TResult? Function(int id, UpdateStockRequestModel request)? updateRequest,
    TResult? Function(int id)? deleteRequest,
    TResult? Function(int id, ApproveRequestModel request)? approveRequest,
    TResult? Function(int id, RejectRequestModel request)? rejectRequest,
    TResult? Function(int id)? completeRequest,
  }) {
    return updateRequest?.call(id, request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? loadMyRequests,
    TResult Function(int page, String? status)? loadAllRequests,
    TResult Function(int id)? loadDetail,
    TResult Function(StoreStockRequestModel request)? storeRequest,
    TResult Function(int id, UpdateStockRequestModel request)? updateRequest,
    TResult Function(int id)? deleteRequest,
    TResult Function(int id, ApproveRequestModel request)? approveRequest,
    TResult Function(int id, RejectRequestModel request)? rejectRequest,
    TResult Function(int id)? completeRequest,
    required TResult orElse(),
  }) {
    if (updateRequest != null) {
      return updateRequest(id, request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMyRequests value) loadMyRequests,
    required TResult Function(_LoadAllRequests value) loadAllRequests,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_StoreRequest value) storeRequest,
    required TResult Function(_UpdateRequest value) updateRequest,
    required TResult Function(_DeleteRequest value) deleteRequest,
    required TResult Function(_ApproveRequest value) approveRequest,
    required TResult Function(_RejectRequest value) rejectRequest,
    required TResult Function(_CompleteRequest value) completeRequest,
  }) {
    return updateRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadMyRequests value)? loadMyRequests,
    TResult? Function(_LoadAllRequests value)? loadAllRequests,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_StoreRequest value)? storeRequest,
    TResult? Function(_UpdateRequest value)? updateRequest,
    TResult? Function(_DeleteRequest value)? deleteRequest,
    TResult? Function(_ApproveRequest value)? approveRequest,
    TResult? Function(_RejectRequest value)? rejectRequest,
    TResult? Function(_CompleteRequest value)? completeRequest,
  }) {
    return updateRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMyRequests value)? loadMyRequests,
    TResult Function(_LoadAllRequests value)? loadAllRequests,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_StoreRequest value)? storeRequest,
    TResult Function(_UpdateRequest value)? updateRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
    TResult Function(_ApproveRequest value)? approveRequest,
    TResult Function(_RejectRequest value)? rejectRequest,
    TResult Function(_CompleteRequest value)? completeRequest,
    required TResult orElse(),
  }) {
    if (updateRequest != null) {
      return updateRequest(this);
    }
    return orElse();
  }
}

abstract class _UpdateRequest implements RequestEvent {
  const factory _UpdateRequest(
      {required final int id,
      required final UpdateStockRequestModel request}) = _$UpdateRequestImpl;

  int get id;
  UpdateStockRequestModel get request;

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateRequestImplCopyWith<_$UpdateRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteRequestImplCopyWith<$Res> {
  factory _$$DeleteRequestImplCopyWith(
          _$DeleteRequestImpl value, $Res Function(_$DeleteRequestImpl) then) =
      __$$DeleteRequestImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteRequestImplCopyWithImpl<$Res>
    extends _$RequestEventCopyWithImpl<$Res, _$DeleteRequestImpl>
    implements _$$DeleteRequestImplCopyWith<$Res> {
  __$$DeleteRequestImplCopyWithImpl(
      _$DeleteRequestImpl _value, $Res Function(_$DeleteRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteRequestImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteRequestImpl implements _DeleteRequest {
  const _$DeleteRequestImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'RequestEvent.deleteRequest(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteRequestImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteRequestImplCopyWith<_$DeleteRequestImpl> get copyWith =>
      __$$DeleteRequestImplCopyWithImpl<_$DeleteRequestImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) loadMyRequests,
    required TResult Function(int page, String? status) loadAllRequests,
    required TResult Function(int id) loadDetail,
    required TResult Function(StoreStockRequestModel request) storeRequest,
    required TResult Function(int id, UpdateStockRequestModel request)
        updateRequest,
    required TResult Function(int id) deleteRequest,
    required TResult Function(int id, ApproveRequestModel request)
        approveRequest,
    required TResult Function(int id, RejectRequestModel request) rejectRequest,
    required TResult Function(int id) completeRequest,
  }) {
    return deleteRequest(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? loadMyRequests,
    TResult? Function(int page, String? status)? loadAllRequests,
    TResult? Function(int id)? loadDetail,
    TResult? Function(StoreStockRequestModel request)? storeRequest,
    TResult? Function(int id, UpdateStockRequestModel request)? updateRequest,
    TResult? Function(int id)? deleteRequest,
    TResult? Function(int id, ApproveRequestModel request)? approveRequest,
    TResult? Function(int id, RejectRequestModel request)? rejectRequest,
    TResult? Function(int id)? completeRequest,
  }) {
    return deleteRequest?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? loadMyRequests,
    TResult Function(int page, String? status)? loadAllRequests,
    TResult Function(int id)? loadDetail,
    TResult Function(StoreStockRequestModel request)? storeRequest,
    TResult Function(int id, UpdateStockRequestModel request)? updateRequest,
    TResult Function(int id)? deleteRequest,
    TResult Function(int id, ApproveRequestModel request)? approveRequest,
    TResult Function(int id, RejectRequestModel request)? rejectRequest,
    TResult Function(int id)? completeRequest,
    required TResult orElse(),
  }) {
    if (deleteRequest != null) {
      return deleteRequest(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMyRequests value) loadMyRequests,
    required TResult Function(_LoadAllRequests value) loadAllRequests,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_StoreRequest value) storeRequest,
    required TResult Function(_UpdateRequest value) updateRequest,
    required TResult Function(_DeleteRequest value) deleteRequest,
    required TResult Function(_ApproveRequest value) approveRequest,
    required TResult Function(_RejectRequest value) rejectRequest,
    required TResult Function(_CompleteRequest value) completeRequest,
  }) {
    return deleteRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadMyRequests value)? loadMyRequests,
    TResult? Function(_LoadAllRequests value)? loadAllRequests,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_StoreRequest value)? storeRequest,
    TResult? Function(_UpdateRequest value)? updateRequest,
    TResult? Function(_DeleteRequest value)? deleteRequest,
    TResult? Function(_ApproveRequest value)? approveRequest,
    TResult? Function(_RejectRequest value)? rejectRequest,
    TResult? Function(_CompleteRequest value)? completeRequest,
  }) {
    return deleteRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMyRequests value)? loadMyRequests,
    TResult Function(_LoadAllRequests value)? loadAllRequests,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_StoreRequest value)? storeRequest,
    TResult Function(_UpdateRequest value)? updateRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
    TResult Function(_ApproveRequest value)? approveRequest,
    TResult Function(_RejectRequest value)? rejectRequest,
    TResult Function(_CompleteRequest value)? completeRequest,
    required TResult orElse(),
  }) {
    if (deleteRequest != null) {
      return deleteRequest(this);
    }
    return orElse();
  }
}

abstract class _DeleteRequest implements RequestEvent {
  const factory _DeleteRequest(final int id) = _$DeleteRequestImpl;

  int get id;

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteRequestImplCopyWith<_$DeleteRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApproveRequestImplCopyWith<$Res> {
  factory _$$ApproveRequestImplCopyWith(_$ApproveRequestImpl value,
          $Res Function(_$ApproveRequestImpl) then) =
      __$$ApproveRequestImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, ApproveRequestModel request});
}

/// @nodoc
class __$$ApproveRequestImplCopyWithImpl<$Res>
    extends _$RequestEventCopyWithImpl<$Res, _$ApproveRequestImpl>
    implements _$$ApproveRequestImplCopyWith<$Res> {
  __$$ApproveRequestImplCopyWithImpl(
      _$ApproveRequestImpl _value, $Res Function(_$ApproveRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? request = null,
  }) {
    return _then(_$ApproveRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as ApproveRequestModel,
    ));
  }
}

/// @nodoc

class _$ApproveRequestImpl implements _ApproveRequest {
  const _$ApproveRequestImpl({required this.id, required this.request});

  @override
  final int id;
  @override
  final ApproveRequestModel request;

  @override
  String toString() {
    return 'RequestEvent.approveRequest(id: $id, request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, request);

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveRequestImplCopyWith<_$ApproveRequestImpl> get copyWith =>
      __$$ApproveRequestImplCopyWithImpl<_$ApproveRequestImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) loadMyRequests,
    required TResult Function(int page, String? status) loadAllRequests,
    required TResult Function(int id) loadDetail,
    required TResult Function(StoreStockRequestModel request) storeRequest,
    required TResult Function(int id, UpdateStockRequestModel request)
        updateRequest,
    required TResult Function(int id) deleteRequest,
    required TResult Function(int id, ApproveRequestModel request)
        approveRequest,
    required TResult Function(int id, RejectRequestModel request) rejectRequest,
    required TResult Function(int id) completeRequest,
  }) {
    return approveRequest(id, request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? loadMyRequests,
    TResult? Function(int page, String? status)? loadAllRequests,
    TResult? Function(int id)? loadDetail,
    TResult? Function(StoreStockRequestModel request)? storeRequest,
    TResult? Function(int id, UpdateStockRequestModel request)? updateRequest,
    TResult? Function(int id)? deleteRequest,
    TResult? Function(int id, ApproveRequestModel request)? approveRequest,
    TResult? Function(int id, RejectRequestModel request)? rejectRequest,
    TResult? Function(int id)? completeRequest,
  }) {
    return approveRequest?.call(id, request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? loadMyRequests,
    TResult Function(int page, String? status)? loadAllRequests,
    TResult Function(int id)? loadDetail,
    TResult Function(StoreStockRequestModel request)? storeRequest,
    TResult Function(int id, UpdateStockRequestModel request)? updateRequest,
    TResult Function(int id)? deleteRequest,
    TResult Function(int id, ApproveRequestModel request)? approveRequest,
    TResult Function(int id, RejectRequestModel request)? rejectRequest,
    TResult Function(int id)? completeRequest,
    required TResult orElse(),
  }) {
    if (approveRequest != null) {
      return approveRequest(id, request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMyRequests value) loadMyRequests,
    required TResult Function(_LoadAllRequests value) loadAllRequests,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_StoreRequest value) storeRequest,
    required TResult Function(_UpdateRequest value) updateRequest,
    required TResult Function(_DeleteRequest value) deleteRequest,
    required TResult Function(_ApproveRequest value) approveRequest,
    required TResult Function(_RejectRequest value) rejectRequest,
    required TResult Function(_CompleteRequest value) completeRequest,
  }) {
    return approveRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadMyRequests value)? loadMyRequests,
    TResult? Function(_LoadAllRequests value)? loadAllRequests,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_StoreRequest value)? storeRequest,
    TResult? Function(_UpdateRequest value)? updateRequest,
    TResult? Function(_DeleteRequest value)? deleteRequest,
    TResult? Function(_ApproveRequest value)? approveRequest,
    TResult? Function(_RejectRequest value)? rejectRequest,
    TResult? Function(_CompleteRequest value)? completeRequest,
  }) {
    return approveRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMyRequests value)? loadMyRequests,
    TResult Function(_LoadAllRequests value)? loadAllRequests,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_StoreRequest value)? storeRequest,
    TResult Function(_UpdateRequest value)? updateRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
    TResult Function(_ApproveRequest value)? approveRequest,
    TResult Function(_RejectRequest value)? rejectRequest,
    TResult Function(_CompleteRequest value)? completeRequest,
    required TResult orElse(),
  }) {
    if (approveRequest != null) {
      return approveRequest(this);
    }
    return orElse();
  }
}

abstract class _ApproveRequest implements RequestEvent {
  const factory _ApproveRequest(
      {required final int id,
      required final ApproveRequestModel request}) = _$ApproveRequestImpl;

  int get id;
  ApproveRequestModel get request;

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApproveRequestImplCopyWith<_$ApproveRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RejectRequestImplCopyWith<$Res> {
  factory _$$RejectRequestImplCopyWith(
          _$RejectRequestImpl value, $Res Function(_$RejectRequestImpl) then) =
      __$$RejectRequestImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, RejectRequestModel request});
}

/// @nodoc
class __$$RejectRequestImplCopyWithImpl<$Res>
    extends _$RequestEventCopyWithImpl<$Res, _$RejectRequestImpl>
    implements _$$RejectRequestImplCopyWith<$Res> {
  __$$RejectRequestImplCopyWithImpl(
      _$RejectRequestImpl _value, $Res Function(_$RejectRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? request = null,
  }) {
    return _then(_$RejectRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RejectRequestModel,
    ));
  }
}

/// @nodoc

class _$RejectRequestImpl implements _RejectRequest {
  const _$RejectRequestImpl({required this.id, required this.request});

  @override
  final int id;
  @override
  final RejectRequestModel request;

  @override
  String toString() {
    return 'RequestEvent.rejectRequest(id: $id, request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, request);

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectRequestImplCopyWith<_$RejectRequestImpl> get copyWith =>
      __$$RejectRequestImplCopyWithImpl<_$RejectRequestImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) loadMyRequests,
    required TResult Function(int page, String? status) loadAllRequests,
    required TResult Function(int id) loadDetail,
    required TResult Function(StoreStockRequestModel request) storeRequest,
    required TResult Function(int id, UpdateStockRequestModel request)
        updateRequest,
    required TResult Function(int id) deleteRequest,
    required TResult Function(int id, ApproveRequestModel request)
        approveRequest,
    required TResult Function(int id, RejectRequestModel request) rejectRequest,
    required TResult Function(int id) completeRequest,
  }) {
    return rejectRequest(id, request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? loadMyRequests,
    TResult? Function(int page, String? status)? loadAllRequests,
    TResult? Function(int id)? loadDetail,
    TResult? Function(StoreStockRequestModel request)? storeRequest,
    TResult? Function(int id, UpdateStockRequestModel request)? updateRequest,
    TResult? Function(int id)? deleteRequest,
    TResult? Function(int id, ApproveRequestModel request)? approveRequest,
    TResult? Function(int id, RejectRequestModel request)? rejectRequest,
    TResult? Function(int id)? completeRequest,
  }) {
    return rejectRequest?.call(id, request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? loadMyRequests,
    TResult Function(int page, String? status)? loadAllRequests,
    TResult Function(int id)? loadDetail,
    TResult Function(StoreStockRequestModel request)? storeRequest,
    TResult Function(int id, UpdateStockRequestModel request)? updateRequest,
    TResult Function(int id)? deleteRequest,
    TResult Function(int id, ApproveRequestModel request)? approveRequest,
    TResult Function(int id, RejectRequestModel request)? rejectRequest,
    TResult Function(int id)? completeRequest,
    required TResult orElse(),
  }) {
    if (rejectRequest != null) {
      return rejectRequest(id, request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMyRequests value) loadMyRequests,
    required TResult Function(_LoadAllRequests value) loadAllRequests,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_StoreRequest value) storeRequest,
    required TResult Function(_UpdateRequest value) updateRequest,
    required TResult Function(_DeleteRequest value) deleteRequest,
    required TResult Function(_ApproveRequest value) approveRequest,
    required TResult Function(_RejectRequest value) rejectRequest,
    required TResult Function(_CompleteRequest value) completeRequest,
  }) {
    return rejectRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadMyRequests value)? loadMyRequests,
    TResult? Function(_LoadAllRequests value)? loadAllRequests,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_StoreRequest value)? storeRequest,
    TResult? Function(_UpdateRequest value)? updateRequest,
    TResult? Function(_DeleteRequest value)? deleteRequest,
    TResult? Function(_ApproveRequest value)? approveRequest,
    TResult? Function(_RejectRequest value)? rejectRequest,
    TResult? Function(_CompleteRequest value)? completeRequest,
  }) {
    return rejectRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMyRequests value)? loadMyRequests,
    TResult Function(_LoadAllRequests value)? loadAllRequests,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_StoreRequest value)? storeRequest,
    TResult Function(_UpdateRequest value)? updateRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
    TResult Function(_ApproveRequest value)? approveRequest,
    TResult Function(_RejectRequest value)? rejectRequest,
    TResult Function(_CompleteRequest value)? completeRequest,
    required TResult orElse(),
  }) {
    if (rejectRequest != null) {
      return rejectRequest(this);
    }
    return orElse();
  }
}

abstract class _RejectRequest implements RequestEvent {
  const factory _RejectRequest(
      {required final int id,
      required final RejectRequestModel request}) = _$RejectRequestImpl;

  int get id;
  RejectRequestModel get request;

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RejectRequestImplCopyWith<_$RejectRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompleteRequestImplCopyWith<$Res> {
  factory _$$CompleteRequestImplCopyWith(_$CompleteRequestImpl value,
          $Res Function(_$CompleteRequestImpl) then) =
      __$$CompleteRequestImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$CompleteRequestImplCopyWithImpl<$Res>
    extends _$RequestEventCopyWithImpl<$Res, _$CompleteRequestImpl>
    implements _$$CompleteRequestImplCopyWith<$Res> {
  __$$CompleteRequestImplCopyWithImpl(
      _$CompleteRequestImpl _value, $Res Function(_$CompleteRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$CompleteRequestImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CompleteRequestImpl implements _CompleteRequest {
  const _$CompleteRequestImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'RequestEvent.completeRequest(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteRequestImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteRequestImplCopyWith<_$CompleteRequestImpl> get copyWith =>
      __$$CompleteRequestImplCopyWithImpl<_$CompleteRequestImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status) loadMyRequests,
    required TResult Function(int page, String? status) loadAllRequests,
    required TResult Function(int id) loadDetail,
    required TResult Function(StoreStockRequestModel request) storeRequest,
    required TResult Function(int id, UpdateStockRequestModel request)
        updateRequest,
    required TResult Function(int id) deleteRequest,
    required TResult Function(int id, ApproveRequestModel request)
        approveRequest,
    required TResult Function(int id, RejectRequestModel request) rejectRequest,
    required TResult Function(int id) completeRequest,
  }) {
    return completeRequest(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status)? loadMyRequests,
    TResult? Function(int page, String? status)? loadAllRequests,
    TResult? Function(int id)? loadDetail,
    TResult? Function(StoreStockRequestModel request)? storeRequest,
    TResult? Function(int id, UpdateStockRequestModel request)? updateRequest,
    TResult? Function(int id)? deleteRequest,
    TResult? Function(int id, ApproveRequestModel request)? approveRequest,
    TResult? Function(int id, RejectRequestModel request)? rejectRequest,
    TResult? Function(int id)? completeRequest,
  }) {
    return completeRequest?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status)? loadMyRequests,
    TResult Function(int page, String? status)? loadAllRequests,
    TResult Function(int id)? loadDetail,
    TResult Function(StoreStockRequestModel request)? storeRequest,
    TResult Function(int id, UpdateStockRequestModel request)? updateRequest,
    TResult Function(int id)? deleteRequest,
    TResult Function(int id, ApproveRequestModel request)? approveRequest,
    TResult Function(int id, RejectRequestModel request)? rejectRequest,
    TResult Function(int id)? completeRequest,
    required TResult orElse(),
  }) {
    if (completeRequest != null) {
      return completeRequest(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadMyRequests value) loadMyRequests,
    required TResult Function(_LoadAllRequests value) loadAllRequests,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_StoreRequest value) storeRequest,
    required TResult Function(_UpdateRequest value) updateRequest,
    required TResult Function(_DeleteRequest value) deleteRequest,
    required TResult Function(_ApproveRequest value) approveRequest,
    required TResult Function(_RejectRequest value) rejectRequest,
    required TResult Function(_CompleteRequest value) completeRequest,
  }) {
    return completeRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadMyRequests value)? loadMyRequests,
    TResult? Function(_LoadAllRequests value)? loadAllRequests,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_StoreRequest value)? storeRequest,
    TResult? Function(_UpdateRequest value)? updateRequest,
    TResult? Function(_DeleteRequest value)? deleteRequest,
    TResult? Function(_ApproveRequest value)? approveRequest,
    TResult? Function(_RejectRequest value)? rejectRequest,
    TResult? Function(_CompleteRequest value)? completeRequest,
  }) {
    return completeRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadMyRequests value)? loadMyRequests,
    TResult Function(_LoadAllRequests value)? loadAllRequests,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_StoreRequest value)? storeRequest,
    TResult Function(_UpdateRequest value)? updateRequest,
    TResult Function(_DeleteRequest value)? deleteRequest,
    TResult Function(_ApproveRequest value)? approveRequest,
    TResult Function(_RejectRequest value)? rejectRequest,
    TResult Function(_CompleteRequest value)? completeRequest,
    required TResult orElse(),
  }) {
    if (completeRequest != null) {
      return completeRequest(this);
    }
    return orElse();
  }
}

abstract class _CompleteRequest implements RequestEvent {
  const factory _CompleteRequest(final int id) = _$CompleteRequestImpl;

  int get id;

  /// Create a copy of RequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompleteRequestImplCopyWith<_$CompleteRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RequestState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(StockRequestListResponseModel result) listLoaded,
    required TResult Function(StockRequestResponseModel result) detailLoaded,
    required TResult Function(String message, StockRequestResponseModel? data)
        actionSuccess,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(StockRequestListResponseModel result)? listLoaded,
    TResult? Function(StockRequestResponseModel result)? detailLoaded,
    TResult? Function(String message, StockRequestResponseModel? data)?
        actionSuccess,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(StockRequestListResponseModel result)? listLoaded,
    TResult Function(StockRequestResponseModel result)? detailLoaded,
    TResult Function(String message, StockRequestResponseModel? data)?
        actionSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ListLoaded value) listLoaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_ActionSuccess value) actionSuccess,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ListLoaded value)? listLoaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_ActionSuccess value)? actionSuccess,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ListLoaded value)? listLoaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_ActionSuccess value)? actionSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestStateCopyWith<$Res> {
  factory $RequestStateCopyWith(
          RequestState value, $Res Function(RequestState) then) =
      _$RequestStateCopyWithImpl<$Res, RequestState>;
}

/// @nodoc
class _$RequestStateCopyWithImpl<$Res, $Val extends RequestState>
    implements $RequestStateCopyWith<$Res> {
  _$RequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestState
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
    extends _$RequestStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'RequestState.initial()';
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
    required TResult Function(StockRequestListResponseModel result) listLoaded,
    required TResult Function(StockRequestResponseModel result) detailLoaded,
    required TResult Function(String message, StockRequestResponseModel? data)
        actionSuccess,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(StockRequestListResponseModel result)? listLoaded,
    TResult? Function(StockRequestResponseModel result)? detailLoaded,
    TResult? Function(String message, StockRequestResponseModel? data)?
        actionSuccess,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(StockRequestListResponseModel result)? listLoaded,
    TResult Function(StockRequestResponseModel result)? detailLoaded,
    TResult Function(String message, StockRequestResponseModel? data)?
        actionSuccess,
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
    required TResult Function(_ListLoaded value) listLoaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_ActionSuccess value) actionSuccess,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ListLoaded value)? listLoaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_ActionSuccess value)? actionSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ListLoaded value)? listLoaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_ActionSuccess value)? actionSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RequestState {
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
    extends _$RequestStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'RequestState.loading()';
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
    required TResult Function(StockRequestListResponseModel result) listLoaded,
    required TResult Function(StockRequestResponseModel result) detailLoaded,
    required TResult Function(String message, StockRequestResponseModel? data)
        actionSuccess,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(StockRequestListResponseModel result)? listLoaded,
    TResult? Function(StockRequestResponseModel result)? detailLoaded,
    TResult? Function(String message, StockRequestResponseModel? data)?
        actionSuccess,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(StockRequestListResponseModel result)? listLoaded,
    TResult Function(StockRequestResponseModel result)? detailLoaded,
    TResult Function(String message, StockRequestResponseModel? data)?
        actionSuccess,
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
    required TResult Function(_ListLoaded value) listLoaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_ActionSuccess value) actionSuccess,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ListLoaded value)? listLoaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_ActionSuccess value)? actionSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ListLoaded value)? listLoaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_ActionSuccess value)? actionSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements RequestState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ListLoadedImplCopyWith<$Res> {
  factory _$$ListLoadedImplCopyWith(
          _$ListLoadedImpl value, $Res Function(_$ListLoadedImpl) then) =
      __$$ListLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StockRequestListResponseModel result});
}

/// @nodoc
class __$$ListLoadedImplCopyWithImpl<$Res>
    extends _$RequestStateCopyWithImpl<$Res, _$ListLoadedImpl>
    implements _$$ListLoadedImplCopyWith<$Res> {
  __$$ListLoadedImplCopyWithImpl(
      _$ListLoadedImpl _value, $Res Function(_$ListLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$ListLoadedImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as StockRequestListResponseModel,
    ));
  }
}

/// @nodoc

class _$ListLoadedImpl implements _ListLoaded {
  const _$ListLoadedImpl(this.result);

  @override
  final StockRequestListResponseModel result;

  @override
  String toString() {
    return 'RequestState.listLoaded(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListLoadedImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListLoadedImplCopyWith<_$ListLoadedImpl> get copyWith =>
      __$$ListLoadedImplCopyWithImpl<_$ListLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(StockRequestListResponseModel result) listLoaded,
    required TResult Function(StockRequestResponseModel result) detailLoaded,
    required TResult Function(String message, StockRequestResponseModel? data)
        actionSuccess,
    required TResult Function(String message) error,
  }) {
    return listLoaded(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(StockRequestListResponseModel result)? listLoaded,
    TResult? Function(StockRequestResponseModel result)? detailLoaded,
    TResult? Function(String message, StockRequestResponseModel? data)?
        actionSuccess,
    TResult? Function(String message)? error,
  }) {
    return listLoaded?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(StockRequestListResponseModel result)? listLoaded,
    TResult Function(StockRequestResponseModel result)? detailLoaded,
    TResult Function(String message, StockRequestResponseModel? data)?
        actionSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (listLoaded != null) {
      return listLoaded(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ListLoaded value) listLoaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_ActionSuccess value) actionSuccess,
    required TResult Function(_Error value) error,
  }) {
    return listLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ListLoaded value)? listLoaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_ActionSuccess value)? actionSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return listLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ListLoaded value)? listLoaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_ActionSuccess value)? actionSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (listLoaded != null) {
      return listLoaded(this);
    }
    return orElse();
  }
}

abstract class _ListLoaded implements RequestState {
  const factory _ListLoaded(final StockRequestListResponseModel result) =
      _$ListLoadedImpl;

  StockRequestListResponseModel get result;

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListLoadedImplCopyWith<_$ListLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailLoadedImplCopyWith<$Res> {
  factory _$$DetailLoadedImplCopyWith(
          _$DetailLoadedImpl value, $Res Function(_$DetailLoadedImpl) then) =
      __$$DetailLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StockRequestResponseModel result});
}

/// @nodoc
class __$$DetailLoadedImplCopyWithImpl<$Res>
    extends _$RequestStateCopyWithImpl<$Res, _$DetailLoadedImpl>
    implements _$$DetailLoadedImplCopyWith<$Res> {
  __$$DetailLoadedImplCopyWithImpl(
      _$DetailLoadedImpl _value, $Res Function(_$DetailLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$DetailLoadedImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as StockRequestResponseModel,
    ));
  }
}

/// @nodoc

class _$DetailLoadedImpl implements _DetailLoaded {
  const _$DetailLoadedImpl(this.result);

  @override
  final StockRequestResponseModel result;

  @override
  String toString() {
    return 'RequestState.detailLoaded(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailLoadedImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of RequestState
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
    required TResult Function(StockRequestListResponseModel result) listLoaded,
    required TResult Function(StockRequestResponseModel result) detailLoaded,
    required TResult Function(String message, StockRequestResponseModel? data)
        actionSuccess,
    required TResult Function(String message) error,
  }) {
    return detailLoaded(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(StockRequestListResponseModel result)? listLoaded,
    TResult? Function(StockRequestResponseModel result)? detailLoaded,
    TResult? Function(String message, StockRequestResponseModel? data)?
        actionSuccess,
    TResult? Function(String message)? error,
  }) {
    return detailLoaded?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(StockRequestListResponseModel result)? listLoaded,
    TResult Function(StockRequestResponseModel result)? detailLoaded,
    TResult Function(String message, StockRequestResponseModel? data)?
        actionSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (detailLoaded != null) {
      return detailLoaded(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ListLoaded value) listLoaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_ActionSuccess value) actionSuccess,
    required TResult Function(_Error value) error,
  }) {
    return detailLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ListLoaded value)? listLoaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_ActionSuccess value)? actionSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return detailLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ListLoaded value)? listLoaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_ActionSuccess value)? actionSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (detailLoaded != null) {
      return detailLoaded(this);
    }
    return orElse();
  }
}

abstract class _DetailLoaded implements RequestState {
  const factory _DetailLoaded(final StockRequestResponseModel result) =
      _$DetailLoadedImpl;

  StockRequestResponseModel get result;

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailLoadedImplCopyWith<_$DetailLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ActionSuccessImplCopyWith<$Res> {
  factory _$$ActionSuccessImplCopyWith(
          _$ActionSuccessImpl value, $Res Function(_$ActionSuccessImpl) then) =
      __$$ActionSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, StockRequestResponseModel? data});
}

/// @nodoc
class __$$ActionSuccessImplCopyWithImpl<$Res>
    extends _$RequestStateCopyWithImpl<$Res, _$ActionSuccessImpl>
    implements _$$ActionSuccessImplCopyWith<$Res> {
  __$$ActionSuccessImplCopyWithImpl(
      _$ActionSuccessImpl _value, $Res Function(_$ActionSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$ActionSuccessImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as StockRequestResponseModel?,
    ));
  }
}

/// @nodoc

class _$ActionSuccessImpl implements _ActionSuccess {
  const _$ActionSuccessImpl(this.message, this.data);

  @override
  final String message;
  @override
  final StockRequestResponseModel? data;

  @override
  String toString() {
    return 'RequestState.actionSuccess(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionSuccessImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionSuccessImplCopyWith<_$ActionSuccessImpl> get copyWith =>
      __$$ActionSuccessImplCopyWithImpl<_$ActionSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(StockRequestListResponseModel result) listLoaded,
    required TResult Function(StockRequestResponseModel result) detailLoaded,
    required TResult Function(String message, StockRequestResponseModel? data)
        actionSuccess,
    required TResult Function(String message) error,
  }) {
    return actionSuccess(message, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(StockRequestListResponseModel result)? listLoaded,
    TResult? Function(StockRequestResponseModel result)? detailLoaded,
    TResult? Function(String message, StockRequestResponseModel? data)?
        actionSuccess,
    TResult? Function(String message)? error,
  }) {
    return actionSuccess?.call(message, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(StockRequestListResponseModel result)? listLoaded,
    TResult Function(StockRequestResponseModel result)? detailLoaded,
    TResult Function(String message, StockRequestResponseModel? data)?
        actionSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (actionSuccess != null) {
      return actionSuccess(message, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ListLoaded value) listLoaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_ActionSuccess value) actionSuccess,
    required TResult Function(_Error value) error,
  }) {
    return actionSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ListLoaded value)? listLoaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_ActionSuccess value)? actionSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return actionSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ListLoaded value)? listLoaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_ActionSuccess value)? actionSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (actionSuccess != null) {
      return actionSuccess(this);
    }
    return orElse();
  }
}

abstract class _ActionSuccess implements RequestState {
  const factory _ActionSuccess(
          final String message, final StockRequestResponseModel? data) =
      _$ActionSuccessImpl;

  String get message;
  StockRequestResponseModel? get data;

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActionSuccessImplCopyWith<_$ActionSuccessImpl> get copyWith =>
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
    extends _$RequestStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestState
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
    return 'RequestState.error(message: $message)';
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

  /// Create a copy of RequestState
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
    required TResult Function(StockRequestListResponseModel result) listLoaded,
    required TResult Function(StockRequestResponseModel result) detailLoaded,
    required TResult Function(String message, StockRequestResponseModel? data)
        actionSuccess,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(StockRequestListResponseModel result)? listLoaded,
    TResult? Function(StockRequestResponseModel result)? detailLoaded,
    TResult? Function(String message, StockRequestResponseModel? data)?
        actionSuccess,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(StockRequestListResponseModel result)? listLoaded,
    TResult Function(StockRequestResponseModel result)? detailLoaded,
    TResult Function(String message, StockRequestResponseModel? data)?
        actionSuccess,
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
    required TResult Function(_ListLoaded value) listLoaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_ActionSuccess value) actionSuccess,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ListLoaded value)? listLoaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_ActionSuccess value)? actionSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ListLoaded value)? listLoaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_ActionSuccess value)? actionSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements RequestState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
