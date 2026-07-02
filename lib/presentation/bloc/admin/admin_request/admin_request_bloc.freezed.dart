// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_request_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminRequestEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? status) load,
    required TResult Function() loadMore,
    required TResult Function(String? status) filterStatus,
    required TResult Function(int requestId) loadDetail,
    required TResult Function(int requestId, String rejectReason) reject,
    required TResult Function(int requestId) complete,
    required TResult Function(int requestId, List<Map<String, dynamic>> items)
        approve,
    required TResult Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)
        approveFinal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? status)? load,
    TResult? Function()? loadMore,
    TResult? Function(String? status)? filterStatus,
    TResult? Function(int requestId)? loadDetail,
    TResult? Function(int requestId, String rejectReason)? reject,
    TResult? Function(int requestId)? complete,
    TResult? Function(int requestId, List<Map<String, dynamic>> items)? approve,
    TResult? Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)?
        approveFinal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? status)? load,
    TResult Function()? loadMore,
    TResult Function(String? status)? filterStatus,
    TResult Function(int requestId)? loadDetail,
    TResult Function(int requestId, String rejectReason)? reject,
    TResult Function(int requestId)? complete,
    TResult Function(int requestId, List<Map<String, dynamic>> items)? approve,
    TResult Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)?
        approveFinal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRequests value) load,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FilterStatus value) filterStatus,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_RejectRequest value) reject,
    required TResult Function(_CompleteRequest value) complete,
    required TResult Function(_ApproveRequest value) approve,
    required TResult Function(_ApproveFinalRequest value) approveFinal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRequests value)? load,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FilterStatus value)? filterStatus,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_RejectRequest value)? reject,
    TResult? Function(_CompleteRequest value)? complete,
    TResult? Function(_ApproveRequest value)? approve,
    TResult? Function(_ApproveFinalRequest value)? approveFinal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequests value)? load,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FilterStatus value)? filterStatus,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_RejectRequest value)? reject,
    TResult Function(_CompleteRequest value)? complete,
    TResult Function(_ApproveRequest value)? approve,
    TResult Function(_ApproveFinalRequest value)? approveFinal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminRequestEventCopyWith<$Res> {
  factory $AdminRequestEventCopyWith(
          AdminRequestEvent value, $Res Function(AdminRequestEvent) then) =
      _$AdminRequestEventCopyWithImpl<$Res, AdminRequestEvent>;
}

/// @nodoc
class _$AdminRequestEventCopyWithImpl<$Res, $Val extends AdminRequestEvent>
    implements $AdminRequestEventCopyWith<$Res> {
  _$AdminRequestEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminRequestEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadRequestsImplCopyWith<$Res> {
  factory _$$LoadRequestsImplCopyWith(
          _$LoadRequestsImpl value, $Res Function(_$LoadRequestsImpl) then) =
      __$$LoadRequestsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? status});
}

/// @nodoc
class __$$LoadRequestsImplCopyWithImpl<$Res>
    extends _$AdminRequestEventCopyWithImpl<$Res, _$LoadRequestsImpl>
    implements _$$LoadRequestsImplCopyWith<$Res> {
  __$$LoadRequestsImplCopyWithImpl(
      _$LoadRequestsImpl _value, $Res Function(_$LoadRequestsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$LoadRequestsImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadRequestsImpl implements _LoadRequests {
  const _$LoadRequestsImpl({this.status});

  @override
  final String? status;

  @override
  String toString() {
    return 'AdminRequestEvent.load(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadRequestsImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of AdminRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadRequestsImplCopyWith<_$LoadRequestsImpl> get copyWith =>
      __$$LoadRequestsImplCopyWithImpl<_$LoadRequestsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? status) load,
    required TResult Function() loadMore,
    required TResult Function(String? status) filterStatus,
    required TResult Function(int requestId) loadDetail,
    required TResult Function(int requestId, String rejectReason) reject,
    required TResult Function(int requestId) complete,
    required TResult Function(int requestId, List<Map<String, dynamic>> items)
        approve,
    required TResult Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)
        approveFinal,
  }) {
    return load(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? status)? load,
    TResult? Function()? loadMore,
    TResult? Function(String? status)? filterStatus,
    TResult? Function(int requestId)? loadDetail,
    TResult? Function(int requestId, String rejectReason)? reject,
    TResult? Function(int requestId)? complete,
    TResult? Function(int requestId, List<Map<String, dynamic>> items)? approve,
    TResult? Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)?
        approveFinal,
  }) {
    return load?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? status)? load,
    TResult Function()? loadMore,
    TResult Function(String? status)? filterStatus,
    TResult Function(int requestId)? loadDetail,
    TResult Function(int requestId, String rejectReason)? reject,
    TResult Function(int requestId)? complete,
    TResult Function(int requestId, List<Map<String, dynamic>> items)? approve,
    TResult Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)?
        approveFinal,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRequests value) load,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FilterStatus value) filterStatus,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_RejectRequest value) reject,
    required TResult Function(_CompleteRequest value) complete,
    required TResult Function(_ApproveRequest value) approve,
    required TResult Function(_ApproveFinalRequest value) approveFinal,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRequests value)? load,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FilterStatus value)? filterStatus,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_RejectRequest value)? reject,
    TResult? Function(_CompleteRequest value)? complete,
    TResult? Function(_ApproveRequest value)? approve,
    TResult? Function(_ApproveFinalRequest value)? approveFinal,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequests value)? load,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FilterStatus value)? filterStatus,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_RejectRequest value)? reject,
    TResult Function(_CompleteRequest value)? complete,
    TResult Function(_ApproveRequest value)? approve,
    TResult Function(_ApproveFinalRequest value)? approveFinal,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _LoadRequests implements AdminRequestEvent {
  const factory _LoadRequests({final String? status}) = _$LoadRequestsImpl;

  String? get status;

  /// Create a copy of AdminRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadRequestsImplCopyWith<_$LoadRequestsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreImplCopyWith<$Res> {
  factory _$$LoadMoreImplCopyWith(
          _$LoadMoreImpl value, $Res Function(_$LoadMoreImpl) then) =
      __$$LoadMoreImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreImplCopyWithImpl<$Res>
    extends _$AdminRequestEventCopyWithImpl<$Res, _$LoadMoreImpl>
    implements _$$LoadMoreImplCopyWith<$Res> {
  __$$LoadMoreImplCopyWithImpl(
      _$LoadMoreImpl _value, $Res Function(_$LoadMoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminRequestEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadMoreImpl implements _LoadMore {
  const _$LoadMoreImpl();

  @override
  String toString() {
    return 'AdminRequestEvent.loadMore()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMoreImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? status) load,
    required TResult Function() loadMore,
    required TResult Function(String? status) filterStatus,
    required TResult Function(int requestId) loadDetail,
    required TResult Function(int requestId, String rejectReason) reject,
    required TResult Function(int requestId) complete,
    required TResult Function(int requestId, List<Map<String, dynamic>> items)
        approve,
    required TResult Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)
        approveFinal,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? status)? load,
    TResult? Function()? loadMore,
    TResult? Function(String? status)? filterStatus,
    TResult? Function(int requestId)? loadDetail,
    TResult? Function(int requestId, String rejectReason)? reject,
    TResult? Function(int requestId)? complete,
    TResult? Function(int requestId, List<Map<String, dynamic>> items)? approve,
    TResult? Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)?
        approveFinal,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? status)? load,
    TResult Function()? loadMore,
    TResult Function(String? status)? filterStatus,
    TResult Function(int requestId)? loadDetail,
    TResult Function(int requestId, String rejectReason)? reject,
    TResult Function(int requestId)? complete,
    TResult Function(int requestId, List<Map<String, dynamic>> items)? approve,
    TResult Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)?
        approveFinal,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRequests value) load,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FilterStatus value) filterStatus,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_RejectRequest value) reject,
    required TResult Function(_CompleteRequest value) complete,
    required TResult Function(_ApproveRequest value) approve,
    required TResult Function(_ApproveFinalRequest value) approveFinal,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRequests value)? load,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FilterStatus value)? filterStatus,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_RejectRequest value)? reject,
    TResult? Function(_CompleteRequest value)? complete,
    TResult? Function(_ApproveRequest value)? approve,
    TResult? Function(_ApproveFinalRequest value)? approveFinal,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequests value)? load,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FilterStatus value)? filterStatus,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_RejectRequest value)? reject,
    TResult Function(_CompleteRequest value)? complete,
    TResult Function(_ApproveRequest value)? approve,
    TResult Function(_ApproveFinalRequest value)? approveFinal,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements AdminRequestEvent {
  const factory _LoadMore() = _$LoadMoreImpl;
}

/// @nodoc
abstract class _$$FilterStatusImplCopyWith<$Res> {
  factory _$$FilterStatusImplCopyWith(
          _$FilterStatusImpl value, $Res Function(_$FilterStatusImpl) then) =
      __$$FilterStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? status});
}

/// @nodoc
class __$$FilterStatusImplCopyWithImpl<$Res>
    extends _$AdminRequestEventCopyWithImpl<$Res, _$FilterStatusImpl>
    implements _$$FilterStatusImplCopyWith<$Res> {
  __$$FilterStatusImplCopyWithImpl(
      _$FilterStatusImpl _value, $Res Function(_$FilterStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$FilterStatusImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FilterStatusImpl implements _FilterStatus {
  const _$FilterStatusImpl(this.status);

  @override
  final String? status;

  @override
  String toString() {
    return 'AdminRequestEvent.filterStatus(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterStatusImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of AdminRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterStatusImplCopyWith<_$FilterStatusImpl> get copyWith =>
      __$$FilterStatusImplCopyWithImpl<_$FilterStatusImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? status) load,
    required TResult Function() loadMore,
    required TResult Function(String? status) filterStatus,
    required TResult Function(int requestId) loadDetail,
    required TResult Function(int requestId, String rejectReason) reject,
    required TResult Function(int requestId) complete,
    required TResult Function(int requestId, List<Map<String, dynamic>> items)
        approve,
    required TResult Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)
        approveFinal,
  }) {
    return filterStatus(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? status)? load,
    TResult? Function()? loadMore,
    TResult? Function(String? status)? filterStatus,
    TResult? Function(int requestId)? loadDetail,
    TResult? Function(int requestId, String rejectReason)? reject,
    TResult? Function(int requestId)? complete,
    TResult? Function(int requestId, List<Map<String, dynamic>> items)? approve,
    TResult? Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)?
        approveFinal,
  }) {
    return filterStatus?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? status)? load,
    TResult Function()? loadMore,
    TResult Function(String? status)? filterStatus,
    TResult Function(int requestId)? loadDetail,
    TResult Function(int requestId, String rejectReason)? reject,
    TResult Function(int requestId)? complete,
    TResult Function(int requestId, List<Map<String, dynamic>> items)? approve,
    TResult Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)?
        approveFinal,
    required TResult orElse(),
  }) {
    if (filterStatus != null) {
      return filterStatus(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRequests value) load,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FilterStatus value) filterStatus,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_RejectRequest value) reject,
    required TResult Function(_CompleteRequest value) complete,
    required TResult Function(_ApproveRequest value) approve,
    required TResult Function(_ApproveFinalRequest value) approveFinal,
  }) {
    return filterStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRequests value)? load,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FilterStatus value)? filterStatus,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_RejectRequest value)? reject,
    TResult? Function(_CompleteRequest value)? complete,
    TResult? Function(_ApproveRequest value)? approve,
    TResult? Function(_ApproveFinalRequest value)? approveFinal,
  }) {
    return filterStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequests value)? load,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FilterStatus value)? filterStatus,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_RejectRequest value)? reject,
    TResult Function(_CompleteRequest value)? complete,
    TResult Function(_ApproveRequest value)? approve,
    TResult Function(_ApproveFinalRequest value)? approveFinal,
    required TResult orElse(),
  }) {
    if (filterStatus != null) {
      return filterStatus(this);
    }
    return orElse();
  }
}

abstract class _FilterStatus implements AdminRequestEvent {
  const factory _FilterStatus(final String? status) = _$FilterStatusImpl;

  String? get status;

  /// Create a copy of AdminRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterStatusImplCopyWith<_$FilterStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadDetailImplCopyWith<$Res> {
  factory _$$LoadDetailImplCopyWith(
          _$LoadDetailImpl value, $Res Function(_$LoadDetailImpl) then) =
      __$$LoadDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int requestId});
}

/// @nodoc
class __$$LoadDetailImplCopyWithImpl<$Res>
    extends _$AdminRequestEventCopyWithImpl<$Res, _$LoadDetailImpl>
    implements _$$LoadDetailImplCopyWith<$Res> {
  __$$LoadDetailImplCopyWithImpl(
      _$LoadDetailImpl _value, $Res Function(_$LoadDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
  }) {
    return _then(_$LoadDetailImpl(
      null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadDetailImpl implements _LoadDetail {
  const _$LoadDetailImpl(this.requestId);

  @override
  final int requestId;

  @override
  String toString() {
    return 'AdminRequestEvent.loadDetail(requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadDetailImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestId);

  /// Create a copy of AdminRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadDetailImplCopyWith<_$LoadDetailImpl> get copyWith =>
      __$$LoadDetailImplCopyWithImpl<_$LoadDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? status) load,
    required TResult Function() loadMore,
    required TResult Function(String? status) filterStatus,
    required TResult Function(int requestId) loadDetail,
    required TResult Function(int requestId, String rejectReason) reject,
    required TResult Function(int requestId) complete,
    required TResult Function(int requestId, List<Map<String, dynamic>> items)
        approve,
    required TResult Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)
        approveFinal,
  }) {
    return loadDetail(requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? status)? load,
    TResult? Function()? loadMore,
    TResult? Function(String? status)? filterStatus,
    TResult? Function(int requestId)? loadDetail,
    TResult? Function(int requestId, String rejectReason)? reject,
    TResult? Function(int requestId)? complete,
    TResult? Function(int requestId, List<Map<String, dynamic>> items)? approve,
    TResult? Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)?
        approveFinal,
  }) {
    return loadDetail?.call(requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? status)? load,
    TResult Function()? loadMore,
    TResult Function(String? status)? filterStatus,
    TResult Function(int requestId)? loadDetail,
    TResult Function(int requestId, String rejectReason)? reject,
    TResult Function(int requestId)? complete,
    TResult Function(int requestId, List<Map<String, dynamic>> items)? approve,
    TResult Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)?
        approveFinal,
    required TResult orElse(),
  }) {
    if (loadDetail != null) {
      return loadDetail(requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRequests value) load,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FilterStatus value) filterStatus,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_RejectRequest value) reject,
    required TResult Function(_CompleteRequest value) complete,
    required TResult Function(_ApproveRequest value) approve,
    required TResult Function(_ApproveFinalRequest value) approveFinal,
  }) {
    return loadDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRequests value)? load,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FilterStatus value)? filterStatus,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_RejectRequest value)? reject,
    TResult? Function(_CompleteRequest value)? complete,
    TResult? Function(_ApproveRequest value)? approve,
    TResult? Function(_ApproveFinalRequest value)? approveFinal,
  }) {
    return loadDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequests value)? load,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FilterStatus value)? filterStatus,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_RejectRequest value)? reject,
    TResult Function(_CompleteRequest value)? complete,
    TResult Function(_ApproveRequest value)? approve,
    TResult Function(_ApproveFinalRequest value)? approveFinal,
    required TResult orElse(),
  }) {
    if (loadDetail != null) {
      return loadDetail(this);
    }
    return orElse();
  }
}

abstract class _LoadDetail implements AdminRequestEvent {
  const factory _LoadDetail(final int requestId) = _$LoadDetailImpl;

  int get requestId;

  /// Create a copy of AdminRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadDetailImplCopyWith<_$LoadDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RejectRequestImplCopyWith<$Res> {
  factory _$$RejectRequestImplCopyWith(
          _$RejectRequestImpl value, $Res Function(_$RejectRequestImpl) then) =
      __$$RejectRequestImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int requestId, String rejectReason});
}

/// @nodoc
class __$$RejectRequestImplCopyWithImpl<$Res>
    extends _$AdminRequestEventCopyWithImpl<$Res, _$RejectRequestImpl>
    implements _$$RejectRequestImplCopyWith<$Res> {
  __$$RejectRequestImplCopyWithImpl(
      _$RejectRequestImpl _value, $Res Function(_$RejectRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? rejectReason = null,
  }) {
    return _then(_$RejectRequestImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as int,
      rejectReason: null == rejectReason
          ? _value.rejectReason
          : rejectReason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RejectRequestImpl implements _RejectRequest {
  const _$RejectRequestImpl(
      {required this.requestId, required this.rejectReason});

  @override
  final int requestId;
  @override
  final String rejectReason;

  @override
  String toString() {
    return 'AdminRequestEvent.reject(requestId: $requestId, rejectReason: $rejectReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectRequestImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.rejectReason, rejectReason) ||
                other.rejectReason == rejectReason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestId, rejectReason);

  /// Create a copy of AdminRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectRequestImplCopyWith<_$RejectRequestImpl> get copyWith =>
      __$$RejectRequestImplCopyWithImpl<_$RejectRequestImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? status) load,
    required TResult Function() loadMore,
    required TResult Function(String? status) filterStatus,
    required TResult Function(int requestId) loadDetail,
    required TResult Function(int requestId, String rejectReason) reject,
    required TResult Function(int requestId) complete,
    required TResult Function(int requestId, List<Map<String, dynamic>> items)
        approve,
    required TResult Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)
        approveFinal,
  }) {
    return reject(requestId, rejectReason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? status)? load,
    TResult? Function()? loadMore,
    TResult? Function(String? status)? filterStatus,
    TResult? Function(int requestId)? loadDetail,
    TResult? Function(int requestId, String rejectReason)? reject,
    TResult? Function(int requestId)? complete,
    TResult? Function(int requestId, List<Map<String, dynamic>> items)? approve,
    TResult? Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)?
        approveFinal,
  }) {
    return reject?.call(requestId, rejectReason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? status)? load,
    TResult Function()? loadMore,
    TResult Function(String? status)? filterStatus,
    TResult Function(int requestId)? loadDetail,
    TResult Function(int requestId, String rejectReason)? reject,
    TResult Function(int requestId)? complete,
    TResult Function(int requestId, List<Map<String, dynamic>> items)? approve,
    TResult Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)?
        approveFinal,
    required TResult orElse(),
  }) {
    if (reject != null) {
      return reject(requestId, rejectReason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRequests value) load,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FilterStatus value) filterStatus,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_RejectRequest value) reject,
    required TResult Function(_CompleteRequest value) complete,
    required TResult Function(_ApproveRequest value) approve,
    required TResult Function(_ApproveFinalRequest value) approveFinal,
  }) {
    return reject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRequests value)? load,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FilterStatus value)? filterStatus,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_RejectRequest value)? reject,
    TResult? Function(_CompleteRequest value)? complete,
    TResult? Function(_ApproveRequest value)? approve,
    TResult? Function(_ApproveFinalRequest value)? approveFinal,
  }) {
    return reject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequests value)? load,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FilterStatus value)? filterStatus,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_RejectRequest value)? reject,
    TResult Function(_CompleteRequest value)? complete,
    TResult Function(_ApproveRequest value)? approve,
    TResult Function(_ApproveFinalRequest value)? approveFinal,
    required TResult orElse(),
  }) {
    if (reject != null) {
      return reject(this);
    }
    return orElse();
  }
}

abstract class _RejectRequest implements AdminRequestEvent {
  const factory _RejectRequest(
      {required final int requestId,
      required final String rejectReason}) = _$RejectRequestImpl;

  int get requestId;
  String get rejectReason;

  /// Create a copy of AdminRequestEvent
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
  $Res call({int requestId});
}

/// @nodoc
class __$$CompleteRequestImplCopyWithImpl<$Res>
    extends _$AdminRequestEventCopyWithImpl<$Res, _$CompleteRequestImpl>
    implements _$$CompleteRequestImplCopyWith<$Res> {
  __$$CompleteRequestImplCopyWithImpl(
      _$CompleteRequestImpl _value, $Res Function(_$CompleteRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
  }) {
    return _then(_$CompleteRequestImpl(
      null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CompleteRequestImpl implements _CompleteRequest {
  const _$CompleteRequestImpl(this.requestId);

  @override
  final int requestId;

  @override
  String toString() {
    return 'AdminRequestEvent.complete(requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteRequestImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestId);

  /// Create a copy of AdminRequestEvent
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
    required TResult Function(String? status) load,
    required TResult Function() loadMore,
    required TResult Function(String? status) filterStatus,
    required TResult Function(int requestId) loadDetail,
    required TResult Function(int requestId, String rejectReason) reject,
    required TResult Function(int requestId) complete,
    required TResult Function(int requestId, List<Map<String, dynamic>> items)
        approve,
    required TResult Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)
        approveFinal,
  }) {
    return complete(requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? status)? load,
    TResult? Function()? loadMore,
    TResult? Function(String? status)? filterStatus,
    TResult? Function(int requestId)? loadDetail,
    TResult? Function(int requestId, String rejectReason)? reject,
    TResult? Function(int requestId)? complete,
    TResult? Function(int requestId, List<Map<String, dynamic>> items)? approve,
    TResult? Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)?
        approveFinal,
  }) {
    return complete?.call(requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? status)? load,
    TResult Function()? loadMore,
    TResult Function(String? status)? filterStatus,
    TResult Function(int requestId)? loadDetail,
    TResult Function(int requestId, String rejectReason)? reject,
    TResult Function(int requestId)? complete,
    TResult Function(int requestId, List<Map<String, dynamic>> items)? approve,
    TResult Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)?
        approveFinal,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRequests value) load,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FilterStatus value) filterStatus,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_RejectRequest value) reject,
    required TResult Function(_CompleteRequest value) complete,
    required TResult Function(_ApproveRequest value) approve,
    required TResult Function(_ApproveFinalRequest value) approveFinal,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRequests value)? load,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FilterStatus value)? filterStatus,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_RejectRequest value)? reject,
    TResult? Function(_CompleteRequest value)? complete,
    TResult? Function(_ApproveRequest value)? approve,
    TResult? Function(_ApproveFinalRequest value)? approveFinal,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequests value)? load,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FilterStatus value)? filterStatus,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_RejectRequest value)? reject,
    TResult Function(_CompleteRequest value)? complete,
    TResult Function(_ApproveRequest value)? approve,
    TResult Function(_ApproveFinalRequest value)? approveFinal,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }
}

abstract class _CompleteRequest implements AdminRequestEvent {
  const factory _CompleteRequest(final int requestId) = _$CompleteRequestImpl;

  int get requestId;

  /// Create a copy of AdminRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompleteRequestImplCopyWith<_$CompleteRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApproveRequestImplCopyWith<$Res> {
  factory _$$ApproveRequestImplCopyWith(_$ApproveRequestImpl value,
          $Res Function(_$ApproveRequestImpl) then) =
      __$$ApproveRequestImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int requestId, List<Map<String, dynamic>> items});
}

/// @nodoc
class __$$ApproveRequestImplCopyWithImpl<$Res>
    extends _$AdminRequestEventCopyWithImpl<$Res, _$ApproveRequestImpl>
    implements _$$ApproveRequestImplCopyWith<$Res> {
  __$$ApproveRequestImplCopyWithImpl(
      _$ApproveRequestImpl _value, $Res Function(_$ApproveRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? items = null,
  }) {
    return _then(_$ApproveRequestImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$ApproveRequestImpl implements _ApproveRequest {
  const _$ApproveRequestImpl(
      {required this.requestId,
      required final List<Map<String, dynamic>> items})
      : _items = items;

  @override
  final int requestId;
  final List<Map<String, dynamic>> _items;
  @override
  List<Map<String, dynamic>> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'AdminRequestEvent.approve(requestId: $requestId, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveRequestImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, requestId, const DeepCollectionEquality().hash(_items));

  /// Create a copy of AdminRequestEvent
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
    required TResult Function(String? status) load,
    required TResult Function() loadMore,
    required TResult Function(String? status) filterStatus,
    required TResult Function(int requestId) loadDetail,
    required TResult Function(int requestId, String rejectReason) reject,
    required TResult Function(int requestId) complete,
    required TResult Function(int requestId, List<Map<String, dynamic>> items)
        approve,
    required TResult Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)
        approveFinal,
  }) {
    return approve(requestId, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? status)? load,
    TResult? Function()? loadMore,
    TResult? Function(String? status)? filterStatus,
    TResult? Function(int requestId)? loadDetail,
    TResult? Function(int requestId, String rejectReason)? reject,
    TResult? Function(int requestId)? complete,
    TResult? Function(int requestId, List<Map<String, dynamic>> items)? approve,
    TResult? Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)?
        approveFinal,
  }) {
    return approve?.call(requestId, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? status)? load,
    TResult Function()? loadMore,
    TResult Function(String? status)? filterStatus,
    TResult Function(int requestId)? loadDetail,
    TResult Function(int requestId, String rejectReason)? reject,
    TResult Function(int requestId)? complete,
    TResult Function(int requestId, List<Map<String, dynamic>> items)? approve,
    TResult Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)?
        approveFinal,
    required TResult orElse(),
  }) {
    if (approve != null) {
      return approve(requestId, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRequests value) load,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FilterStatus value) filterStatus,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_RejectRequest value) reject,
    required TResult Function(_CompleteRequest value) complete,
    required TResult Function(_ApproveRequest value) approve,
    required TResult Function(_ApproveFinalRequest value) approveFinal,
  }) {
    return approve(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRequests value)? load,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FilterStatus value)? filterStatus,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_RejectRequest value)? reject,
    TResult? Function(_CompleteRequest value)? complete,
    TResult? Function(_ApproveRequest value)? approve,
    TResult? Function(_ApproveFinalRequest value)? approveFinal,
  }) {
    return approve?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequests value)? load,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FilterStatus value)? filterStatus,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_RejectRequest value)? reject,
    TResult Function(_CompleteRequest value)? complete,
    TResult Function(_ApproveRequest value)? approve,
    TResult Function(_ApproveFinalRequest value)? approveFinal,
    required TResult orElse(),
  }) {
    if (approve != null) {
      return approve(this);
    }
    return orElse();
  }
}

abstract class _ApproveRequest implements AdminRequestEvent {
  const factory _ApproveRequest(
      {required final int requestId,
      required final List<Map<String, dynamic>> items}) = _$ApproveRequestImpl;

  int get requestId;
  List<Map<String, dynamic>> get items;

  /// Create a copy of AdminRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApproveRequestImplCopyWith<_$ApproveRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApproveFinalRequestImplCopyWith<$Res> {
  factory _$$ApproveFinalRequestImplCopyWith(_$ApproveFinalRequestImpl value,
          $Res Function(_$ApproveFinalRequestImpl) then) =
      __$$ApproveFinalRequestImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int requestId, int warehouseId, List<Map<String, dynamic>> items});
}

/// @nodoc
class __$$ApproveFinalRequestImplCopyWithImpl<$Res>
    extends _$AdminRequestEventCopyWithImpl<$Res, _$ApproveFinalRequestImpl>
    implements _$$ApproveFinalRequestImplCopyWith<$Res> {
  __$$ApproveFinalRequestImplCopyWithImpl(_$ApproveFinalRequestImpl _value,
      $Res Function(_$ApproveFinalRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? warehouseId = null,
    Object? items = null,
  }) {
    return _then(_$ApproveFinalRequestImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as int,
      warehouseId: null == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$ApproveFinalRequestImpl implements _ApproveFinalRequest {
  const _$ApproveFinalRequestImpl(
      {required this.requestId,
      required this.warehouseId,
      required final List<Map<String, dynamic>> items})
      : _items = items;

  @override
  final int requestId;
  @override
  final int warehouseId;
  final List<Map<String, dynamic>> _items;
  @override
  List<Map<String, dynamic>> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'AdminRequestEvent.approveFinal(requestId: $requestId, warehouseId: $warehouseId, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveFinalRequestImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestId, warehouseId,
      const DeepCollectionEquality().hash(_items));

  /// Create a copy of AdminRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveFinalRequestImplCopyWith<_$ApproveFinalRequestImpl> get copyWith =>
      __$$ApproveFinalRequestImplCopyWithImpl<_$ApproveFinalRequestImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? status) load,
    required TResult Function() loadMore,
    required TResult Function(String? status) filterStatus,
    required TResult Function(int requestId) loadDetail,
    required TResult Function(int requestId, String rejectReason) reject,
    required TResult Function(int requestId) complete,
    required TResult Function(int requestId, List<Map<String, dynamic>> items)
        approve,
    required TResult Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)
        approveFinal,
  }) {
    return approveFinal(requestId, warehouseId, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? status)? load,
    TResult? Function()? loadMore,
    TResult? Function(String? status)? filterStatus,
    TResult? Function(int requestId)? loadDetail,
    TResult? Function(int requestId, String rejectReason)? reject,
    TResult? Function(int requestId)? complete,
    TResult? Function(int requestId, List<Map<String, dynamic>> items)? approve,
    TResult? Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)?
        approveFinal,
  }) {
    return approveFinal?.call(requestId, warehouseId, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? status)? load,
    TResult Function()? loadMore,
    TResult Function(String? status)? filterStatus,
    TResult Function(int requestId)? loadDetail,
    TResult Function(int requestId, String rejectReason)? reject,
    TResult Function(int requestId)? complete,
    TResult Function(int requestId, List<Map<String, dynamic>> items)? approve,
    TResult Function(
            int requestId, int warehouseId, List<Map<String, dynamic>> items)?
        approveFinal,
    required TResult orElse(),
  }) {
    if (approveFinal != null) {
      return approveFinal(requestId, warehouseId, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRequests value) load,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FilterStatus value) filterStatus,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_RejectRequest value) reject,
    required TResult Function(_CompleteRequest value) complete,
    required TResult Function(_ApproveRequest value) approve,
    required TResult Function(_ApproveFinalRequest value) approveFinal,
  }) {
    return approveFinal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRequests value)? load,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FilterStatus value)? filterStatus,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_RejectRequest value)? reject,
    TResult? Function(_CompleteRequest value)? complete,
    TResult? Function(_ApproveRequest value)? approve,
    TResult? Function(_ApproveFinalRequest value)? approveFinal,
  }) {
    return approveFinal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRequests value)? load,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FilterStatus value)? filterStatus,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_RejectRequest value)? reject,
    TResult Function(_CompleteRequest value)? complete,
    TResult Function(_ApproveRequest value)? approve,
    TResult Function(_ApproveFinalRequest value)? approveFinal,
    required TResult orElse(),
  }) {
    if (approveFinal != null) {
      return approveFinal(this);
    }
    return orElse();
  }
}

abstract class _ApproveFinalRequest implements AdminRequestEvent {
  const factory _ApproveFinalRequest(
          {required final int requestId,
          required final int warehouseId,
          required final List<Map<String, dynamic>> items}) =
      _$ApproveFinalRequestImpl;

  int get requestId;
  int get warehouseId;
  List<Map<String, dynamic>> get items;

  /// Create a copy of AdminRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApproveFinalRequestImplCopyWith<_$ApproveFinalRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AdminRequestState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)
        loaded,
    required TResult Function() detailLoading,
    required TResult Function(Map<String, dynamic> detail) detailLoaded,
    required TResult Function() actionLoading,
    required TResult Function(String message) actionSuccess,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)?
        loaded,
    TResult? Function()? detailLoading,
    TResult? Function(Map<String, dynamic> detail)? detailLoaded,
    TResult? Function()? actionLoading,
    TResult? Function(String message)? actionSuccess,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)?
        loaded,
    TResult Function()? detailLoading,
    TResult Function(Map<String, dynamic> detail)? detailLoaded,
    TResult Function()? actionLoading,
    TResult Function(String message)? actionSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_DetailLoading value) detailLoading,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_ActionLoading value) actionLoading,
    required TResult Function(_ActionSuccess value) actionSuccess,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_DetailLoading value)? detailLoading,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_ActionLoading value)? actionLoading,
    TResult? Function(_ActionSuccess value)? actionSuccess,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_DetailLoading value)? detailLoading,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_ActionLoading value)? actionLoading,
    TResult Function(_ActionSuccess value)? actionSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminRequestStateCopyWith<$Res> {
  factory $AdminRequestStateCopyWith(
          AdminRequestState value, $Res Function(AdminRequestState) then) =
      _$AdminRequestStateCopyWithImpl<$Res, AdminRequestState>;
}

/// @nodoc
class _$AdminRequestStateCopyWithImpl<$Res, $Val extends AdminRequestState>
    implements $AdminRequestStateCopyWith<$Res> {
  _$AdminRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminRequestState
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
    extends _$AdminRequestStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminRequestState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AdminRequestState.initial()';
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
    required TResult Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)
        loaded,
    required TResult Function() detailLoading,
    required TResult Function(Map<String, dynamic> detail) detailLoaded,
    required TResult Function() actionLoading,
    required TResult Function(String message) actionSuccess,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)?
        loaded,
    TResult? Function()? detailLoading,
    TResult? Function(Map<String, dynamic> detail)? detailLoaded,
    TResult? Function()? actionLoading,
    TResult? Function(String message)? actionSuccess,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)?
        loaded,
    TResult Function()? detailLoading,
    TResult Function(Map<String, dynamic> detail)? detailLoaded,
    TResult Function()? actionLoading,
    TResult Function(String message)? actionSuccess,
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
    required TResult Function(_DetailLoading value) detailLoading,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_ActionLoading value) actionLoading,
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
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_DetailLoading value)? detailLoading,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_ActionLoading value)? actionLoading,
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
    TResult Function(_Loaded value)? loaded,
    TResult Function(_DetailLoading value)? detailLoading,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_ActionLoading value)? actionLoading,
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

abstract class _Initial implements AdminRequestState {
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
    extends _$AdminRequestStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminRequestState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AdminRequestState.loading()';
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
    required TResult Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)
        loaded,
    required TResult Function() detailLoading,
    required TResult Function(Map<String, dynamic> detail) detailLoaded,
    required TResult Function() actionLoading,
    required TResult Function(String message) actionSuccess,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)?
        loaded,
    TResult? Function()? detailLoading,
    TResult? Function(Map<String, dynamic> detail)? detailLoaded,
    TResult? Function()? actionLoading,
    TResult? Function(String message)? actionSuccess,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)?
        loaded,
    TResult Function()? detailLoading,
    TResult Function(Map<String, dynamic> detail)? detailLoaded,
    TResult Function()? actionLoading,
    TResult Function(String message)? actionSuccess,
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
    required TResult Function(_DetailLoading value) detailLoading,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_ActionLoading value) actionLoading,
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
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_DetailLoading value)? detailLoading,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_ActionLoading value)? actionLoading,
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
    TResult Function(_Loaded value)? loaded,
    TResult Function(_DetailLoading value)? detailLoading,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_ActionLoading value)? actionLoading,
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

abstract class _Loading implements AdminRequestState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<dynamic> items,
      int totalItems,
      bool hasMore,
      String? filterStatus});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$AdminRequestStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminRequestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalItems = null,
    Object? hasMore = null,
    Object? filterStatus = freezed,
  }) {
    return _then(_$LoadedImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      filterStatus: freezed == filterStatus
          ? _value.filterStatus
          : filterStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required final List<dynamic> items,
      required this.totalItems,
      required this.hasMore,
      this.filterStatus})
      : _items = items;

  final List<dynamic> _items;
  @override
  List<dynamic> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int totalItems;
  @override
  final bool hasMore;
  @override
  final String? filterStatus;

  @override
  String toString() {
    return 'AdminRequestState.loaded(items: $items, totalItems: $totalItems, hasMore: $hasMore, filterStatus: $filterStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.filterStatus, filterStatus) ||
                other.filterStatus == filterStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      totalItems,
      hasMore,
      filterStatus);

  /// Create a copy of AdminRequestState
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
    required TResult Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)
        loaded,
    required TResult Function() detailLoading,
    required TResult Function(Map<String, dynamic> detail) detailLoaded,
    required TResult Function() actionLoading,
    required TResult Function(String message) actionSuccess,
    required TResult Function(String message) error,
  }) {
    return loaded(items, totalItems, hasMore, filterStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)?
        loaded,
    TResult? Function()? detailLoading,
    TResult? Function(Map<String, dynamic> detail)? detailLoaded,
    TResult? Function()? actionLoading,
    TResult? Function(String message)? actionSuccess,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(items, totalItems, hasMore, filterStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)?
        loaded,
    TResult Function()? detailLoading,
    TResult Function(Map<String, dynamic> detail)? detailLoaded,
    TResult Function()? actionLoading,
    TResult Function(String message)? actionSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(items, totalItems, hasMore, filterStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_DetailLoading value) detailLoading,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_ActionLoading value) actionLoading,
    required TResult Function(_ActionSuccess value) actionSuccess,
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
    TResult? Function(_DetailLoading value)? detailLoading,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_ActionLoading value)? actionLoading,
    TResult? Function(_ActionSuccess value)? actionSuccess,
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
    TResult Function(_DetailLoading value)? detailLoading,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_ActionLoading value)? actionLoading,
    TResult Function(_ActionSuccess value)? actionSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements AdminRequestState {
  const factory _Loaded(
      {required final List<dynamic> items,
      required final int totalItems,
      required final bool hasMore,
      final String? filterStatus}) = _$LoadedImpl;

  List<dynamic> get items;
  int get totalItems;
  bool get hasMore;
  String? get filterStatus;

  /// Create a copy of AdminRequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailLoadingImplCopyWith<$Res> {
  factory _$$DetailLoadingImplCopyWith(
          _$DetailLoadingImpl value, $Res Function(_$DetailLoadingImpl) then) =
      __$$DetailLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DetailLoadingImplCopyWithImpl<$Res>
    extends _$AdminRequestStateCopyWithImpl<$Res, _$DetailLoadingImpl>
    implements _$$DetailLoadingImplCopyWith<$Res> {
  __$$DetailLoadingImplCopyWithImpl(
      _$DetailLoadingImpl _value, $Res Function(_$DetailLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminRequestState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DetailLoadingImpl implements _DetailLoading {
  const _$DetailLoadingImpl();

  @override
  String toString() {
    return 'AdminRequestState.detailLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DetailLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)
        loaded,
    required TResult Function() detailLoading,
    required TResult Function(Map<String, dynamic> detail) detailLoaded,
    required TResult Function() actionLoading,
    required TResult Function(String message) actionSuccess,
    required TResult Function(String message) error,
  }) {
    return detailLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)?
        loaded,
    TResult? Function()? detailLoading,
    TResult? Function(Map<String, dynamic> detail)? detailLoaded,
    TResult? Function()? actionLoading,
    TResult? Function(String message)? actionSuccess,
    TResult? Function(String message)? error,
  }) {
    return detailLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)?
        loaded,
    TResult Function()? detailLoading,
    TResult Function(Map<String, dynamic> detail)? detailLoaded,
    TResult Function()? actionLoading,
    TResult Function(String message)? actionSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (detailLoading != null) {
      return detailLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_DetailLoading value) detailLoading,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_ActionLoading value) actionLoading,
    required TResult Function(_ActionSuccess value) actionSuccess,
    required TResult Function(_Error value) error,
  }) {
    return detailLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_DetailLoading value)? detailLoading,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_ActionLoading value)? actionLoading,
    TResult? Function(_ActionSuccess value)? actionSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return detailLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_DetailLoading value)? detailLoading,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_ActionLoading value)? actionLoading,
    TResult Function(_ActionSuccess value)? actionSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (detailLoading != null) {
      return detailLoading(this);
    }
    return orElse();
  }
}

abstract class _DetailLoading implements AdminRequestState {
  const factory _DetailLoading() = _$DetailLoadingImpl;
}

/// @nodoc
abstract class _$$DetailLoadedImplCopyWith<$Res> {
  factory _$$DetailLoadedImplCopyWith(
          _$DetailLoadedImpl value, $Res Function(_$DetailLoadedImpl) then) =
      __$$DetailLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> detail});
}

/// @nodoc
class __$$DetailLoadedImplCopyWithImpl<$Res>
    extends _$AdminRequestStateCopyWithImpl<$Res, _$DetailLoadedImpl>
    implements _$$DetailLoadedImplCopyWith<$Res> {
  __$$DetailLoadedImplCopyWithImpl(
      _$DetailLoadedImpl _value, $Res Function(_$DetailLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminRequestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detail = null,
  }) {
    return _then(_$DetailLoadedImpl(
      null == detail
          ? _value._detail
          : detail // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$DetailLoadedImpl implements _DetailLoaded {
  const _$DetailLoadedImpl(final Map<String, dynamic> detail)
      : _detail = detail;

  final Map<String, dynamic> _detail;
  @override
  Map<String, dynamic> get detail {
    if (_detail is EqualUnmodifiableMapView) return _detail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_detail);
  }

  @override
  String toString() {
    return 'AdminRequestState.detailLoaded(detail: $detail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailLoadedImpl &&
            const DeepCollectionEquality().equals(other._detail, _detail));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_detail));

  /// Create a copy of AdminRequestState
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
    required TResult Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)
        loaded,
    required TResult Function() detailLoading,
    required TResult Function(Map<String, dynamic> detail) detailLoaded,
    required TResult Function() actionLoading,
    required TResult Function(String message) actionSuccess,
    required TResult Function(String message) error,
  }) {
    return detailLoaded(detail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)?
        loaded,
    TResult? Function()? detailLoading,
    TResult? Function(Map<String, dynamic> detail)? detailLoaded,
    TResult? Function()? actionLoading,
    TResult? Function(String message)? actionSuccess,
    TResult? Function(String message)? error,
  }) {
    return detailLoaded?.call(detail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)?
        loaded,
    TResult Function()? detailLoading,
    TResult Function(Map<String, dynamic> detail)? detailLoaded,
    TResult Function()? actionLoading,
    TResult Function(String message)? actionSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (detailLoaded != null) {
      return detailLoaded(detail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_DetailLoading value) detailLoading,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_ActionLoading value) actionLoading,
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
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_DetailLoading value)? detailLoading,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_ActionLoading value)? actionLoading,
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
    TResult Function(_Loaded value)? loaded,
    TResult Function(_DetailLoading value)? detailLoading,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_ActionLoading value)? actionLoading,
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

abstract class _DetailLoaded implements AdminRequestState {
  const factory _DetailLoaded(final Map<String, dynamic> detail) =
      _$DetailLoadedImpl;

  Map<String, dynamic> get detail;

  /// Create a copy of AdminRequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailLoadedImplCopyWith<_$DetailLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ActionLoadingImplCopyWith<$Res> {
  factory _$$ActionLoadingImplCopyWith(
          _$ActionLoadingImpl value, $Res Function(_$ActionLoadingImpl) then) =
      __$$ActionLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ActionLoadingImplCopyWithImpl<$Res>
    extends _$AdminRequestStateCopyWithImpl<$Res, _$ActionLoadingImpl>
    implements _$$ActionLoadingImplCopyWith<$Res> {
  __$$ActionLoadingImplCopyWithImpl(
      _$ActionLoadingImpl _value, $Res Function(_$ActionLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminRequestState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ActionLoadingImpl implements _ActionLoading {
  const _$ActionLoadingImpl();

  @override
  String toString() {
    return 'AdminRequestState.actionLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ActionLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)
        loaded,
    required TResult Function() detailLoading,
    required TResult Function(Map<String, dynamic> detail) detailLoaded,
    required TResult Function() actionLoading,
    required TResult Function(String message) actionSuccess,
    required TResult Function(String message) error,
  }) {
    return actionLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)?
        loaded,
    TResult? Function()? detailLoading,
    TResult? Function(Map<String, dynamic> detail)? detailLoaded,
    TResult? Function()? actionLoading,
    TResult? Function(String message)? actionSuccess,
    TResult? Function(String message)? error,
  }) {
    return actionLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)?
        loaded,
    TResult Function()? detailLoading,
    TResult Function(Map<String, dynamic> detail)? detailLoaded,
    TResult Function()? actionLoading,
    TResult Function(String message)? actionSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (actionLoading != null) {
      return actionLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_DetailLoading value) detailLoading,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_ActionLoading value) actionLoading,
    required TResult Function(_ActionSuccess value) actionSuccess,
    required TResult Function(_Error value) error,
  }) {
    return actionLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_DetailLoading value)? detailLoading,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_ActionLoading value)? actionLoading,
    TResult? Function(_ActionSuccess value)? actionSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return actionLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_DetailLoading value)? detailLoading,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_ActionLoading value)? actionLoading,
    TResult Function(_ActionSuccess value)? actionSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (actionLoading != null) {
      return actionLoading(this);
    }
    return orElse();
  }
}

abstract class _ActionLoading implements AdminRequestState {
  const factory _ActionLoading() = _$ActionLoadingImpl;
}

/// @nodoc
abstract class _$$ActionSuccessImplCopyWith<$Res> {
  factory _$$ActionSuccessImplCopyWith(
          _$ActionSuccessImpl value, $Res Function(_$ActionSuccessImpl) then) =
      __$$ActionSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ActionSuccessImplCopyWithImpl<$Res>
    extends _$AdminRequestStateCopyWithImpl<$Res, _$ActionSuccessImpl>
    implements _$$ActionSuccessImplCopyWith<$Res> {
  __$$ActionSuccessImplCopyWithImpl(
      _$ActionSuccessImpl _value, $Res Function(_$ActionSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminRequestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ActionSuccessImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ActionSuccessImpl implements _ActionSuccess {
  const _$ActionSuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AdminRequestState.actionSuccess(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AdminRequestState
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
    required TResult Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)
        loaded,
    required TResult Function() detailLoading,
    required TResult Function(Map<String, dynamic> detail) detailLoaded,
    required TResult Function() actionLoading,
    required TResult Function(String message) actionSuccess,
    required TResult Function(String message) error,
  }) {
    return actionSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)?
        loaded,
    TResult? Function()? detailLoading,
    TResult? Function(Map<String, dynamic> detail)? detailLoaded,
    TResult? Function()? actionLoading,
    TResult? Function(String message)? actionSuccess,
    TResult? Function(String message)? error,
  }) {
    return actionSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)?
        loaded,
    TResult Function()? detailLoading,
    TResult Function(Map<String, dynamic> detail)? detailLoaded,
    TResult Function()? actionLoading,
    TResult Function(String message)? actionSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (actionSuccess != null) {
      return actionSuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_DetailLoading value) detailLoading,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_ActionLoading value) actionLoading,
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
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_DetailLoading value)? detailLoading,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_ActionLoading value)? actionLoading,
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
    TResult Function(_Loaded value)? loaded,
    TResult Function(_DetailLoading value)? detailLoading,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_ActionLoading value)? actionLoading,
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

abstract class _ActionSuccess implements AdminRequestState {
  const factory _ActionSuccess(final String message) = _$ActionSuccessImpl;

  String get message;

  /// Create a copy of AdminRequestState
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
    extends _$AdminRequestStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminRequestState
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
    return 'AdminRequestState.error(message: $message)';
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

  /// Create a copy of AdminRequestState
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
    required TResult Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)
        loaded,
    required TResult Function() detailLoading,
    required TResult Function(Map<String, dynamic> detail) detailLoaded,
    required TResult Function() actionLoading,
    required TResult Function(String message) actionSuccess,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)?
        loaded,
    TResult? Function()? detailLoading,
    TResult? Function(Map<String, dynamic> detail)? detailLoaded,
    TResult? Function()? actionLoading,
    TResult? Function(String message)? actionSuccess,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<dynamic> items, int totalItems, bool hasMore,
            String? filterStatus)?
        loaded,
    TResult Function()? detailLoading,
    TResult Function(Map<String, dynamic> detail)? detailLoaded,
    TResult Function()? actionLoading,
    TResult Function(String message)? actionSuccess,
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
    required TResult Function(_DetailLoading value) detailLoading,
    required TResult Function(_DetailLoaded value) detailLoaded,
    required TResult Function(_ActionLoading value) actionLoading,
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
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_DetailLoading value)? detailLoading,
    TResult? Function(_DetailLoaded value)? detailLoaded,
    TResult? Function(_ActionLoading value)? actionLoading,
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
    TResult Function(_Loaded value)? loaded,
    TResult Function(_DetailLoading value)? detailLoading,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_ActionLoading value)? actionLoading,
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

abstract class _Error implements AdminRequestState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of AdminRequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
