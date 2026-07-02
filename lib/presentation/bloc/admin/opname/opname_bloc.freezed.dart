// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opname_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OpnameEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status, int? warehouseId) load,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) start,
    required TResult Function(int id, List<Map<String, dynamic>> items)
        saveProgress,
    required TResult Function(int id, List<Map<String, dynamic>> items)
        complete,
    required TResult Function(int id) approve,
    required TResult Function(int id, String reason) reject,
    required TResult Function(int warehouseId, String? search, int? categoryId)
        loadProductsForOpname,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status, int? warehouseId)? load,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? start,
    TResult? Function(int id, List<Map<String, dynamic>> items)? saveProgress,
    TResult? Function(int id, List<Map<String, dynamic>> items)? complete,
    TResult? Function(int id)? approve,
    TResult? Function(int id, String reason)? reject,
    TResult? Function(int warehouseId, String? search, int? categoryId)?
        loadProductsForOpname,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status, int? warehouseId)? load,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? start,
    TResult Function(int id, List<Map<String, dynamic>> items)? saveProgress,
    TResult Function(int id, List<Map<String, dynamic>> items)? complete,
    TResult Function(int id)? approve,
    TResult Function(int id, String reason)? reject,
    TResult Function(int warehouseId, String? search, int? categoryId)?
        loadProductsForOpname,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_Store value) store,
    required TResult Function(_Start value) start,
    required TResult Function(_SaveProgress value) saveProgress,
    required TResult Function(_Complete value) complete,
    required TResult Function(_Approve value) approve,
    required TResult Function(_Reject value) reject,
    required TResult Function(_LoadProductsForOpname value)
        loadProductsForOpname,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_Store value)? store,
    TResult? Function(_Start value)? start,
    TResult? Function(_SaveProgress value)? saveProgress,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_Approve value)? approve,
    TResult? Function(_Reject value)? reject,
    TResult? Function(_LoadProductsForOpname value)? loadProductsForOpname,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_Store value)? store,
    TResult Function(_Start value)? start,
    TResult Function(_SaveProgress value)? saveProgress,
    TResult Function(_Complete value)? complete,
    TResult Function(_Approve value)? approve,
    TResult Function(_Reject value)? reject,
    TResult Function(_LoadProductsForOpname value)? loadProductsForOpname,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpnameEventCopyWith<$Res> {
  factory $OpnameEventCopyWith(
          OpnameEvent value, $Res Function(OpnameEvent) then) =
      _$OpnameEventCopyWithImpl<$Res, OpnameEvent>;
}

/// @nodoc
class _$OpnameEventCopyWithImpl<$Res, $Val extends OpnameEvent>
    implements $OpnameEventCopyWith<$Res> {
  _$OpnameEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpnameEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadImplCopyWith<$Res> {
  factory _$$LoadImplCopyWith(
          _$LoadImpl value, $Res Function(_$LoadImpl) then) =
      __$$LoadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, String? status, int? warehouseId});
}

/// @nodoc
class __$$LoadImplCopyWithImpl<$Res>
    extends _$OpnameEventCopyWithImpl<$Res, _$LoadImpl>
    implements _$$LoadImplCopyWith<$Res> {
  __$$LoadImplCopyWithImpl(_$LoadImpl _value, $Res Function(_$LoadImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpnameEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? status = freezed,
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
      warehouseId: freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$LoadImpl implements _Load {
  const _$LoadImpl({this.page = 1, this.status, this.warehouseId});

  @override
  @JsonKey()
  final int page;
  @override
  final String? status;
  @override
  final int? warehouseId;

  @override
  String toString() {
    return 'OpnameEvent.load(page: $page, status: $status, warehouseId: $warehouseId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, status, warehouseId);

  /// Create a copy of OpnameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      __$$LoadImplCopyWithImpl<_$LoadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status, int? warehouseId) load,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) start,
    required TResult Function(int id, List<Map<String, dynamic>> items)
        saveProgress,
    required TResult Function(int id, List<Map<String, dynamic>> items)
        complete,
    required TResult Function(int id) approve,
    required TResult Function(int id, String reason) reject,
    required TResult Function(int warehouseId, String? search, int? categoryId)
        loadProductsForOpname,
  }) {
    return load(page, status, warehouseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status, int? warehouseId)? load,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? start,
    TResult? Function(int id, List<Map<String, dynamic>> items)? saveProgress,
    TResult? Function(int id, List<Map<String, dynamic>> items)? complete,
    TResult? Function(int id)? approve,
    TResult? Function(int id, String reason)? reject,
    TResult? Function(int warehouseId, String? search, int? categoryId)?
        loadProductsForOpname,
  }) {
    return load?.call(page, status, warehouseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status, int? warehouseId)? load,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? start,
    TResult Function(int id, List<Map<String, dynamic>> items)? saveProgress,
    TResult Function(int id, List<Map<String, dynamic>> items)? complete,
    TResult Function(int id)? approve,
    TResult Function(int id, String reason)? reject,
    TResult Function(int warehouseId, String? search, int? categoryId)?
        loadProductsForOpname,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(page, status, warehouseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_Store value) store,
    required TResult Function(_Start value) start,
    required TResult Function(_SaveProgress value) saveProgress,
    required TResult Function(_Complete value) complete,
    required TResult Function(_Approve value) approve,
    required TResult Function(_Reject value) reject,
    required TResult Function(_LoadProductsForOpname value)
        loadProductsForOpname,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_Store value)? store,
    TResult? Function(_Start value)? start,
    TResult? Function(_SaveProgress value)? saveProgress,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_Approve value)? approve,
    TResult? Function(_Reject value)? reject,
    TResult? Function(_LoadProductsForOpname value)? loadProductsForOpname,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_Store value)? store,
    TResult Function(_Start value)? start,
    TResult Function(_SaveProgress value)? saveProgress,
    TResult Function(_Complete value)? complete,
    TResult Function(_Approve value)? approve,
    TResult Function(_Reject value)? reject,
    TResult Function(_LoadProductsForOpname value)? loadProductsForOpname,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements OpnameEvent {
  const factory _Load(
      {final int page,
      final String? status,
      final int? warehouseId}) = _$LoadImpl;

  int get page;
  String? get status;
  int? get warehouseId;

  /// Create a copy of OpnameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
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
    extends _$OpnameEventCopyWithImpl<$Res, _$LoadDetailImpl>
    implements _$$LoadDetailImplCopyWith<$Res> {
  __$$LoadDetailImplCopyWithImpl(
      _$LoadDetailImpl _value, $Res Function(_$LoadDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpnameEvent
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
    return 'OpnameEvent.loadDetail(id: $id)';
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

  /// Create a copy of OpnameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadDetailImplCopyWith<_$LoadDetailImpl> get copyWith =>
      __$$LoadDetailImplCopyWithImpl<_$LoadDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status, int? warehouseId) load,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) start,
    required TResult Function(int id, List<Map<String, dynamic>> items)
        saveProgress,
    required TResult Function(int id, List<Map<String, dynamic>> items)
        complete,
    required TResult Function(int id) approve,
    required TResult Function(int id, String reason) reject,
    required TResult Function(int warehouseId, String? search, int? categoryId)
        loadProductsForOpname,
  }) {
    return loadDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status, int? warehouseId)? load,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? start,
    TResult? Function(int id, List<Map<String, dynamic>> items)? saveProgress,
    TResult? Function(int id, List<Map<String, dynamic>> items)? complete,
    TResult? Function(int id)? approve,
    TResult? Function(int id, String reason)? reject,
    TResult? Function(int warehouseId, String? search, int? categoryId)?
        loadProductsForOpname,
  }) {
    return loadDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status, int? warehouseId)? load,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? start,
    TResult Function(int id, List<Map<String, dynamic>> items)? saveProgress,
    TResult Function(int id, List<Map<String, dynamic>> items)? complete,
    TResult Function(int id)? approve,
    TResult Function(int id, String reason)? reject,
    TResult Function(int warehouseId, String? search, int? categoryId)?
        loadProductsForOpname,
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
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_Store value) store,
    required TResult Function(_Start value) start,
    required TResult Function(_SaveProgress value) saveProgress,
    required TResult Function(_Complete value) complete,
    required TResult Function(_Approve value) approve,
    required TResult Function(_Reject value) reject,
    required TResult Function(_LoadProductsForOpname value)
        loadProductsForOpname,
  }) {
    return loadDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_Store value)? store,
    TResult? Function(_Start value)? start,
    TResult? Function(_SaveProgress value)? saveProgress,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_Approve value)? approve,
    TResult? Function(_Reject value)? reject,
    TResult? Function(_LoadProductsForOpname value)? loadProductsForOpname,
  }) {
    return loadDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_Store value)? store,
    TResult Function(_Start value)? start,
    TResult Function(_SaveProgress value)? saveProgress,
    TResult Function(_Complete value)? complete,
    TResult Function(_Approve value)? approve,
    TResult Function(_Reject value)? reject,
    TResult Function(_LoadProductsForOpname value)? loadProductsForOpname,
    required TResult orElse(),
  }) {
    if (loadDetail != null) {
      return loadDetail(this);
    }
    return orElse();
  }
}

abstract class _LoadDetail implements OpnameEvent {
  const factory _LoadDetail(final int id) = _$LoadDetailImpl;

  int get id;

  /// Create a copy of OpnameEvent
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
    extends _$OpnameEventCopyWithImpl<$Res, _$StoreImpl>
    implements _$$StoreImplCopyWith<$Res> {
  __$$StoreImplCopyWithImpl(
      _$StoreImpl _value, $Res Function(_$StoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpnameEvent
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
    return 'OpnameEvent.store(body: $body)';
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

  /// Create a copy of OpnameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
      __$$StoreImplCopyWithImpl<_$StoreImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status, int? warehouseId) load,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) start,
    required TResult Function(int id, List<Map<String, dynamic>> items)
        saveProgress,
    required TResult Function(int id, List<Map<String, dynamic>> items)
        complete,
    required TResult Function(int id) approve,
    required TResult Function(int id, String reason) reject,
    required TResult Function(int warehouseId, String? search, int? categoryId)
        loadProductsForOpname,
  }) {
    return store(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status, int? warehouseId)? load,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? start,
    TResult? Function(int id, List<Map<String, dynamic>> items)? saveProgress,
    TResult? Function(int id, List<Map<String, dynamic>> items)? complete,
    TResult? Function(int id)? approve,
    TResult? Function(int id, String reason)? reject,
    TResult? Function(int warehouseId, String? search, int? categoryId)?
        loadProductsForOpname,
  }) {
    return store?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status, int? warehouseId)? load,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? start,
    TResult Function(int id, List<Map<String, dynamic>> items)? saveProgress,
    TResult Function(int id, List<Map<String, dynamic>> items)? complete,
    TResult Function(int id)? approve,
    TResult Function(int id, String reason)? reject,
    TResult Function(int warehouseId, String? search, int? categoryId)?
        loadProductsForOpname,
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
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_Store value) store,
    required TResult Function(_Start value) start,
    required TResult Function(_SaveProgress value) saveProgress,
    required TResult Function(_Complete value) complete,
    required TResult Function(_Approve value) approve,
    required TResult Function(_Reject value) reject,
    required TResult Function(_LoadProductsForOpname value)
        loadProductsForOpname,
  }) {
    return store(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_Store value)? store,
    TResult? Function(_Start value)? start,
    TResult? Function(_SaveProgress value)? saveProgress,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_Approve value)? approve,
    TResult? Function(_Reject value)? reject,
    TResult? Function(_LoadProductsForOpname value)? loadProductsForOpname,
  }) {
    return store?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_Store value)? store,
    TResult Function(_Start value)? start,
    TResult Function(_SaveProgress value)? saveProgress,
    TResult Function(_Complete value)? complete,
    TResult Function(_Approve value)? approve,
    TResult Function(_Reject value)? reject,
    TResult Function(_LoadProductsForOpname value)? loadProductsForOpname,
    required TResult orElse(),
  }) {
    if (store != null) {
      return store(this);
    }
    return orElse();
  }
}

abstract class _Store implements OpnameEvent {
  const factory _Store(final Map<String, dynamic> body) = _$StoreImpl;

  Map<String, dynamic> get body;

  /// Create a copy of OpnameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartImplCopyWith<$Res> {
  factory _$$StartImplCopyWith(
          _$StartImpl value, $Res Function(_$StartImpl) then) =
      __$$StartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$StartImplCopyWithImpl<$Res>
    extends _$OpnameEventCopyWithImpl<$Res, _$StartImpl>
    implements _$$StartImplCopyWith<$Res> {
  __$$StartImplCopyWithImpl(
      _$StartImpl _value, $Res Function(_$StartImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpnameEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$StartImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StartImpl implements _Start {
  const _$StartImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'OpnameEvent.start(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of OpnameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartImplCopyWith<_$StartImpl> get copyWith =>
      __$$StartImplCopyWithImpl<_$StartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status, int? warehouseId) load,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) start,
    required TResult Function(int id, List<Map<String, dynamic>> items)
        saveProgress,
    required TResult Function(int id, List<Map<String, dynamic>> items)
        complete,
    required TResult Function(int id) approve,
    required TResult Function(int id, String reason) reject,
    required TResult Function(int warehouseId, String? search, int? categoryId)
        loadProductsForOpname,
  }) {
    return start(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status, int? warehouseId)? load,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? start,
    TResult? Function(int id, List<Map<String, dynamic>> items)? saveProgress,
    TResult? Function(int id, List<Map<String, dynamic>> items)? complete,
    TResult? Function(int id)? approve,
    TResult? Function(int id, String reason)? reject,
    TResult? Function(int warehouseId, String? search, int? categoryId)?
        loadProductsForOpname,
  }) {
    return start?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status, int? warehouseId)? load,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? start,
    TResult Function(int id, List<Map<String, dynamic>> items)? saveProgress,
    TResult Function(int id, List<Map<String, dynamic>> items)? complete,
    TResult Function(int id)? approve,
    TResult Function(int id, String reason)? reject,
    TResult Function(int warehouseId, String? search, int? categoryId)?
        loadProductsForOpname,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_Store value) store,
    required TResult Function(_Start value) start,
    required TResult Function(_SaveProgress value) saveProgress,
    required TResult Function(_Complete value) complete,
    required TResult Function(_Approve value) approve,
    required TResult Function(_Reject value) reject,
    required TResult Function(_LoadProductsForOpname value)
        loadProductsForOpname,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_Store value)? store,
    TResult? Function(_Start value)? start,
    TResult? Function(_SaveProgress value)? saveProgress,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_Approve value)? approve,
    TResult? Function(_Reject value)? reject,
    TResult? Function(_LoadProductsForOpname value)? loadProductsForOpname,
  }) {
    return start?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_Store value)? store,
    TResult Function(_Start value)? start,
    TResult Function(_SaveProgress value)? saveProgress,
    TResult Function(_Complete value)? complete,
    TResult Function(_Approve value)? approve,
    TResult Function(_Reject value)? reject,
    TResult Function(_LoadProductsForOpname value)? loadProductsForOpname,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class _Start implements OpnameEvent {
  const factory _Start(final int id) = _$StartImpl;

  int get id;

  /// Create a copy of OpnameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartImplCopyWith<_$StartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveProgressImplCopyWith<$Res> {
  factory _$$SaveProgressImplCopyWith(
          _$SaveProgressImpl value, $Res Function(_$SaveProgressImpl) then) =
      __$$SaveProgressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, List<Map<String, dynamic>> items});
}

/// @nodoc
class __$$SaveProgressImplCopyWithImpl<$Res>
    extends _$OpnameEventCopyWithImpl<$Res, _$SaveProgressImpl>
    implements _$$SaveProgressImplCopyWith<$Res> {
  __$$SaveProgressImplCopyWithImpl(
      _$SaveProgressImpl _value, $Res Function(_$SaveProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpnameEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? items = null,
  }) {
    return _then(_$SaveProgressImpl(
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

class _$SaveProgressImpl implements _SaveProgress {
  const _$SaveProgressImpl(
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
    return 'OpnameEvent.saveProgress(id: $id, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveProgressImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, const DeepCollectionEquality().hash(_items));

  /// Create a copy of OpnameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveProgressImplCopyWith<_$SaveProgressImpl> get copyWith =>
      __$$SaveProgressImplCopyWithImpl<_$SaveProgressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status, int? warehouseId) load,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) start,
    required TResult Function(int id, List<Map<String, dynamic>> items)
        saveProgress,
    required TResult Function(int id, List<Map<String, dynamic>> items)
        complete,
    required TResult Function(int id) approve,
    required TResult Function(int id, String reason) reject,
    required TResult Function(int warehouseId, String? search, int? categoryId)
        loadProductsForOpname,
  }) {
    return saveProgress(id, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status, int? warehouseId)? load,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? start,
    TResult? Function(int id, List<Map<String, dynamic>> items)? saveProgress,
    TResult? Function(int id, List<Map<String, dynamic>> items)? complete,
    TResult? Function(int id)? approve,
    TResult? Function(int id, String reason)? reject,
    TResult? Function(int warehouseId, String? search, int? categoryId)?
        loadProductsForOpname,
  }) {
    return saveProgress?.call(id, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status, int? warehouseId)? load,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? start,
    TResult Function(int id, List<Map<String, dynamic>> items)? saveProgress,
    TResult Function(int id, List<Map<String, dynamic>> items)? complete,
    TResult Function(int id)? approve,
    TResult Function(int id, String reason)? reject,
    TResult Function(int warehouseId, String? search, int? categoryId)?
        loadProductsForOpname,
    required TResult orElse(),
  }) {
    if (saveProgress != null) {
      return saveProgress(id, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_Store value) store,
    required TResult Function(_Start value) start,
    required TResult Function(_SaveProgress value) saveProgress,
    required TResult Function(_Complete value) complete,
    required TResult Function(_Approve value) approve,
    required TResult Function(_Reject value) reject,
    required TResult Function(_LoadProductsForOpname value)
        loadProductsForOpname,
  }) {
    return saveProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_Store value)? store,
    TResult? Function(_Start value)? start,
    TResult? Function(_SaveProgress value)? saveProgress,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_Approve value)? approve,
    TResult? Function(_Reject value)? reject,
    TResult? Function(_LoadProductsForOpname value)? loadProductsForOpname,
  }) {
    return saveProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_Store value)? store,
    TResult Function(_Start value)? start,
    TResult Function(_SaveProgress value)? saveProgress,
    TResult Function(_Complete value)? complete,
    TResult Function(_Approve value)? approve,
    TResult Function(_Reject value)? reject,
    TResult Function(_LoadProductsForOpname value)? loadProductsForOpname,
    required TResult orElse(),
  }) {
    if (saveProgress != null) {
      return saveProgress(this);
    }
    return orElse();
  }
}

abstract class _SaveProgress implements OpnameEvent {
  const factory _SaveProgress(
      {required final int id,
      required final List<Map<String, dynamic>> items}) = _$SaveProgressImpl;

  int get id;
  List<Map<String, dynamic>> get items;

  /// Create a copy of OpnameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveProgressImplCopyWith<_$SaveProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompleteImplCopyWith<$Res> {
  factory _$$CompleteImplCopyWith(
          _$CompleteImpl value, $Res Function(_$CompleteImpl) then) =
      __$$CompleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, List<Map<String, dynamic>> items});
}

/// @nodoc
class __$$CompleteImplCopyWithImpl<$Res>
    extends _$OpnameEventCopyWithImpl<$Res, _$CompleteImpl>
    implements _$$CompleteImplCopyWith<$Res> {
  __$$CompleteImplCopyWithImpl(
      _$CompleteImpl _value, $Res Function(_$CompleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpnameEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? items = null,
  }) {
    return _then(_$CompleteImpl(
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

class _$CompleteImpl implements _Complete {
  const _$CompleteImpl(
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
    return 'OpnameEvent.complete(id: $id, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, const DeepCollectionEquality().hash(_items));

  /// Create a copy of OpnameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteImplCopyWith<_$CompleteImpl> get copyWith =>
      __$$CompleteImplCopyWithImpl<_$CompleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status, int? warehouseId) load,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) start,
    required TResult Function(int id, List<Map<String, dynamic>> items)
        saveProgress,
    required TResult Function(int id, List<Map<String, dynamic>> items)
        complete,
    required TResult Function(int id) approve,
    required TResult Function(int id, String reason) reject,
    required TResult Function(int warehouseId, String? search, int? categoryId)
        loadProductsForOpname,
  }) {
    return complete(id, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status, int? warehouseId)? load,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? start,
    TResult? Function(int id, List<Map<String, dynamic>> items)? saveProgress,
    TResult? Function(int id, List<Map<String, dynamic>> items)? complete,
    TResult? Function(int id)? approve,
    TResult? Function(int id, String reason)? reject,
    TResult? Function(int warehouseId, String? search, int? categoryId)?
        loadProductsForOpname,
  }) {
    return complete?.call(id, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status, int? warehouseId)? load,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? start,
    TResult Function(int id, List<Map<String, dynamic>> items)? saveProgress,
    TResult Function(int id, List<Map<String, dynamic>> items)? complete,
    TResult Function(int id)? approve,
    TResult Function(int id, String reason)? reject,
    TResult Function(int warehouseId, String? search, int? categoryId)?
        loadProductsForOpname,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(id, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_Store value) store,
    required TResult Function(_Start value) start,
    required TResult Function(_SaveProgress value) saveProgress,
    required TResult Function(_Complete value) complete,
    required TResult Function(_Approve value) approve,
    required TResult Function(_Reject value) reject,
    required TResult Function(_LoadProductsForOpname value)
        loadProductsForOpname,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_Store value)? store,
    TResult? Function(_Start value)? start,
    TResult? Function(_SaveProgress value)? saveProgress,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_Approve value)? approve,
    TResult? Function(_Reject value)? reject,
    TResult? Function(_LoadProductsForOpname value)? loadProductsForOpname,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_Store value)? store,
    TResult Function(_Start value)? start,
    TResult Function(_SaveProgress value)? saveProgress,
    TResult Function(_Complete value)? complete,
    TResult Function(_Approve value)? approve,
    TResult Function(_Reject value)? reject,
    TResult Function(_LoadProductsForOpname value)? loadProductsForOpname,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }
}

abstract class _Complete implements OpnameEvent {
  const factory _Complete(
      {required final int id,
      required final List<Map<String, dynamic>> items}) = _$CompleteImpl;

  int get id;
  List<Map<String, dynamic>> get items;

  /// Create a copy of OpnameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompleteImplCopyWith<_$CompleteImpl> get copyWith =>
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
    extends _$OpnameEventCopyWithImpl<$Res, _$ApproveImpl>
    implements _$$ApproveImplCopyWith<$Res> {
  __$$ApproveImplCopyWithImpl(
      _$ApproveImpl _value, $Res Function(_$ApproveImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpnameEvent
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
    return 'OpnameEvent.approve(id: $id)';
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

  /// Create a copy of OpnameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveImplCopyWith<_$ApproveImpl> get copyWith =>
      __$$ApproveImplCopyWithImpl<_$ApproveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status, int? warehouseId) load,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) start,
    required TResult Function(int id, List<Map<String, dynamic>> items)
        saveProgress,
    required TResult Function(int id, List<Map<String, dynamic>> items)
        complete,
    required TResult Function(int id) approve,
    required TResult Function(int id, String reason) reject,
    required TResult Function(int warehouseId, String? search, int? categoryId)
        loadProductsForOpname,
  }) {
    return approve(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status, int? warehouseId)? load,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? start,
    TResult? Function(int id, List<Map<String, dynamic>> items)? saveProgress,
    TResult? Function(int id, List<Map<String, dynamic>> items)? complete,
    TResult? Function(int id)? approve,
    TResult? Function(int id, String reason)? reject,
    TResult? Function(int warehouseId, String? search, int? categoryId)?
        loadProductsForOpname,
  }) {
    return approve?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status, int? warehouseId)? load,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? start,
    TResult Function(int id, List<Map<String, dynamic>> items)? saveProgress,
    TResult Function(int id, List<Map<String, dynamic>> items)? complete,
    TResult Function(int id)? approve,
    TResult Function(int id, String reason)? reject,
    TResult Function(int warehouseId, String? search, int? categoryId)?
        loadProductsForOpname,
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
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_Store value) store,
    required TResult Function(_Start value) start,
    required TResult Function(_SaveProgress value) saveProgress,
    required TResult Function(_Complete value) complete,
    required TResult Function(_Approve value) approve,
    required TResult Function(_Reject value) reject,
    required TResult Function(_LoadProductsForOpname value)
        loadProductsForOpname,
  }) {
    return approve(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_Store value)? store,
    TResult? Function(_Start value)? start,
    TResult? Function(_SaveProgress value)? saveProgress,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_Approve value)? approve,
    TResult? Function(_Reject value)? reject,
    TResult? Function(_LoadProductsForOpname value)? loadProductsForOpname,
  }) {
    return approve?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_Store value)? store,
    TResult Function(_Start value)? start,
    TResult Function(_SaveProgress value)? saveProgress,
    TResult Function(_Complete value)? complete,
    TResult Function(_Approve value)? approve,
    TResult Function(_Reject value)? reject,
    TResult Function(_LoadProductsForOpname value)? loadProductsForOpname,
    required TResult orElse(),
  }) {
    if (approve != null) {
      return approve(this);
    }
    return orElse();
  }
}

abstract class _Approve implements OpnameEvent {
  const factory _Approve(final int id) = _$ApproveImpl;

  int get id;

  /// Create a copy of OpnameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApproveImplCopyWith<_$ApproveImpl> get copyWith =>
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
    extends _$OpnameEventCopyWithImpl<$Res, _$RejectImpl>
    implements _$$RejectImplCopyWith<$Res> {
  __$$RejectImplCopyWithImpl(
      _$RejectImpl _value, $Res Function(_$RejectImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpnameEvent
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
    return 'OpnameEvent.reject(id: $id, reason: $reason)';
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

  /// Create a copy of OpnameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectImplCopyWith<_$RejectImpl> get copyWith =>
      __$$RejectImplCopyWithImpl<_$RejectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status, int? warehouseId) load,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) start,
    required TResult Function(int id, List<Map<String, dynamic>> items)
        saveProgress,
    required TResult Function(int id, List<Map<String, dynamic>> items)
        complete,
    required TResult Function(int id) approve,
    required TResult Function(int id, String reason) reject,
    required TResult Function(int warehouseId, String? search, int? categoryId)
        loadProductsForOpname,
  }) {
    return reject(id, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status, int? warehouseId)? load,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? start,
    TResult? Function(int id, List<Map<String, dynamic>> items)? saveProgress,
    TResult? Function(int id, List<Map<String, dynamic>> items)? complete,
    TResult? Function(int id)? approve,
    TResult? Function(int id, String reason)? reject,
    TResult? Function(int warehouseId, String? search, int? categoryId)?
        loadProductsForOpname,
  }) {
    return reject?.call(id, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status, int? warehouseId)? load,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? start,
    TResult Function(int id, List<Map<String, dynamic>> items)? saveProgress,
    TResult Function(int id, List<Map<String, dynamic>> items)? complete,
    TResult Function(int id)? approve,
    TResult Function(int id, String reason)? reject,
    TResult Function(int warehouseId, String? search, int? categoryId)?
        loadProductsForOpname,
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
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_Store value) store,
    required TResult Function(_Start value) start,
    required TResult Function(_SaveProgress value) saveProgress,
    required TResult Function(_Complete value) complete,
    required TResult Function(_Approve value) approve,
    required TResult Function(_Reject value) reject,
    required TResult Function(_LoadProductsForOpname value)
        loadProductsForOpname,
  }) {
    return reject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_Store value)? store,
    TResult? Function(_Start value)? start,
    TResult? Function(_SaveProgress value)? saveProgress,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_Approve value)? approve,
    TResult? Function(_Reject value)? reject,
    TResult? Function(_LoadProductsForOpname value)? loadProductsForOpname,
  }) {
    return reject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_Store value)? store,
    TResult Function(_Start value)? start,
    TResult Function(_SaveProgress value)? saveProgress,
    TResult Function(_Complete value)? complete,
    TResult Function(_Approve value)? approve,
    TResult Function(_Reject value)? reject,
    TResult Function(_LoadProductsForOpname value)? loadProductsForOpname,
    required TResult orElse(),
  }) {
    if (reject != null) {
      return reject(this);
    }
    return orElse();
  }
}

abstract class _Reject implements OpnameEvent {
  const factory _Reject({required final int id, required final String reason}) =
      _$RejectImpl;

  int get id;
  String get reason;

  /// Create a copy of OpnameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RejectImplCopyWith<_$RejectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadProductsForOpnameImplCopyWith<$Res> {
  factory _$$LoadProductsForOpnameImplCopyWith(
          _$LoadProductsForOpnameImpl value,
          $Res Function(_$LoadProductsForOpnameImpl) then) =
      __$$LoadProductsForOpnameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int warehouseId, String? search, int? categoryId});
}

/// @nodoc
class __$$LoadProductsForOpnameImplCopyWithImpl<$Res>
    extends _$OpnameEventCopyWithImpl<$Res, _$LoadProductsForOpnameImpl>
    implements _$$LoadProductsForOpnameImplCopyWith<$Res> {
  __$$LoadProductsForOpnameImplCopyWithImpl(_$LoadProductsForOpnameImpl _value,
      $Res Function(_$LoadProductsForOpnameImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpnameEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? warehouseId = null,
    Object? search = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(_$LoadProductsForOpnameImpl(
      warehouseId: null == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$LoadProductsForOpnameImpl implements _LoadProductsForOpname {
  const _$LoadProductsForOpnameImpl(
      {required this.warehouseId, this.search, this.categoryId});

  @override
  final int warehouseId;
  @override
  final String? search;
  @override
  final int? categoryId;

  @override
  String toString() {
    return 'OpnameEvent.loadProductsForOpname(warehouseId: $warehouseId, search: $search, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadProductsForOpnameImpl &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, warehouseId, search, categoryId);

  /// Create a copy of OpnameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadProductsForOpnameImplCopyWith<_$LoadProductsForOpnameImpl>
      get copyWith => __$$LoadProductsForOpnameImplCopyWithImpl<
          _$LoadProductsForOpnameImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status, int? warehouseId) load,
    required TResult Function(int id) loadDetail,
    required TResult Function(Map<String, dynamic> body) store,
    required TResult Function(int id) start,
    required TResult Function(int id, List<Map<String, dynamic>> items)
        saveProgress,
    required TResult Function(int id, List<Map<String, dynamic>> items)
        complete,
    required TResult Function(int id) approve,
    required TResult Function(int id, String reason) reject,
    required TResult Function(int warehouseId, String? search, int? categoryId)
        loadProductsForOpname,
  }) {
    return loadProductsForOpname(warehouseId, search, categoryId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status, int? warehouseId)? load,
    TResult? Function(int id)? loadDetail,
    TResult? Function(Map<String, dynamic> body)? store,
    TResult? Function(int id)? start,
    TResult? Function(int id, List<Map<String, dynamic>> items)? saveProgress,
    TResult? Function(int id, List<Map<String, dynamic>> items)? complete,
    TResult? Function(int id)? approve,
    TResult? Function(int id, String reason)? reject,
    TResult? Function(int warehouseId, String? search, int? categoryId)?
        loadProductsForOpname,
  }) {
    return loadProductsForOpname?.call(warehouseId, search, categoryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status, int? warehouseId)? load,
    TResult Function(int id)? loadDetail,
    TResult Function(Map<String, dynamic> body)? store,
    TResult Function(int id)? start,
    TResult Function(int id, List<Map<String, dynamic>> items)? saveProgress,
    TResult Function(int id, List<Map<String, dynamic>> items)? complete,
    TResult Function(int id)? approve,
    TResult Function(int id, String reason)? reject,
    TResult Function(int warehouseId, String? search, int? categoryId)?
        loadProductsForOpname,
    required TResult orElse(),
  }) {
    if (loadProductsForOpname != null) {
      return loadProductsForOpname(warehouseId, search, categoryId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadDetail value) loadDetail,
    required TResult Function(_Store value) store,
    required TResult Function(_Start value) start,
    required TResult Function(_SaveProgress value) saveProgress,
    required TResult Function(_Complete value) complete,
    required TResult Function(_Approve value) approve,
    required TResult Function(_Reject value) reject,
    required TResult Function(_LoadProductsForOpname value)
        loadProductsForOpname,
  }) {
    return loadProductsForOpname(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadDetail value)? loadDetail,
    TResult? Function(_Store value)? store,
    TResult? Function(_Start value)? start,
    TResult? Function(_SaveProgress value)? saveProgress,
    TResult? Function(_Complete value)? complete,
    TResult? Function(_Approve value)? approve,
    TResult? Function(_Reject value)? reject,
    TResult? Function(_LoadProductsForOpname value)? loadProductsForOpname,
  }) {
    return loadProductsForOpname?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadDetail value)? loadDetail,
    TResult Function(_Store value)? store,
    TResult Function(_Start value)? start,
    TResult Function(_SaveProgress value)? saveProgress,
    TResult Function(_Complete value)? complete,
    TResult Function(_Approve value)? approve,
    TResult Function(_Reject value)? reject,
    TResult Function(_LoadProductsForOpname value)? loadProductsForOpname,
    required TResult orElse(),
  }) {
    if (loadProductsForOpname != null) {
      return loadProductsForOpname(this);
    }
    return orElse();
  }
}

abstract class _LoadProductsForOpname implements OpnameEvent {
  const factory _LoadProductsForOpname(
      {required final int warehouseId,
      final String? search,
      final int? categoryId}) = _$LoadProductsForOpnameImpl;

  int get warehouseId;
  String? get search;
  int? get categoryId;

  /// Create a copy of OpnameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadProductsForOpnameImplCopyWith<_$LoadProductsForOpnameImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OpnameState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() actionLoading,
    required TResult Function(StockOpnameListResponse result) listLoaded,
    required TResult Function(StockOpnameSingleResponse result) detailLoaded,
    required TResult Function(String message, StockOpnameSingleResponse? data)
        actionSuccess,
    required TResult Function(ProductForOpnameListResponse result)
        productsLoaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? actionLoading,
    TResult? Function(StockOpnameListResponse result)? listLoaded,
    TResult? Function(StockOpnameSingleResponse result)? detailLoaded,
    TResult? Function(String message, StockOpnameSingleResponse? data)?
        actionSuccess,
    TResult? Function(ProductForOpnameListResponse result)? productsLoaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? actionLoading,
    TResult Function(StockOpnameListResponse result)? listLoaded,
    TResult Function(StockOpnameSingleResponse result)? detailLoaded,
    TResult Function(String message, StockOpnameSingleResponse? data)?
        actionSuccess,
    TResult Function(ProductForOpnameListResponse result)? productsLoaded,
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
    required TResult Function(_ProductsLoaded value) productsLoaded,
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
    TResult? Function(_ProductsLoaded value)? productsLoaded,
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
    TResult Function(_ProductsLoaded value)? productsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpnameStateCopyWith<$Res> {
  factory $OpnameStateCopyWith(
          OpnameState value, $Res Function(OpnameState) then) =
      _$OpnameStateCopyWithImpl<$Res, OpnameState>;
}

/// @nodoc
class _$OpnameStateCopyWithImpl<$Res, $Val extends OpnameState>
    implements $OpnameStateCopyWith<$Res> {
  _$OpnameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpnameState
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
    extends _$OpnameStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpnameState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'OpnameState.initial()';
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
    required TResult Function(StockOpnameListResponse result) listLoaded,
    required TResult Function(StockOpnameSingleResponse result) detailLoaded,
    required TResult Function(String message, StockOpnameSingleResponse? data)
        actionSuccess,
    required TResult Function(ProductForOpnameListResponse result)
        productsLoaded,
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
    TResult? Function(StockOpnameListResponse result)? listLoaded,
    TResult? Function(StockOpnameSingleResponse result)? detailLoaded,
    TResult? Function(String message, StockOpnameSingleResponse? data)?
        actionSuccess,
    TResult? Function(ProductForOpnameListResponse result)? productsLoaded,
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
    TResult Function(StockOpnameListResponse result)? listLoaded,
    TResult Function(StockOpnameSingleResponse result)? detailLoaded,
    TResult Function(String message, StockOpnameSingleResponse? data)?
        actionSuccess,
    TResult Function(ProductForOpnameListResponse result)? productsLoaded,
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
    required TResult Function(_ProductsLoaded value) productsLoaded,
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
    TResult? Function(_ProductsLoaded value)? productsLoaded,
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
    TResult Function(_ProductsLoaded value)? productsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements OpnameState {
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
    extends _$OpnameStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpnameState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'OpnameState.loading()';
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
    required TResult Function(StockOpnameListResponse result) listLoaded,
    required TResult Function(StockOpnameSingleResponse result) detailLoaded,
    required TResult Function(String message, StockOpnameSingleResponse? data)
        actionSuccess,
    required TResult Function(ProductForOpnameListResponse result)
        productsLoaded,
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
    TResult? Function(StockOpnameListResponse result)? listLoaded,
    TResult? Function(StockOpnameSingleResponse result)? detailLoaded,
    TResult? Function(String message, StockOpnameSingleResponse? data)?
        actionSuccess,
    TResult? Function(ProductForOpnameListResponse result)? productsLoaded,
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
    TResult Function(StockOpnameListResponse result)? listLoaded,
    TResult Function(StockOpnameSingleResponse result)? detailLoaded,
    TResult Function(String message, StockOpnameSingleResponse? data)?
        actionSuccess,
    TResult Function(ProductForOpnameListResponse result)? productsLoaded,
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
    required TResult Function(_ProductsLoaded value) productsLoaded,
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
    TResult? Function(_ProductsLoaded value)? productsLoaded,
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
    TResult Function(_ProductsLoaded value)? productsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements OpnameState {
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
    extends _$OpnameStateCopyWithImpl<$Res, _$ActionLoadingImpl>
    implements _$$ActionLoadingImplCopyWith<$Res> {
  __$$ActionLoadingImplCopyWithImpl(
      _$ActionLoadingImpl _value, $Res Function(_$ActionLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpnameState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ActionLoadingImpl implements _ActionLoading {
  const _$ActionLoadingImpl();

  @override
  String toString() {
    return 'OpnameState.actionLoading()';
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
    required TResult Function(StockOpnameListResponse result) listLoaded,
    required TResult Function(StockOpnameSingleResponse result) detailLoaded,
    required TResult Function(String message, StockOpnameSingleResponse? data)
        actionSuccess,
    required TResult Function(ProductForOpnameListResponse result)
        productsLoaded,
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
    TResult? Function(StockOpnameListResponse result)? listLoaded,
    TResult? Function(StockOpnameSingleResponse result)? detailLoaded,
    TResult? Function(String message, StockOpnameSingleResponse? data)?
        actionSuccess,
    TResult? Function(ProductForOpnameListResponse result)? productsLoaded,
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
    TResult Function(StockOpnameListResponse result)? listLoaded,
    TResult Function(StockOpnameSingleResponse result)? detailLoaded,
    TResult Function(String message, StockOpnameSingleResponse? data)?
        actionSuccess,
    TResult Function(ProductForOpnameListResponse result)? productsLoaded,
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
    required TResult Function(_ProductsLoaded value) productsLoaded,
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
    TResult? Function(_ProductsLoaded value)? productsLoaded,
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
    TResult Function(_ProductsLoaded value)? productsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (actionLoading != null) {
      return actionLoading(this);
    }
    return orElse();
  }
}

abstract class _ActionLoading implements OpnameState {
  const factory _ActionLoading() = _$ActionLoadingImpl;
}

/// @nodoc
abstract class _$$ListLoadedImplCopyWith<$Res> {
  factory _$$ListLoadedImplCopyWith(
          _$ListLoadedImpl value, $Res Function(_$ListLoadedImpl) then) =
      __$$ListLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StockOpnameListResponse result});
}

/// @nodoc
class __$$ListLoadedImplCopyWithImpl<$Res>
    extends _$OpnameStateCopyWithImpl<$Res, _$ListLoadedImpl>
    implements _$$ListLoadedImplCopyWith<$Res> {
  __$$ListLoadedImplCopyWithImpl(
      _$ListLoadedImpl _value, $Res Function(_$ListLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpnameState
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
              as StockOpnameListResponse,
    ));
  }
}

/// @nodoc

class _$ListLoadedImpl implements _ListLoaded {
  const _$ListLoadedImpl(this.result);

  @override
  final StockOpnameListResponse result;

  @override
  String toString() {
    return 'OpnameState.listLoaded(result: $result)';
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

  /// Create a copy of OpnameState
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
    required TResult Function(StockOpnameListResponse result) listLoaded,
    required TResult Function(StockOpnameSingleResponse result) detailLoaded,
    required TResult Function(String message, StockOpnameSingleResponse? data)
        actionSuccess,
    required TResult Function(ProductForOpnameListResponse result)
        productsLoaded,
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
    TResult? Function(StockOpnameListResponse result)? listLoaded,
    TResult? Function(StockOpnameSingleResponse result)? detailLoaded,
    TResult? Function(String message, StockOpnameSingleResponse? data)?
        actionSuccess,
    TResult? Function(ProductForOpnameListResponse result)? productsLoaded,
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
    TResult Function(StockOpnameListResponse result)? listLoaded,
    TResult Function(StockOpnameSingleResponse result)? detailLoaded,
    TResult Function(String message, StockOpnameSingleResponse? data)?
        actionSuccess,
    TResult Function(ProductForOpnameListResponse result)? productsLoaded,
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
    required TResult Function(_ProductsLoaded value) productsLoaded,
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
    TResult? Function(_ProductsLoaded value)? productsLoaded,
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
    TResult Function(_ProductsLoaded value)? productsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (listLoaded != null) {
      return listLoaded(this);
    }
    return orElse();
  }
}

abstract class _ListLoaded implements OpnameState {
  const factory _ListLoaded(final StockOpnameListResponse result) =
      _$ListLoadedImpl;

  StockOpnameListResponse get result;

  /// Create a copy of OpnameState
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
  $Res call({StockOpnameSingleResponse result});
}

/// @nodoc
class __$$DetailLoadedImplCopyWithImpl<$Res>
    extends _$OpnameStateCopyWithImpl<$Res, _$DetailLoadedImpl>
    implements _$$DetailLoadedImplCopyWith<$Res> {
  __$$DetailLoadedImplCopyWithImpl(
      _$DetailLoadedImpl _value, $Res Function(_$DetailLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpnameState
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
              as StockOpnameSingleResponse,
    ));
  }
}

/// @nodoc

class _$DetailLoadedImpl implements _DetailLoaded {
  const _$DetailLoadedImpl(this.result);

  @override
  final StockOpnameSingleResponse result;

  @override
  String toString() {
    return 'OpnameState.detailLoaded(result: $result)';
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

  /// Create a copy of OpnameState
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
    required TResult Function(StockOpnameListResponse result) listLoaded,
    required TResult Function(StockOpnameSingleResponse result) detailLoaded,
    required TResult Function(String message, StockOpnameSingleResponse? data)
        actionSuccess,
    required TResult Function(ProductForOpnameListResponse result)
        productsLoaded,
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
    TResult? Function(StockOpnameListResponse result)? listLoaded,
    TResult? Function(StockOpnameSingleResponse result)? detailLoaded,
    TResult? Function(String message, StockOpnameSingleResponse? data)?
        actionSuccess,
    TResult? Function(ProductForOpnameListResponse result)? productsLoaded,
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
    TResult Function(StockOpnameListResponse result)? listLoaded,
    TResult Function(StockOpnameSingleResponse result)? detailLoaded,
    TResult Function(String message, StockOpnameSingleResponse? data)?
        actionSuccess,
    TResult Function(ProductForOpnameListResponse result)? productsLoaded,
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
    required TResult Function(_ProductsLoaded value) productsLoaded,
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
    TResult? Function(_ProductsLoaded value)? productsLoaded,
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
    TResult Function(_ProductsLoaded value)? productsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (detailLoaded != null) {
      return detailLoaded(this);
    }
    return orElse();
  }
}

abstract class _DetailLoaded implements OpnameState {
  const factory _DetailLoaded(final StockOpnameSingleResponse result) =
      _$DetailLoadedImpl;

  StockOpnameSingleResponse get result;

  /// Create a copy of OpnameState
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
  $Res call({String message, StockOpnameSingleResponse? data});
}

/// @nodoc
class __$$ActionSuccessImplCopyWithImpl<$Res>
    extends _$OpnameStateCopyWithImpl<$Res, _$ActionSuccessImpl>
    implements _$$ActionSuccessImplCopyWith<$Res> {
  __$$ActionSuccessImplCopyWithImpl(
      _$ActionSuccessImpl _value, $Res Function(_$ActionSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpnameState
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
              as StockOpnameSingleResponse?,
    ));
  }
}

/// @nodoc

class _$ActionSuccessImpl implements _ActionSuccess {
  const _$ActionSuccessImpl(this.message, this.data);

  @override
  final String message;
  @override
  final StockOpnameSingleResponse? data;

  @override
  String toString() {
    return 'OpnameState.actionSuccess(message: $message, data: $data)';
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

  /// Create a copy of OpnameState
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
    required TResult Function(StockOpnameListResponse result) listLoaded,
    required TResult Function(StockOpnameSingleResponse result) detailLoaded,
    required TResult Function(String message, StockOpnameSingleResponse? data)
        actionSuccess,
    required TResult Function(ProductForOpnameListResponse result)
        productsLoaded,
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
    TResult? Function(StockOpnameListResponse result)? listLoaded,
    TResult? Function(StockOpnameSingleResponse result)? detailLoaded,
    TResult? Function(String message, StockOpnameSingleResponse? data)?
        actionSuccess,
    TResult? Function(ProductForOpnameListResponse result)? productsLoaded,
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
    TResult Function(StockOpnameListResponse result)? listLoaded,
    TResult Function(StockOpnameSingleResponse result)? detailLoaded,
    TResult Function(String message, StockOpnameSingleResponse? data)?
        actionSuccess,
    TResult Function(ProductForOpnameListResponse result)? productsLoaded,
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
    required TResult Function(_ProductsLoaded value) productsLoaded,
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
    TResult? Function(_ProductsLoaded value)? productsLoaded,
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
    TResult Function(_ProductsLoaded value)? productsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (actionSuccess != null) {
      return actionSuccess(this);
    }
    return orElse();
  }
}

abstract class _ActionSuccess implements OpnameState {
  const factory _ActionSuccess(
          final String message, final StockOpnameSingleResponse? data) =
      _$ActionSuccessImpl;

  String get message;
  StockOpnameSingleResponse? get data;

  /// Create a copy of OpnameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActionSuccessImplCopyWith<_$ActionSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductsLoadedImplCopyWith<$Res> {
  factory _$$ProductsLoadedImplCopyWith(_$ProductsLoadedImpl value,
          $Res Function(_$ProductsLoadedImpl) then) =
      __$$ProductsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductForOpnameListResponse result});
}

/// @nodoc
class __$$ProductsLoadedImplCopyWithImpl<$Res>
    extends _$OpnameStateCopyWithImpl<$Res, _$ProductsLoadedImpl>
    implements _$$ProductsLoadedImplCopyWith<$Res> {
  __$$ProductsLoadedImplCopyWithImpl(
      _$ProductsLoadedImpl _value, $Res Function(_$ProductsLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpnameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$ProductsLoadedImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ProductForOpnameListResponse,
    ));
  }
}

/// @nodoc

class _$ProductsLoadedImpl implements _ProductsLoaded {
  const _$ProductsLoadedImpl(this.result);

  @override
  final ProductForOpnameListResponse result;

  @override
  String toString() {
    return 'OpnameState.productsLoaded(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsLoadedImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of OpnameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsLoadedImplCopyWith<_$ProductsLoadedImpl> get copyWith =>
      __$$ProductsLoadedImplCopyWithImpl<_$ProductsLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() actionLoading,
    required TResult Function(StockOpnameListResponse result) listLoaded,
    required TResult Function(StockOpnameSingleResponse result) detailLoaded,
    required TResult Function(String message, StockOpnameSingleResponse? data)
        actionSuccess,
    required TResult Function(ProductForOpnameListResponse result)
        productsLoaded,
    required TResult Function(String message) error,
  }) {
    return productsLoaded(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? actionLoading,
    TResult? Function(StockOpnameListResponse result)? listLoaded,
    TResult? Function(StockOpnameSingleResponse result)? detailLoaded,
    TResult? Function(String message, StockOpnameSingleResponse? data)?
        actionSuccess,
    TResult? Function(ProductForOpnameListResponse result)? productsLoaded,
    TResult? Function(String message)? error,
  }) {
    return productsLoaded?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? actionLoading,
    TResult Function(StockOpnameListResponse result)? listLoaded,
    TResult Function(StockOpnameSingleResponse result)? detailLoaded,
    TResult Function(String message, StockOpnameSingleResponse? data)?
        actionSuccess,
    TResult Function(ProductForOpnameListResponse result)? productsLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (productsLoaded != null) {
      return productsLoaded(result);
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
    required TResult Function(_ProductsLoaded value) productsLoaded,
    required TResult Function(_Error value) error,
  }) {
    return productsLoaded(this);
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
    TResult? Function(_ProductsLoaded value)? productsLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return productsLoaded?.call(this);
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
    TResult Function(_ProductsLoaded value)? productsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (productsLoaded != null) {
      return productsLoaded(this);
    }
    return orElse();
  }
}

abstract class _ProductsLoaded implements OpnameState {
  const factory _ProductsLoaded(final ProductForOpnameListResponse result) =
      _$ProductsLoadedImpl;

  ProductForOpnameListResponse get result;

  /// Create a copy of OpnameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductsLoadedImplCopyWith<_$ProductsLoadedImpl> get copyWith =>
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
    extends _$OpnameStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpnameState
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
    return 'OpnameState.error(message: $message)';
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

  /// Create a copy of OpnameState
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
    required TResult Function(StockOpnameListResponse result) listLoaded,
    required TResult Function(StockOpnameSingleResponse result) detailLoaded,
    required TResult Function(String message, StockOpnameSingleResponse? data)
        actionSuccess,
    required TResult Function(ProductForOpnameListResponse result)
        productsLoaded,
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
    TResult? Function(StockOpnameListResponse result)? listLoaded,
    TResult? Function(StockOpnameSingleResponse result)? detailLoaded,
    TResult? Function(String message, StockOpnameSingleResponse? data)?
        actionSuccess,
    TResult? Function(ProductForOpnameListResponse result)? productsLoaded,
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
    TResult Function(StockOpnameListResponse result)? listLoaded,
    TResult Function(StockOpnameSingleResponse result)? detailLoaded,
    TResult Function(String message, StockOpnameSingleResponse? data)?
        actionSuccess,
    TResult Function(ProductForOpnameListResponse result)? productsLoaded,
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
    required TResult Function(_ProductsLoaded value) productsLoaded,
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
    TResult? Function(_ProductsLoaded value)? productsLoaded,
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
    TResult Function(_ProductsLoaded value)? productsLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements OpnameState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of OpnameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
