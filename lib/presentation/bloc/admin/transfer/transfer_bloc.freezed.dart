// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransferEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)
        load,
    required TResult Function(String? status) filter,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) approve,
    required TResult Function(int id, List<Map<String, dynamic>> items) send,
    required TResult Function(int id, List<Map<String, dynamic>> items) receive,
    required TResult Function(int id, String reason) reject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)?
        load,
    TResult? Function(String? status)? filter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? approve,
    TResult? Function(int id, List<Map<String, dynamic>> items)? send,
    TResult? Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult? Function(int id, String reason)? reject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)?
        load,
    TResult Function(String? status)? filter,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? approve,
    TResult Function(int id, List<Map<String, dynamic>> items)? send,
    TResult Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult Function(int id, String reason)? reject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Filter value) filter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_Store value) store,
    required TResult Function(_Approve value) approve,
    required TResult Function(_Send value) send,
    required TResult Function(_Receive value) receive,
    required TResult Function(_Reject value) reject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Filter value)? filter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_Store value)? store,
    TResult? Function(_Approve value)? approve,
    TResult? Function(_Send value)? send,
    TResult? Function(_Receive value)? receive,
    TResult? Function(_Reject value)? reject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Filter value)? filter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_Store value)? store,
    TResult Function(_Approve value)? approve,
    TResult Function(_Send value)? send,
    TResult Function(_Receive value)? receive,
    TResult Function(_Reject value)? reject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferEventCopyWith<$Res> {
  factory $TransferEventCopyWith(
          TransferEvent value, $Res Function(TransferEvent) then) =
      _$TransferEventCopyWithImpl<$Res, TransferEvent>;
}

/// @nodoc
class _$TransferEventCopyWithImpl<$Res, $Val extends TransferEvent>
    implements $TransferEventCopyWith<$Res> {
  _$TransferEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadImplCopyWith<$Res> {
  factory _$$LoadImplCopyWith(
          _$LoadImpl value, $Res Function(_$LoadImpl) then) =
      __$$LoadImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int page, String? status, int? fromWarehouseId, int? toWarehouseId});
}

/// @nodoc
class __$$LoadImplCopyWithImpl<$Res>
    extends _$TransferEventCopyWithImpl<$Res, _$LoadImpl>
    implements _$$LoadImplCopyWith<$Res> {
  __$$LoadImplCopyWithImpl(_$LoadImpl _value, $Res Function(_$LoadImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? status = freezed,
    Object? fromWarehouseId = freezed,
    Object? toWarehouseId = freezed,
  }) {
    return _then(_$LoadImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      fromWarehouseId: freezed == fromWarehouseId
          ? _value.fromWarehouseId
          : fromWarehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
      toWarehouseId: freezed == toWarehouseId
          ? _value.toWarehouseId
          : toWarehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$LoadImpl implements _Load {
  const _$LoadImpl(
      {this.page = 1, this.status, this.fromWarehouseId, this.toWarehouseId});

  @override
  @JsonKey()
  final int page;
  @override
  final String? status;
  @override
  final int? fromWarehouseId;
  @override
  final int? toWarehouseId;

  @override
  String toString() {
    return 'TransferEvent.load(page: $page, status: $status, fromWarehouseId: $fromWarehouseId, toWarehouseId: $toWarehouseId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.fromWarehouseId, fromWarehouseId) ||
                other.fromWarehouseId == fromWarehouseId) &&
            (identical(other.toWarehouseId, toWarehouseId) ||
                other.toWarehouseId == toWarehouseId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, page, status, fromWarehouseId, toWarehouseId);

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      __$$LoadImplCopyWithImpl<_$LoadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)
        load,
    required TResult Function(String? status) filter,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) approve,
    required TResult Function(int id, List<Map<String, dynamic>> items) send,
    required TResult Function(int id, List<Map<String, dynamic>> items) receive,
    required TResult Function(int id, String reason) reject,
  }) {
    return load(page, status, fromWarehouseId, toWarehouseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)?
        load,
    TResult? Function(String? status)? filter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? approve,
    TResult? Function(int id, List<Map<String, dynamic>> items)? send,
    TResult? Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult? Function(int id, String reason)? reject,
  }) {
    return load?.call(page, status, fromWarehouseId, toWarehouseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)?
        load,
    TResult Function(String? status)? filter,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? approve,
    TResult Function(int id, List<Map<String, dynamic>> items)? send,
    TResult Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult Function(int id, String reason)? reject,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(page, status, fromWarehouseId, toWarehouseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Filter value) filter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_Store value) store,
    required TResult Function(_Approve value) approve,
    required TResult Function(_Send value) send,
    required TResult Function(_Receive value) receive,
    required TResult Function(_Reject value) reject,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Filter value)? filter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_Store value)? store,
    TResult? Function(_Approve value)? approve,
    TResult? Function(_Send value)? send,
    TResult? Function(_Receive value)? receive,
    TResult? Function(_Reject value)? reject,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Filter value)? filter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_Store value)? store,
    TResult Function(_Approve value)? approve,
    TResult Function(_Send value)? send,
    TResult Function(_Receive value)? receive,
    TResult Function(_Reject value)? reject,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements TransferEvent {
  const factory _Load(
      {final int page,
      final String? status,
      final int? fromWarehouseId,
      final int? toWarehouseId}) = _$LoadImpl;

  int get page;
  String? get status;
  int? get fromWarehouseId;
  int? get toWarehouseId;

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterImplCopyWith<$Res> {
  factory _$$FilterImplCopyWith(
          _$FilterImpl value, $Res Function(_$FilterImpl) then) =
      __$$FilterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? status});
}

/// @nodoc
class __$$FilterImplCopyWithImpl<$Res>
    extends _$TransferEventCopyWithImpl<$Res, _$FilterImpl>
    implements _$$FilterImplCopyWith<$Res> {
  __$$FilterImplCopyWithImpl(
      _$FilterImpl _value, $Res Function(_$FilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$FilterImpl(
      freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FilterImpl implements _Filter {
  const _$FilterImpl(this.status);

  @override
  final String? status;

  @override
  String toString() {
    return 'TransferEvent.filter(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterImplCopyWith<_$FilterImpl> get copyWith =>
      __$$FilterImplCopyWithImpl<_$FilterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)
        load,
    required TResult Function(String? status) filter,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) approve,
    required TResult Function(int id, List<Map<String, dynamic>> items) send,
    required TResult Function(int id, List<Map<String, dynamic>> items) receive,
    required TResult Function(int id, String reason) reject,
  }) {
    return filter(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)?
        load,
    TResult? Function(String? status)? filter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? approve,
    TResult? Function(int id, List<Map<String, dynamic>> items)? send,
    TResult? Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult? Function(int id, String reason)? reject,
  }) {
    return filter?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)?
        load,
    TResult Function(String? status)? filter,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? approve,
    TResult Function(int id, List<Map<String, dynamic>> items)? send,
    TResult Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult Function(int id, String reason)? reject,
    required TResult orElse(),
  }) {
    if (filter != null) {
      return filter(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Filter value) filter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_Store value) store,
    required TResult Function(_Approve value) approve,
    required TResult Function(_Send value) send,
    required TResult Function(_Receive value) receive,
    required TResult Function(_Reject value) reject,
  }) {
    return filter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Filter value)? filter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_Store value)? store,
    TResult? Function(_Approve value)? approve,
    TResult? Function(_Send value)? send,
    TResult? Function(_Receive value)? receive,
    TResult? Function(_Reject value)? reject,
  }) {
    return filter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Filter value)? filter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_Store value)? store,
    TResult Function(_Approve value)? approve,
    TResult Function(_Send value)? send,
    TResult Function(_Receive value)? receive,
    TResult Function(_Reject value)? reject,
    required TResult orElse(),
  }) {
    if (filter != null) {
      return filter(this);
    }
    return orElse();
  }
}

abstract class _Filter implements TransferEvent {
  const factory _Filter(final String? status) = _$FilterImpl;

  String? get status;

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterImplCopyWith<_$FilterImpl> get copyWith =>
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
    extends _$TransferEventCopyWithImpl<$Res, _$LoadDetailImpl>
    implements _$$LoadDetailImplCopyWith<$Res> {
  __$$LoadDetailImplCopyWithImpl(
      _$LoadDetailImpl _value, $Res Function(_$LoadDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferEvent
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
    return 'TransferEvent.loadDetail(id: $id)';
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

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadDetailImplCopyWith<_$LoadDetailImpl> get copyWith =>
      __$$LoadDetailImplCopyWithImpl<_$LoadDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)
        load,
    required TResult Function(String? status) filter,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) approve,
    required TResult Function(int id, List<Map<String, dynamic>> items) send,
    required TResult Function(int id, List<Map<String, dynamic>> items) receive,
    required TResult Function(int id, String reason) reject,
  }) {
    return loadDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)?
        load,
    TResult? Function(String? status)? filter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? approve,
    TResult? Function(int id, List<Map<String, dynamic>> items)? send,
    TResult? Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult? Function(int id, String reason)? reject,
  }) {
    return loadDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)?
        load,
    TResult Function(String? status)? filter,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? approve,
    TResult Function(int id, List<Map<String, dynamic>> items)? send,
    TResult Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult Function(int id, String reason)? reject,
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
    required TResult Function(_Load value) load,
    required TResult Function(_Filter value) filter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_Store value) store,
    required TResult Function(_Approve value) approve,
    required TResult Function(_Send value) send,
    required TResult Function(_Receive value) receive,
    required TResult Function(_Reject value) reject,
  }) {
    return loadDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Filter value)? filter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_Store value)? store,
    TResult? Function(_Approve value)? approve,
    TResult? Function(_Send value)? send,
    TResult? Function(_Receive value)? receive,
    TResult? Function(_Reject value)? reject,
  }) {
    return loadDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Filter value)? filter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_Store value)? store,
    TResult Function(_Approve value)? approve,
    TResult Function(_Send value)? send,
    TResult Function(_Receive value)? receive,
    TResult Function(_Reject value)? reject,
    required TResult orElse(),
  }) {
    if (loadDetail != null) {
      return loadDetail(this);
    }
    return orElse();
  }
}

abstract class _LoadDetail implements TransferEvent {
  const factory _LoadDetail(final int id) = _$LoadDetailImpl;

  int get id;

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadDetailImplCopyWith<_$LoadDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoreImplCopyWith<$Res> {
  factory _$$StoreImplCopyWith(
          _$StoreImpl value, $Res Function(_$StoreImpl) then) =
      __$$StoreImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> body});
}

/// @nodoc
class __$$StoreImplCopyWithImpl<$Res>
    extends _$TransferEventCopyWithImpl<$Res, _$StoreImpl>
    implements _$$StoreImplCopyWith<$Res> {
  __$$StoreImplCopyWithImpl(
      _$StoreImpl _value, $Res Function(_$StoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$StoreImpl(
      null == body
          ? _value._body
          : body // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$StoreImpl implements _Store {
  const _$StoreImpl(final Map<String, dynamic> body) : _body = body;

  final Map<String, dynamic> _body;
  @override
  Map<String, dynamic> get body {
    if (_body is EqualUnmodifiableMapView) return _body;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_body);
  }

  @override
  String toString() {
    return 'TransferEvent.store(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreImpl &&
            const DeepCollectionEquality().equals(other._body, _body));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_body));

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
      __$$StoreImplCopyWithImpl<_$StoreImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)
        load,
    required TResult Function(String? status) filter,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) approve,
    required TResult Function(int id, List<Map<String, dynamic>> items) send,
    required TResult Function(int id, List<Map<String, dynamic>> items) receive,
    required TResult Function(int id, String reason) reject,
  }) {
    return store(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)?
        load,
    TResult? Function(String? status)? filter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? approve,
    TResult? Function(int id, List<Map<String, dynamic>> items)? send,
    TResult? Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult? Function(int id, String reason)? reject,
  }) {
    return store?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)?
        load,
    TResult Function(String? status)? filter,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? approve,
    TResult Function(int id, List<Map<String, dynamic>> items)? send,
    TResult Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult Function(int id, String reason)? reject,
    required TResult orElse(),
  }) {
    if (store != null) {
      return store(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Filter value) filter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_Store value) store,
    required TResult Function(_Approve value) approve,
    required TResult Function(_Send value) send,
    required TResult Function(_Receive value) receive,
    required TResult Function(_Reject value) reject,
  }) {
    return store(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Filter value)? filter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_Store value)? store,
    TResult? Function(_Approve value)? approve,
    TResult? Function(_Send value)? send,
    TResult? Function(_Receive value)? receive,
    TResult? Function(_Reject value)? reject,
  }) {
    return store?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Filter value)? filter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_Store value)? store,
    TResult Function(_Approve value)? approve,
    TResult Function(_Send value)? send,
    TResult Function(_Receive value)? receive,
    TResult Function(_Reject value)? reject,
    required TResult orElse(),
  }) {
    if (store != null) {
      return store(this);
    }
    return orElse();
  }
}

abstract class _Store implements TransferEvent {
  const factory _Store(final Map<String, dynamic> body) = _$StoreImpl;

  Map<String, dynamic> get body;

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApproveImplCopyWith<$Res> {
  factory _$$ApproveImplCopyWith(
          _$ApproveImpl value, $Res Function(_$ApproveImpl) then) =
      __$$ApproveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$ApproveImplCopyWithImpl<$Res>
    extends _$TransferEventCopyWithImpl<$Res, _$ApproveImpl>
    implements _$$ApproveImplCopyWith<$Res> {
  __$$ApproveImplCopyWithImpl(
      _$ApproveImpl _value, $Res Function(_$ApproveImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ApproveImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ApproveImpl implements _Approve {
  const _$ApproveImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'TransferEvent.approve(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveImplCopyWith<_$ApproveImpl> get copyWith =>
      __$$ApproveImplCopyWithImpl<_$ApproveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)
        load,
    required TResult Function(String? status) filter,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) approve,
    required TResult Function(int id, List<Map<String, dynamic>> items) send,
    required TResult Function(int id, List<Map<String, dynamic>> items) receive,
    required TResult Function(int id, String reason) reject,
  }) {
    return approve(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)?
        load,
    TResult? Function(String? status)? filter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? approve,
    TResult? Function(int id, List<Map<String, dynamic>> items)? send,
    TResult? Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult? Function(int id, String reason)? reject,
  }) {
    return approve?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)?
        load,
    TResult Function(String? status)? filter,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? approve,
    TResult Function(int id, List<Map<String, dynamic>> items)? send,
    TResult Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult Function(int id, String reason)? reject,
    required TResult orElse(),
  }) {
    if (approve != null) {
      return approve(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Filter value) filter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_Store value) store,
    required TResult Function(_Approve value) approve,
    required TResult Function(_Send value) send,
    required TResult Function(_Receive value) receive,
    required TResult Function(_Reject value) reject,
  }) {
    return approve(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Filter value)? filter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_Store value)? store,
    TResult? Function(_Approve value)? approve,
    TResult? Function(_Send value)? send,
    TResult? Function(_Receive value)? receive,
    TResult? Function(_Reject value)? reject,
  }) {
    return approve?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Filter value)? filter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_Store value)? store,
    TResult Function(_Approve value)? approve,
    TResult Function(_Send value)? send,
    TResult Function(_Receive value)? receive,
    TResult Function(_Reject value)? reject,
    required TResult orElse(),
  }) {
    if (approve != null) {
      return approve(this);
    }
    return orElse();
  }
}

abstract class _Approve implements TransferEvent {
  const factory _Approve(final int id) = _$ApproveImpl;

  int get id;

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApproveImplCopyWith<_$ApproveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendImplCopyWith<$Res> {
  factory _$$SendImplCopyWith(
          _$SendImpl value, $Res Function(_$SendImpl) then) =
      __$$SendImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, List<Map<String, dynamic>> items});
}

/// @nodoc
class __$$SendImplCopyWithImpl<$Res>
    extends _$TransferEventCopyWithImpl<$Res, _$SendImpl>
    implements _$$SendImplCopyWith<$Res> {
  __$$SendImplCopyWithImpl(_$SendImpl _value, $Res Function(_$SendImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? items = null,
  }) {
    return _then(_$SendImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$SendImpl implements _Send {
  const _$SendImpl(
      {required this.id, required final List<Map<String, dynamic>> items})
      : _items = items;

  @override
  final int id;
  final List<Map<String, dynamic>> _items;
  @override
  List<Map<String, dynamic>> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'TransferEvent.send(id: $id, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, const DeepCollectionEquality().hash(_items));

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendImplCopyWith<_$SendImpl> get copyWith =>
      __$$SendImplCopyWithImpl<_$SendImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)
        load,
    required TResult Function(String? status) filter,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) approve,
    required TResult Function(int id, List<Map<String, dynamic>> items) send,
    required TResult Function(int id, List<Map<String, dynamic>> items) receive,
    required TResult Function(int id, String reason) reject,
  }) {
    return send(id, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)?
        load,
    TResult? Function(String? status)? filter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? approve,
    TResult? Function(int id, List<Map<String, dynamic>> items)? send,
    TResult? Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult? Function(int id, String reason)? reject,
  }) {
    return send?.call(id, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)?
        load,
    TResult Function(String? status)? filter,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? approve,
    TResult Function(int id, List<Map<String, dynamic>> items)? send,
    TResult Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult Function(int id, String reason)? reject,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(id, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Filter value) filter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_Store value) store,
    required TResult Function(_Approve value) approve,
    required TResult Function(_Send value) send,
    required TResult Function(_Receive value) receive,
    required TResult Function(_Reject value) reject,
  }) {
    return send(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Filter value)? filter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_Store value)? store,
    TResult? Function(_Approve value)? approve,
    TResult? Function(_Send value)? send,
    TResult? Function(_Receive value)? receive,
    TResult? Function(_Reject value)? reject,
  }) {
    return send?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Filter value)? filter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_Store value)? store,
    TResult Function(_Approve value)? approve,
    TResult Function(_Send value)? send,
    TResult Function(_Receive value)? receive,
    TResult Function(_Reject value)? reject,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(this);
    }
    return orElse();
  }
}

abstract class _Send implements TransferEvent {
  const factory _Send(
      {required final int id,
      required final List<Map<String, dynamic>> items}) = _$SendImpl;

  int get id;
  List<Map<String, dynamic>> get items;

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendImplCopyWith<_$SendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReceiveImplCopyWith<$Res> {
  factory _$$ReceiveImplCopyWith(
          _$ReceiveImpl value, $Res Function(_$ReceiveImpl) then) =
      __$$ReceiveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, List<Map<String, dynamic>> items});
}

/// @nodoc
class __$$ReceiveImplCopyWithImpl<$Res>
    extends _$TransferEventCopyWithImpl<$Res, _$ReceiveImpl>
    implements _$$ReceiveImplCopyWith<$Res> {
  __$$ReceiveImplCopyWithImpl(
      _$ReceiveImpl _value, $Res Function(_$ReceiveImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? items = null,
  }) {
    return _then(_$ReceiveImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$ReceiveImpl implements _Receive {
  const _$ReceiveImpl(
      {required this.id, required final List<Map<String, dynamic>> items})
      : _items = items;

  @override
  final int id;
  final List<Map<String, dynamic>> _items;
  @override
  List<Map<String, dynamic>> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'TransferEvent.receive(id: $id, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiveImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, const DeepCollectionEquality().hash(_items));

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiveImplCopyWith<_$ReceiveImpl> get copyWith =>
      __$$ReceiveImplCopyWithImpl<_$ReceiveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)
        load,
    required TResult Function(String? status) filter,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) approve,
    required TResult Function(int id, List<Map<String, dynamic>> items) send,
    required TResult Function(int id, List<Map<String, dynamic>> items) receive,
    required TResult Function(int id, String reason) reject,
  }) {
    return receive(id, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)?
        load,
    TResult? Function(String? status)? filter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? approve,
    TResult? Function(int id, List<Map<String, dynamic>> items)? send,
    TResult? Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult? Function(int id, String reason)? reject,
  }) {
    return receive?.call(id, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)?
        load,
    TResult Function(String? status)? filter,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? approve,
    TResult Function(int id, List<Map<String, dynamic>> items)? send,
    TResult Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult Function(int id, String reason)? reject,
    required TResult orElse(),
  }) {
    if (receive != null) {
      return receive(id, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Filter value) filter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_Store value) store,
    required TResult Function(_Approve value) approve,
    required TResult Function(_Send value) send,
    required TResult Function(_Receive value) receive,
    required TResult Function(_Reject value) reject,
  }) {
    return receive(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Filter value)? filter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_Store value)? store,
    TResult? Function(_Approve value)? approve,
    TResult? Function(_Send value)? send,
    TResult? Function(_Receive value)? receive,
    TResult? Function(_Reject value)? reject,
  }) {
    return receive?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Filter value)? filter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_Store value)? store,
    TResult Function(_Approve value)? approve,
    TResult Function(_Send value)? send,
    TResult Function(_Receive value)? receive,
    TResult Function(_Reject value)? reject,
    required TResult orElse(),
  }) {
    if (receive != null) {
      return receive(this);
    }
    return orElse();
  }
}

abstract class _Receive implements TransferEvent {
  const factory _Receive(
      {required final int id,
      required final List<Map<String, dynamic>> items}) = _$ReceiveImpl;

  int get id;
  List<Map<String, dynamic>> get items;

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiveImplCopyWith<_$ReceiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RejectImplCopyWith<$Res> {
  factory _$$RejectImplCopyWith(
          _$RejectImpl value, $Res Function(_$RejectImpl) then) =
      __$$RejectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, String reason});
}

/// @nodoc
class __$$RejectImplCopyWithImpl<$Res>
    extends _$TransferEventCopyWithImpl<$Res, _$RejectImpl>
    implements _$$RejectImplCopyWith<$Res> {
  __$$RejectImplCopyWithImpl(
      _$RejectImpl _value, $Res Function(_$RejectImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reason = null,
  }) {
    return _then(_$RejectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RejectImpl implements _Reject {
  const _$RejectImpl({required this.id, required this.reason});

  @override
  final int id;
  @override
  final String reason;

  @override
  String toString() {
    return 'TransferEvent.reject(id: $id, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, reason);

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectImplCopyWith<_$RejectImpl> get copyWith =>
      __$$RejectImplCopyWithImpl<_$RejectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)
        load,
    required TResult Function(String? status) filter,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) approve,
    required TResult Function(int id, List<Map<String, dynamic>> items) send,
    required TResult Function(int id, List<Map<String, dynamic>> items) receive,
    required TResult Function(int id, String reason) reject,
  }) {
    return reject(id, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)?
        load,
    TResult? Function(String? status)? filter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? approve,
    TResult? Function(int id, List<Map<String, dynamic>> items)? send,
    TResult? Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult? Function(int id, String reason)? reject,
  }) {
    return reject?.call(id, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int page, String? status, int? fromWarehouseId, int? toWarehouseId)?
        load,
    TResult Function(String? status)? filter,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? approve,
    TResult Function(int id, List<Map<String, dynamic>> items)? send,
    TResult Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult Function(int id, String reason)? reject,
    required TResult orElse(),
  }) {
    if (reject != null) {
      return reject(id, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Filter value) filter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_Store value) store,
    required TResult Function(_Approve value) approve,
    required TResult Function(_Send value) send,
    required TResult Function(_Receive value) receive,
    required TResult Function(_Reject value) reject,
  }) {
    return reject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Filter value)? filter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_Store value)? store,
    TResult? Function(_Approve value)? approve,
    TResult? Function(_Send value)? send,
    TResult? Function(_Receive value)? receive,
    TResult? Function(_Reject value)? reject,
  }) {
    return reject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Filter value)? filter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_Store value)? store,
    TResult Function(_Approve value)? approve,
    TResult Function(_Send value)? send,
    TResult Function(_Receive value)? receive,
    TResult Function(_Reject value)? reject,
    required TResult orElse(),
  }) {
    if (reject != null) {
      return reject(this);
    }
    return orElse();
  }
}

abstract class _Reject implements TransferEvent {
  const factory _Reject({required final int id, required final String reason}) =
      _$RejectImpl;

  int get id;
  String get reason;

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RejectImplCopyWith<_$RejectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransferState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() actionLoading,
    required TResult Function(StockTransferListResponse result) listLoaded,
    required TResult Function(StockTransferSingleResponse result) detailLoaded,
    required TResult Function(String message, StockTransferSingleResponse? data)
        actionSuccess,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? actionLoading,
    TResult? Function(StockTransferListResponse result)? listLoaded,
    TResult? Function(StockTransferSingleResponse result)? detailLoaded,
    TResult? Function(String message, StockTransferSingleResponse? data)?
        actionSuccess,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? actionLoading,
    TResult Function(StockTransferListResponse result)? listLoaded,
    TResult Function(StockTransferSingleResponse result)? detailLoaded,
    TResult Function(String message, StockTransferSingleResponse? data)?
        actionSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ActionLoading value) actionLoading,
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
    TResult? Function(_ActionLoading value)? actionLoading,
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
    TResult Function(_ActionLoading value)? actionLoading,
    TResult Function(_ListLoaded value)? listLoaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
    TResult Function(_ActionSuccess value)? actionSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferStateCopyWith<$Res> {
  factory $TransferStateCopyWith(
          TransferState value, $Res Function(TransferState) then) =
      _$TransferStateCopyWithImpl<$Res, TransferState>;
}

/// @nodoc
class _$TransferStateCopyWithImpl<$Res, $Val extends TransferState>
    implements $TransferStateCopyWith<$Res> {
  _$TransferStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransferState
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
    extends _$TransferStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'TransferState.initial()';
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
    required TResult Function() actionLoading,
    required TResult Function(StockTransferListResponse result) listLoaded,
    required TResult Function(StockTransferSingleResponse result) detailLoaded,
    required TResult Function(String message, StockTransferSingleResponse? data)
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
    TResult? Function()? actionLoading,
    TResult? Function(StockTransferListResponse result)? listLoaded,
    TResult? Function(StockTransferSingleResponse result)? detailLoaded,
    TResult? Function(String message, StockTransferSingleResponse? data)?
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
    TResult Function()? actionLoading,
    TResult Function(StockTransferListResponse result)? listLoaded,
    TResult Function(StockTransferSingleResponse result)? detailLoaded,
    TResult Function(String message, StockTransferSingleResponse? data)?
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
    required TResult Function(_ActionLoading value) actionLoading,
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
    TResult? Function(_ActionLoading value)? actionLoading,
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
    TResult Function(_ActionLoading value)? actionLoading,
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

abstract class _Initial implements TransferState {
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
    extends _$TransferStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'TransferState.loading()';
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
    required TResult Function() actionLoading,
    required TResult Function(StockTransferListResponse result) listLoaded,
    required TResult Function(StockTransferSingleResponse result) detailLoaded,
    required TResult Function(String message, StockTransferSingleResponse? data)
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
    TResult? Function()? actionLoading,
    TResult? Function(StockTransferListResponse result)? listLoaded,
    TResult? Function(StockTransferSingleResponse result)? detailLoaded,
    TResult? Function(String message, StockTransferSingleResponse? data)?
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
    TResult Function()? actionLoading,
    TResult Function(StockTransferListResponse result)? listLoaded,
    TResult Function(StockTransferSingleResponse result)? detailLoaded,
    TResult Function(String message, StockTransferSingleResponse? data)?
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
    required TResult Function(_ActionLoading value) actionLoading,
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
    TResult? Function(_ActionLoading value)? actionLoading,
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
    TResult Function(_ActionLoading value)? actionLoading,
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

abstract class _Loading implements TransferState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ActionLoadingImplCopyWith<$Res> {
  factory _$$ActionLoadingImplCopyWith(
          _$ActionLoadingImpl value, $Res Function(_$ActionLoadingImpl) then) =
      __$$ActionLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ActionLoadingImplCopyWithImpl<$Res>
    extends _$TransferStateCopyWithImpl<$Res, _$ActionLoadingImpl>
    implements _$$ActionLoadingImplCopyWith<$Res> {
  __$$ActionLoadingImplCopyWithImpl(
      _$ActionLoadingImpl _value, $Res Function(_$ActionLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ActionLoadingImpl implements _ActionLoading {
  const _$ActionLoadingImpl();

  @override
  String toString() {
    return 'TransferState.actionLoading()';
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
    required TResult Function() actionLoading,
    required TResult Function(StockTransferListResponse result) listLoaded,
    required TResult Function(StockTransferSingleResponse result) detailLoaded,
    required TResult Function(String message, StockTransferSingleResponse? data)
        actionSuccess,
    required TResult Function(String message) error,
  }) {
    return actionLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? actionLoading,
    TResult? Function(StockTransferListResponse result)? listLoaded,
    TResult? Function(StockTransferSingleResponse result)? detailLoaded,
    TResult? Function(String message, StockTransferSingleResponse? data)?
        actionSuccess,
    TResult? Function(String message)? error,
  }) {
    return actionLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? actionLoading,
    TResult Function(StockTransferListResponse result)? listLoaded,
    TResult Function(StockTransferSingleResponse result)? detailLoaded,
    TResult Function(String message, StockTransferSingleResponse? data)?
        actionSuccess,
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
    required TResult Function(_ActionLoading value) actionLoading,
    required TResult Function(_ListLoaded value) listLoaded,
    required TResult Function(_DetailLoaded value) detailLoaded,
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
    TResult? Function(_ActionLoading value)? actionLoading,
    TResult? Function(_ListLoaded value)? listLoaded,
    TResult? Function(_DetailLoaded value)? detailLoaded,
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
    TResult Function(_ActionLoading value)? actionLoading,
    TResult Function(_ListLoaded value)? listLoaded,
    TResult Function(_DetailLoaded value)? detailLoaded,
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

abstract class _ActionLoading implements TransferState {
  const factory _ActionLoading() = _$ActionLoadingImpl;
}

/// @nodoc
abstract class _$$ListLoadedImplCopyWith<$Res> {
  factory _$$ListLoadedImplCopyWith(
          _$ListLoadedImpl value, $Res Function(_$ListLoadedImpl) then) =
      __$$ListLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StockTransferListResponse result});
}

/// @nodoc
class __$$ListLoadedImplCopyWithImpl<$Res>
    extends _$TransferStateCopyWithImpl<$Res, _$ListLoadedImpl>
    implements _$$ListLoadedImplCopyWith<$Res> {
  __$$ListLoadedImplCopyWithImpl(
      _$ListLoadedImpl _value, $Res Function(_$ListLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferState
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
              as StockTransferListResponse,
    ));
  }
}

/// @nodoc

class _$ListLoadedImpl implements _ListLoaded {
  const _$ListLoadedImpl(this.result);

  @override
  final StockTransferListResponse result;

  @override
  String toString() {
    return 'TransferState.listLoaded(result: $result)';
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

  /// Create a copy of TransferState
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
    required TResult Function() actionLoading,
    required TResult Function(StockTransferListResponse result) listLoaded,
    required TResult Function(StockTransferSingleResponse result) detailLoaded,
    required TResult Function(String message, StockTransferSingleResponse? data)
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
    TResult? Function()? actionLoading,
    TResult? Function(StockTransferListResponse result)? listLoaded,
    TResult? Function(StockTransferSingleResponse result)? detailLoaded,
    TResult? Function(String message, StockTransferSingleResponse? data)?
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
    TResult Function()? actionLoading,
    TResult Function(StockTransferListResponse result)? listLoaded,
    TResult Function(StockTransferSingleResponse result)? detailLoaded,
    TResult Function(String message, StockTransferSingleResponse? data)?
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
    required TResult Function(_ActionLoading value) actionLoading,
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
    TResult? Function(_ActionLoading value)? actionLoading,
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
    TResult Function(_ActionLoading value)? actionLoading,
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

abstract class _ListLoaded implements TransferState {
  const factory _ListLoaded(final StockTransferListResponse result) =
      _$ListLoadedImpl;

  StockTransferListResponse get result;

  /// Create a copy of TransferState
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
  $Res call({StockTransferSingleResponse result});
}

/// @nodoc
class __$$DetailLoadedImplCopyWithImpl<$Res>
    extends _$TransferStateCopyWithImpl<$Res, _$DetailLoadedImpl>
    implements _$$DetailLoadedImplCopyWith<$Res> {
  __$$DetailLoadedImplCopyWithImpl(
      _$DetailLoadedImpl _value, $Res Function(_$DetailLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferState
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
              as StockTransferSingleResponse,
    ));
  }
}

/// @nodoc

class _$DetailLoadedImpl implements _DetailLoaded {
  const _$DetailLoadedImpl(this.result);

  @override
  final StockTransferSingleResponse result;

  @override
  String toString() {
    return 'TransferState.detailLoaded(result: $result)';
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

  /// Create a copy of TransferState
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
    required TResult Function() actionLoading,
    required TResult Function(StockTransferListResponse result) listLoaded,
    required TResult Function(StockTransferSingleResponse result) detailLoaded,
    required TResult Function(String message, StockTransferSingleResponse? data)
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
    TResult? Function()? actionLoading,
    TResult? Function(StockTransferListResponse result)? listLoaded,
    TResult? Function(StockTransferSingleResponse result)? detailLoaded,
    TResult? Function(String message, StockTransferSingleResponse? data)?
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
    TResult Function()? actionLoading,
    TResult Function(StockTransferListResponse result)? listLoaded,
    TResult Function(StockTransferSingleResponse result)? detailLoaded,
    TResult Function(String message, StockTransferSingleResponse? data)?
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
    required TResult Function(_ActionLoading value) actionLoading,
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
    TResult? Function(_ActionLoading value)? actionLoading,
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
    TResult Function(_ActionLoading value)? actionLoading,
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

abstract class _DetailLoaded implements TransferState {
  const factory _DetailLoaded(final StockTransferSingleResponse result) =
      _$DetailLoadedImpl;

  StockTransferSingleResponse get result;

  /// Create a copy of TransferState
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
  $Res call({String message, StockTransferSingleResponse? data});
}

/// @nodoc
class __$$ActionSuccessImplCopyWithImpl<$Res>
    extends _$TransferStateCopyWithImpl<$Res, _$ActionSuccessImpl>
    implements _$$ActionSuccessImplCopyWith<$Res> {
  __$$ActionSuccessImplCopyWithImpl(
      _$ActionSuccessImpl _value, $Res Function(_$ActionSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferState
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
              as StockTransferSingleResponse?,
    ));
  }
}

/// @nodoc

class _$ActionSuccessImpl implements _ActionSuccess {
  const _$ActionSuccessImpl(this.message, this.data);

  @override
  final String message;
  @override
  final StockTransferSingleResponse? data;

  @override
  String toString() {
    return 'TransferState.actionSuccess(message: $message, data: $data)';
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

  /// Create a copy of TransferState
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
    required TResult Function() actionLoading,
    required TResult Function(StockTransferListResponse result) listLoaded,
    required TResult Function(StockTransferSingleResponse result) detailLoaded,
    required TResult Function(String message, StockTransferSingleResponse? data)
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
    TResult? Function()? actionLoading,
    TResult? Function(StockTransferListResponse result)? listLoaded,
    TResult? Function(StockTransferSingleResponse result)? detailLoaded,
    TResult? Function(String message, StockTransferSingleResponse? data)?
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
    TResult Function()? actionLoading,
    TResult Function(StockTransferListResponse result)? listLoaded,
    TResult Function(StockTransferSingleResponse result)? detailLoaded,
    TResult Function(String message, StockTransferSingleResponse? data)?
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
    required TResult Function(_ActionLoading value) actionLoading,
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
    TResult? Function(_ActionLoading value)? actionLoading,
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
    TResult Function(_ActionLoading value)? actionLoading,
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

abstract class _ActionSuccess implements TransferState {
  const factory _ActionSuccess(
          final String message, final StockTransferSingleResponse? data) =
      _$ActionSuccessImpl;

  String get message;
  StockTransferSingleResponse? get data;

  /// Create a copy of TransferState
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
    extends _$TransferStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferState
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
    return 'TransferState.error(message: $message)';
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

  /// Create a copy of TransferState
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
    required TResult Function() actionLoading,
    required TResult Function(StockTransferListResponse result) listLoaded,
    required TResult Function(StockTransferSingleResponse result) detailLoaded,
    required TResult Function(String message, StockTransferSingleResponse? data)
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
    TResult? Function()? actionLoading,
    TResult? Function(StockTransferListResponse result)? listLoaded,
    TResult? Function(StockTransferSingleResponse result)? detailLoaded,
    TResult? Function(String message, StockTransferSingleResponse? data)?
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
    TResult Function()? actionLoading,
    TResult Function(StockTransferListResponse result)? listLoaded,
    TResult Function(StockTransferSingleResponse result)? detailLoaded,
    TResult Function(String message, StockTransferSingleResponse? data)?
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
    required TResult Function(_ActionLoading value) actionLoading,
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
    TResult? Function(_ActionLoading value)? actionLoading,
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
    TResult Function(_ActionLoading value)? actionLoading,
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

abstract class _Error implements TransferState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of TransferState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
