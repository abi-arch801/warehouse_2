// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'po_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int page, String? status, int? supplierId, int? warehouseId)
        load,
    required TResult Function(String? status) filter,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) approve,
    required TResult Function(int id, List<Map<String, dynamic>> items) receive,
    required TResult Function(int id) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int page, String? status, int? supplierId, int? warehouseId)?
        load,
    TResult? Function(String? status)? filter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? approve,
    TResult? Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult? Function(int id)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int page, String? status, int? supplierId, int? warehouseId)?
        load,
    TResult Function(String? status)? filter,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? approve,
    TResult Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult Function(int id)? delete,
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
    required TResult Function(_Receive value) receive,
    required TResult Function(_Delete value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Filter value)? filter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_Store value)? store,
    TResult? Function(_Approve value)? approve,
    TResult? Function(_Receive value)? receive,
    TResult? Function(_Delete value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Filter value)? filter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_Store value)? store,
    TResult Function(_Approve value)? approve,
    TResult Function(_Receive value)? receive,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoEventCopyWith<$Res> {
  factory $PoEventCopyWith(PoEvent value, $Res Function(PoEvent) then) =
      _$PoEventCopyWithImpl<$Res, PoEvent>;
}

/// @nodoc
class _$PoEventCopyWithImpl<$Res, $Val extends PoEvent>
    implements $PoEventCopyWith<$Res> {
  _$PoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PoEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadImplCopyWith<$Res> {
  factory _$$LoadImplCopyWith(
          _$LoadImpl value, $Res Function(_$LoadImpl) then) =
      __$$LoadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, String? status, int? supplierId, int? warehouseId});
}

/// @nodoc
class __$$LoadImplCopyWithImpl<$Res>
    extends _$PoEventCopyWithImpl<$Res, _$LoadImpl>
    implements _$$LoadImplCopyWith<$Res> {
  __$$LoadImplCopyWithImpl(_$LoadImpl _value, $Res Function(_$LoadImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? status = freezed,
    Object? supplierId = freezed,
    Object? warehouseId = freezed,
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
      supplierId: freezed == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as int?,
      warehouseId: freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$LoadImpl implements _Load {
  const _$LoadImpl(
      {this.page = 1, this.status, this.supplierId, this.warehouseId});

  @override
  @JsonKey()
  final int page;
  @override
  final String? status;
  @override
  final int? supplierId;
  @override
  final int? warehouseId;

  @override
  String toString() {
    return 'PoEvent.load(page: $page, status: $status, supplierId: $supplierId, warehouseId: $warehouseId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.supplierId, supplierId) ||
                other.supplierId == supplierId) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, page, status, supplierId, warehouseId);

  /// Create a copy of PoEvent
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
            int page, String? status, int? supplierId, int? warehouseId)
        load,
    required TResult Function(String? status) filter,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) approve,
    required TResult Function(int id, List<Map<String, dynamic>> items) receive,
    required TResult Function(int id) delete,
  }) {
    return load(page, status, supplierId, warehouseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int page, String? status, int? supplierId, int? warehouseId)?
        load,
    TResult? Function(String? status)? filter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? approve,
    TResult? Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult? Function(int id)? delete,
  }) {
    return load?.call(page, status, supplierId, warehouseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int page, String? status, int? supplierId, int? warehouseId)?
        load,
    TResult Function(String? status)? filter,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? approve,
    TResult Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult Function(int id)? delete,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(page, status, supplierId, warehouseId);
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
    required TResult Function(_Receive value) receive,
    required TResult Function(_Delete value) delete,
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
    TResult? Function(_Receive value)? receive,
    TResult? Function(_Delete value)? delete,
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
    TResult Function(_Receive value)? receive,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements PoEvent {
  const factory _Load(
      {final int page,
      final String? status,
      final int? supplierId,
      final int? warehouseId}) = _$LoadImpl;

  int get page;
  String? get status;
  int? get supplierId;
  int? get warehouseId;

  /// Create a copy of PoEvent
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
    extends _$PoEventCopyWithImpl<$Res, _$FilterImpl>
    implements _$$FilterImplCopyWith<$Res> {
  __$$FilterImplCopyWithImpl(
      _$FilterImpl _value, $Res Function(_$FilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoEvent
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
    return 'PoEvent.filter(status: $status)';
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

  /// Create a copy of PoEvent
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
            int page, String? status, int? supplierId, int? warehouseId)
        load,
    required TResult Function(String? status) filter,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) approve,
    required TResult Function(int id, List<Map<String, dynamic>> items) receive,
    required TResult Function(int id) delete,
  }) {
    return filter(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int page, String? status, int? supplierId, int? warehouseId)?
        load,
    TResult? Function(String? status)? filter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? approve,
    TResult? Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult? Function(int id)? delete,
  }) {
    return filter?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int page, String? status, int? supplierId, int? warehouseId)?
        load,
    TResult Function(String? status)? filter,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? approve,
    TResult Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult Function(int id)? delete,
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
    required TResult Function(_Receive value) receive,
    required TResult Function(_Delete value) delete,
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
    TResult? Function(_Receive value)? receive,
    TResult? Function(_Delete value)? delete,
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
    TResult Function(_Receive value)? receive,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (filter != null) {
      return filter(this);
    }
    return orElse();
  }
}

abstract class _Filter implements PoEvent {
  const factory _Filter(final String? status) = _$FilterImpl;

  String? get status;

  /// Create a copy of PoEvent
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
    extends _$PoEventCopyWithImpl<$Res, _$LoadDetailImpl>
    implements _$$LoadDetailImplCopyWith<$Res> {
  __$$LoadDetailImplCopyWithImpl(
      _$LoadDetailImpl _value, $Res Function(_$LoadDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoEvent
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
    return 'PoEvent.loadDetail(id: $id)';
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

  /// Create a copy of PoEvent
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
            int page, String? status, int? supplierId, int? warehouseId)
        load,
    required TResult Function(String? status) filter,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) approve,
    required TResult Function(int id, List<Map<String, dynamic>> items) receive,
    required TResult Function(int id) delete,
  }) {
    return loadDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int page, String? status, int? supplierId, int? warehouseId)?
        load,
    TResult? Function(String? status)? filter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? approve,
    TResult? Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult? Function(int id)? delete,
  }) {
    return loadDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int page, String? status, int? supplierId, int? warehouseId)?
        load,
    TResult Function(String? status)? filter,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? approve,
    TResult Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult Function(int id)? delete,
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
    required TResult Function(_Receive value) receive,
    required TResult Function(_Delete value) delete,
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
    TResult? Function(_Receive value)? receive,
    TResult? Function(_Delete value)? delete,
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
    TResult Function(_Receive value)? receive,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (loadDetail != null) {
      return loadDetail(this);
    }
    return orElse();
  }
}

abstract class _LoadDetail implements PoEvent {
  const factory _LoadDetail(final int id) = _$LoadDetailImpl;

  int get id;

  /// Create a copy of PoEvent
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
    extends _$PoEventCopyWithImpl<$Res, _$StoreImpl>
    implements _$$StoreImplCopyWith<$Res> {
  __$$StoreImplCopyWithImpl(
      _$StoreImpl _value, $Res Function(_$StoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoEvent
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
    return 'PoEvent.store(body: $body)';
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

  /// Create a copy of PoEvent
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
            int page, String? status, int? supplierId, int? warehouseId)
        load,
    required TResult Function(String? status) filter,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) approve,
    required TResult Function(int id, List<Map<String, dynamic>> items) receive,
    required TResult Function(int id) delete,
  }) {
    return store(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int page, String? status, int? supplierId, int? warehouseId)?
        load,
    TResult? Function(String? status)? filter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? approve,
    TResult? Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult? Function(int id)? delete,
  }) {
    return store?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int page, String? status, int? supplierId, int? warehouseId)?
        load,
    TResult Function(String? status)? filter,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? approve,
    TResult Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult Function(int id)? delete,
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
    required TResult Function(_Receive value) receive,
    required TResult Function(_Delete value) delete,
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
    TResult? Function(_Receive value)? receive,
    TResult? Function(_Delete value)? delete,
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
    TResult Function(_Receive value)? receive,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (store != null) {
      return store(this);
    }
    return orElse();
  }
}

abstract class _Store implements PoEvent {
  const factory _Store(final Map<String, dynamic> body) = _$StoreImpl;

  Map<String, dynamic> get body;

  /// Create a copy of PoEvent
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
    extends _$PoEventCopyWithImpl<$Res, _$ApproveImpl>
    implements _$$ApproveImplCopyWith<$Res> {
  __$$ApproveImplCopyWithImpl(
      _$ApproveImpl _value, $Res Function(_$ApproveImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoEvent
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
    return 'PoEvent.approve(id: $id)';
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

  /// Create a copy of PoEvent
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
            int page, String? status, int? supplierId, int? warehouseId)
        load,
    required TResult Function(String? status) filter,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) approve,
    required TResult Function(int id, List<Map<String, dynamic>> items) receive,
    required TResult Function(int id) delete,
  }) {
    return approve(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int page, String? status, int? supplierId, int? warehouseId)?
        load,
    TResult? Function(String? status)? filter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? approve,
    TResult? Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult? Function(int id)? delete,
  }) {
    return approve?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int page, String? status, int? supplierId, int? warehouseId)?
        load,
    TResult Function(String? status)? filter,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? approve,
    TResult Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult Function(int id)? delete,
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
    required TResult Function(_Receive value) receive,
    required TResult Function(_Delete value) delete,
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
    TResult? Function(_Receive value)? receive,
    TResult? Function(_Delete value)? delete,
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
    TResult Function(_Receive value)? receive,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (approve != null) {
      return approve(this);
    }
    return orElse();
  }
}

abstract class _Approve implements PoEvent {
  const factory _Approve(final int id) = _$ApproveImpl;

  int get id;

  /// Create a copy of PoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApproveImplCopyWith<_$ApproveImpl> get copyWith =>
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
    extends _$PoEventCopyWithImpl<$Res, _$ReceiveImpl>
    implements _$$ReceiveImplCopyWith<$Res> {
  __$$ReceiveImplCopyWithImpl(
      _$ReceiveImpl _value, $Res Function(_$ReceiveImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoEvent
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
    return 'PoEvent.receive(id: $id, items: $items)';
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

  /// Create a copy of PoEvent
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
            int page, String? status, int? supplierId, int? warehouseId)
        load,
    required TResult Function(String? status) filter,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) approve,
    required TResult Function(int id, List<Map<String, dynamic>> items) receive,
    required TResult Function(int id) delete,
  }) {
    return receive(id, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int page, String? status, int? supplierId, int? warehouseId)?
        load,
    TResult? Function(String? status)? filter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? approve,
    TResult? Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult? Function(int id)? delete,
  }) {
    return receive?.call(id, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int page, String? status, int? supplierId, int? warehouseId)?
        load,
    TResult Function(String? status)? filter,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? approve,
    TResult Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult Function(int id)? delete,
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
    required TResult Function(_Receive value) receive,
    required TResult Function(_Delete value) delete,
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
    TResult? Function(_Receive value)? receive,
    TResult? Function(_Delete value)? delete,
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
    TResult Function(_Receive value)? receive,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (receive != null) {
      return receive(this);
    }
    return orElse();
  }
}

abstract class _Receive implements PoEvent {
  const factory _Receive(
      {required final int id,
      required final List<Map<String, dynamic>> items}) = _$ReceiveImpl;

  int get id;
  List<Map<String, dynamic>> get items;

  /// Create a copy of PoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiveImplCopyWith<_$ReceiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$PoEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'PoEvent.delete(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of PoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int page, String? status, int? supplierId, int? warehouseId)
        load,
    required TResult Function(String? status) filter,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) approve,
    required TResult Function(int id, List<Map<String, dynamic>> items) receive,
    required TResult Function(int id) delete,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int page, String? status, int? supplierId, int? warehouseId)?
        load,
    TResult? Function(String? status)? filter,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? approve,
    TResult? Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult? Function(int id)? delete,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int page, String? status, int? supplierId, int? warehouseId)?
        load,
    TResult Function(String? status)? filter,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? approve,
    TResult Function(int id, List<Map<String, dynamic>> items)? receive,
    TResult Function(int id)? delete,
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
    required TResult Function(_Load value) load,
    required TResult Function(_Filter value) filter,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_Store value) store,
    required TResult Function(_Approve value) approve,
    required TResult Function(_Receive value) receive,
    required TResult Function(_Delete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Filter value)? filter,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_Store value)? store,
    TResult? Function(_Approve value)? approve,
    TResult? Function(_Receive value)? receive,
    TResult? Function(_Delete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Filter value)? filter,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_Store value)? store,
    TResult Function(_Approve value)? approve,
    TResult Function(_Receive value)? receive,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements PoEvent {
  const factory _Delete(final int id) = _$DeleteImpl;

  int get id;

  /// Create a copy of PoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() actionLoading,
    required TResult Function(PurchaseOrderListResponse result) listLoaded,
    required TResult Function(PurchaseOrderSingleResponse result) detailLoaded,
    required TResult Function(String message, PurchaseOrderSingleResponse? data)
        actionSuccess,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? actionLoading,
    TResult? Function(PurchaseOrderListResponse result)? listLoaded,
    TResult? Function(PurchaseOrderSingleResponse result)? detailLoaded,
    TResult? Function(String message, PurchaseOrderSingleResponse? data)?
        actionSuccess,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? actionLoading,
    TResult Function(PurchaseOrderListResponse result)? listLoaded,
    TResult Function(PurchaseOrderSingleResponse result)? detailLoaded,
    TResult Function(String message, PurchaseOrderSingleResponse? data)?
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
abstract class $PoStateCopyWith<$Res> {
  factory $PoStateCopyWith(PoState value, $Res Function(PoState) then) =
      _$PoStateCopyWithImpl<$Res, PoState>;
}

/// @nodoc
class _$PoStateCopyWithImpl<$Res, $Val extends PoState>
    implements $PoStateCopyWith<$Res> {
  _$PoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PoState
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
    extends _$PoStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PoState.initial()';
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
    required TResult Function(PurchaseOrderListResponse result) listLoaded,
    required TResult Function(PurchaseOrderSingleResponse result) detailLoaded,
    required TResult Function(String message, PurchaseOrderSingleResponse? data)
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
    TResult? Function(PurchaseOrderListResponse result)? listLoaded,
    TResult? Function(PurchaseOrderSingleResponse result)? detailLoaded,
    TResult? Function(String message, PurchaseOrderSingleResponse? data)?
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
    TResult Function(PurchaseOrderListResponse result)? listLoaded,
    TResult Function(PurchaseOrderSingleResponse result)? detailLoaded,
    TResult Function(String message, PurchaseOrderSingleResponse? data)?
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

abstract class _Initial implements PoState {
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
    extends _$PoStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'PoState.loading()';
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
    required TResult Function(PurchaseOrderListResponse result) listLoaded,
    required TResult Function(PurchaseOrderSingleResponse result) detailLoaded,
    required TResult Function(String message, PurchaseOrderSingleResponse? data)
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
    TResult? Function(PurchaseOrderListResponse result)? listLoaded,
    TResult? Function(PurchaseOrderSingleResponse result)? detailLoaded,
    TResult? Function(String message, PurchaseOrderSingleResponse? data)?
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
    TResult Function(PurchaseOrderListResponse result)? listLoaded,
    TResult Function(PurchaseOrderSingleResponse result)? detailLoaded,
    TResult Function(String message, PurchaseOrderSingleResponse? data)?
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

abstract class _Loading implements PoState {
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
    extends _$PoStateCopyWithImpl<$Res, _$ActionLoadingImpl>
    implements _$$ActionLoadingImplCopyWith<$Res> {
  __$$ActionLoadingImplCopyWithImpl(
      _$ActionLoadingImpl _value, $Res Function(_$ActionLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ActionLoadingImpl implements _ActionLoading {
  const _$ActionLoadingImpl();

  @override
  String toString() {
    return 'PoState.actionLoading()';
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
    required TResult Function(PurchaseOrderListResponse result) listLoaded,
    required TResult Function(PurchaseOrderSingleResponse result) detailLoaded,
    required TResult Function(String message, PurchaseOrderSingleResponse? data)
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
    TResult? Function(PurchaseOrderListResponse result)? listLoaded,
    TResult? Function(PurchaseOrderSingleResponse result)? detailLoaded,
    TResult? Function(String message, PurchaseOrderSingleResponse? data)?
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
    TResult Function(PurchaseOrderListResponse result)? listLoaded,
    TResult Function(PurchaseOrderSingleResponse result)? detailLoaded,
    TResult Function(String message, PurchaseOrderSingleResponse? data)?
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

abstract class _ActionLoading implements PoState {
  const factory _ActionLoading() = _$ActionLoadingImpl;
}

/// @nodoc
abstract class _$$ListLoadedImplCopyWith<$Res> {
  factory _$$ListLoadedImplCopyWith(
          _$ListLoadedImpl value, $Res Function(_$ListLoadedImpl) then) =
      __$$ListLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PurchaseOrderListResponse result});
}

/// @nodoc
class __$$ListLoadedImplCopyWithImpl<$Res>
    extends _$PoStateCopyWithImpl<$Res, _$ListLoadedImpl>
    implements _$$ListLoadedImplCopyWith<$Res> {
  __$$ListLoadedImplCopyWithImpl(
      _$ListLoadedImpl _value, $Res Function(_$ListLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoState
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
              as PurchaseOrderListResponse,
    ));
  }
}

/// @nodoc

class _$ListLoadedImpl implements _ListLoaded {
  const _$ListLoadedImpl(this.result);

  @override
  final PurchaseOrderListResponse result;

  @override
  String toString() {
    return 'PoState.listLoaded(result: $result)';
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

  /// Create a copy of PoState
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
    required TResult Function(PurchaseOrderListResponse result) listLoaded,
    required TResult Function(PurchaseOrderSingleResponse result) detailLoaded,
    required TResult Function(String message, PurchaseOrderSingleResponse? data)
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
    TResult? Function(PurchaseOrderListResponse result)? listLoaded,
    TResult? Function(PurchaseOrderSingleResponse result)? detailLoaded,
    TResult? Function(String message, PurchaseOrderSingleResponse? data)?
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
    TResult Function(PurchaseOrderListResponse result)? listLoaded,
    TResult Function(PurchaseOrderSingleResponse result)? detailLoaded,
    TResult Function(String message, PurchaseOrderSingleResponse? data)?
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

abstract class _ListLoaded implements PoState {
  const factory _ListLoaded(final PurchaseOrderListResponse result) =
      _$ListLoadedImpl;

  PurchaseOrderListResponse get result;

  /// Create a copy of PoState
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
  $Res call({PurchaseOrderSingleResponse result});
}

/// @nodoc
class __$$DetailLoadedImplCopyWithImpl<$Res>
    extends _$PoStateCopyWithImpl<$Res, _$DetailLoadedImpl>
    implements _$$DetailLoadedImplCopyWith<$Res> {
  __$$DetailLoadedImplCopyWithImpl(
      _$DetailLoadedImpl _value, $Res Function(_$DetailLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoState
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
              as PurchaseOrderSingleResponse,
    ));
  }
}

/// @nodoc

class _$DetailLoadedImpl implements _DetailLoaded {
  const _$DetailLoadedImpl(this.result);

  @override
  final PurchaseOrderSingleResponse result;

  @override
  String toString() {
    return 'PoState.detailLoaded(result: $result)';
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

  /// Create a copy of PoState
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
    required TResult Function(PurchaseOrderListResponse result) listLoaded,
    required TResult Function(PurchaseOrderSingleResponse result) detailLoaded,
    required TResult Function(String message, PurchaseOrderSingleResponse? data)
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
    TResult? Function(PurchaseOrderListResponse result)? listLoaded,
    TResult? Function(PurchaseOrderSingleResponse result)? detailLoaded,
    TResult? Function(String message, PurchaseOrderSingleResponse? data)?
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
    TResult Function(PurchaseOrderListResponse result)? listLoaded,
    TResult Function(PurchaseOrderSingleResponse result)? detailLoaded,
    TResult Function(String message, PurchaseOrderSingleResponse? data)?
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

abstract class _DetailLoaded implements PoState {
  const factory _DetailLoaded(final PurchaseOrderSingleResponse result) =
      _$DetailLoadedImpl;

  PurchaseOrderSingleResponse get result;

  /// Create a copy of PoState
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
  $Res call({String message, PurchaseOrderSingleResponse? data});
}

/// @nodoc
class __$$ActionSuccessImplCopyWithImpl<$Res>
    extends _$PoStateCopyWithImpl<$Res, _$ActionSuccessImpl>
    implements _$$ActionSuccessImplCopyWith<$Res> {
  __$$ActionSuccessImplCopyWithImpl(
      _$ActionSuccessImpl _value, $Res Function(_$ActionSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoState
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
              as PurchaseOrderSingleResponse?,
    ));
  }
}

/// @nodoc

class _$ActionSuccessImpl implements _ActionSuccess {
  const _$ActionSuccessImpl(this.message, this.data);

  @override
  final String message;
  @override
  final PurchaseOrderSingleResponse? data;

  @override
  String toString() {
    return 'PoState.actionSuccess(message: $message, data: $data)';
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

  /// Create a copy of PoState
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
    required TResult Function(PurchaseOrderListResponse result) listLoaded,
    required TResult Function(PurchaseOrderSingleResponse result) detailLoaded,
    required TResult Function(String message, PurchaseOrderSingleResponse? data)
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
    TResult? Function(PurchaseOrderListResponse result)? listLoaded,
    TResult? Function(PurchaseOrderSingleResponse result)? detailLoaded,
    TResult? Function(String message, PurchaseOrderSingleResponse? data)?
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
    TResult Function(PurchaseOrderListResponse result)? listLoaded,
    TResult Function(PurchaseOrderSingleResponse result)? detailLoaded,
    TResult Function(String message, PurchaseOrderSingleResponse? data)?
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

abstract class _ActionSuccess implements PoState {
  const factory _ActionSuccess(
          final String message, final PurchaseOrderSingleResponse? data) =
      _$ActionSuccessImpl;

  String get message;
  PurchaseOrderSingleResponse? get data;

  /// Create a copy of PoState
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
    extends _$PoStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoState
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
    return 'PoState.error(message: $message)';
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

  /// Create a copy of PoState
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
    required TResult Function(PurchaseOrderListResponse result) listLoaded,
    required TResult Function(PurchaseOrderSingleResponse result) detailLoaded,
    required TResult Function(String message, PurchaseOrderSingleResponse? data)
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
    TResult? Function(PurchaseOrderListResponse result)? listLoaded,
    TResult? Function(PurchaseOrderSingleResponse result)? detailLoaded,
    TResult? Function(String message, PurchaseOrderSingleResponse? data)?
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
    TResult Function(PurchaseOrderListResponse result)? listLoaded,
    TResult Function(PurchaseOrderSingleResponse result)? detailLoaded,
    TResult Function(String message, PurchaseOrderSingleResponse? data)?
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

abstract class _Error implements PoState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of PoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
