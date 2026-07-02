// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warehouse_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WarehouseEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? search, bool? isActive)
        loadWarehouses,
    required TResult Function(int id) loadWarehouseDetail,
    required TResult Function(StoreWarehouseRequestModel request)
        storeWarehouse,
    required TResult Function(int id, UpdateWarehouseRequestModel request)
        updateWarehouse,
    required TResult Function(int id) deleteWarehouse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? search, bool? isActive)? loadWarehouses,
    TResult? Function(int id)? loadWarehouseDetail,
    TResult? Function(StoreWarehouseRequestModel request)? storeWarehouse,
    TResult? Function(int id, UpdateWarehouseRequestModel request)?
        updateWarehouse,
    TResult? Function(int id)? deleteWarehouse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? search, bool? isActive)? loadWarehouses,
    TResult Function(int id)? loadWarehouseDetail,
    TResult Function(StoreWarehouseRequestModel request)? storeWarehouse,
    TResult Function(int id, UpdateWarehouseRequestModel request)?
        updateWarehouse,
    TResult Function(int id)? deleteWarehouse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_LoadWarehouseDetail value) loadWarehouseDetail,
    required TResult Function(_StoreWarehouse value) storeWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_DeleteWarehouse value) deleteWarehouse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_LoadWarehouseDetail value)? loadWarehouseDetail,
    TResult? Function(_StoreWarehouse value)? storeWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_DeleteWarehouse value)? deleteWarehouse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_LoadWarehouseDetail value)? loadWarehouseDetail,
    TResult Function(_StoreWarehouse value)? storeWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_DeleteWarehouse value)? deleteWarehouse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WarehouseEventCopyWith<$Res> {
  factory $WarehouseEventCopyWith(
          WarehouseEvent value, $Res Function(WarehouseEvent) then) =
      _$WarehouseEventCopyWithImpl<$Res, WarehouseEvent>;
}

/// @nodoc
class _$WarehouseEventCopyWithImpl<$Res, $Val extends WarehouseEvent>
    implements $WarehouseEventCopyWith<$Res> {
  _$WarehouseEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WarehouseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadWarehousesImplCopyWith<$Res> {
  factory _$$LoadWarehousesImplCopyWith(_$LoadWarehousesImpl value,
          $Res Function(_$LoadWarehousesImpl) then) =
      __$$LoadWarehousesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, String? search, bool? isActive});
}

/// @nodoc
class __$$LoadWarehousesImplCopyWithImpl<$Res>
    extends _$WarehouseEventCopyWithImpl<$Res, _$LoadWarehousesImpl>
    implements _$$LoadWarehousesImplCopyWith<$Res> {
  __$$LoadWarehousesImplCopyWithImpl(
      _$LoadWarehousesImpl _value, $Res Function(_$LoadWarehousesImpl) _then)
      : super(_value, _then);

  /// Create a copy of WarehouseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? search = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$LoadWarehousesImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$LoadWarehousesImpl implements _LoadWarehouses {
  const _$LoadWarehousesImpl({this.page = 1, this.search, this.isActive});

  @override
  @JsonKey()
  final int page;
  @override
  final String? search;
  @override
  final bool? isActive;

  @override
  String toString() {
    return 'WarehouseEvent.loadWarehouses(page: $page, search: $search, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadWarehousesImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, search, isActive);

  /// Create a copy of WarehouseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadWarehousesImplCopyWith<_$LoadWarehousesImpl> get copyWith =>
      __$$LoadWarehousesImplCopyWithImpl<_$LoadWarehousesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? search, bool? isActive)
        loadWarehouses,
    required TResult Function(int id) loadWarehouseDetail,
    required TResult Function(StoreWarehouseRequestModel request)
        storeWarehouse,
    required TResult Function(int id, UpdateWarehouseRequestModel request)
        updateWarehouse,
    required TResult Function(int id) deleteWarehouse,
  }) {
    return loadWarehouses(page, search, isActive);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? search, bool? isActive)? loadWarehouses,
    TResult? Function(int id)? loadWarehouseDetail,
    TResult? Function(StoreWarehouseRequestModel request)? storeWarehouse,
    TResult? Function(int id, UpdateWarehouseRequestModel request)?
        updateWarehouse,
    TResult? Function(int id)? deleteWarehouse,
  }) {
    return loadWarehouses?.call(page, search, isActive);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? search, bool? isActive)? loadWarehouses,
    TResult Function(int id)? loadWarehouseDetail,
    TResult Function(StoreWarehouseRequestModel request)? storeWarehouse,
    TResult Function(int id, UpdateWarehouseRequestModel request)?
        updateWarehouse,
    TResult Function(int id)? deleteWarehouse,
    required TResult orElse(),
  }) {
    if (loadWarehouses != null) {
      return loadWarehouses(page, search, isActive);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_LoadWarehouseDetail value) loadWarehouseDetail,
    required TResult Function(_StoreWarehouse value) storeWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_DeleteWarehouse value) deleteWarehouse,
  }) {
    return loadWarehouses(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_LoadWarehouseDetail value)? loadWarehouseDetail,
    TResult? Function(_StoreWarehouse value)? storeWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_DeleteWarehouse value)? deleteWarehouse,
  }) {
    return loadWarehouses?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_LoadWarehouseDetail value)? loadWarehouseDetail,
    TResult Function(_StoreWarehouse value)? storeWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_DeleteWarehouse value)? deleteWarehouse,
    required TResult orElse(),
  }) {
    if (loadWarehouses != null) {
      return loadWarehouses(this);
    }
    return orElse();
  }
}

abstract class _LoadWarehouses implements WarehouseEvent {
  const factory _LoadWarehouses(
      {final int page,
      final String? search,
      final bool? isActive}) = _$LoadWarehousesImpl;

  int get page;
  String? get search;
  bool? get isActive;

  /// Create a copy of WarehouseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadWarehousesImplCopyWith<_$LoadWarehousesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadWarehouseDetailImplCopyWith<$Res> {
  factory _$$LoadWarehouseDetailImplCopyWith(_$LoadWarehouseDetailImpl value,
          $Res Function(_$LoadWarehouseDetailImpl) then) =
      __$$LoadWarehouseDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$LoadWarehouseDetailImplCopyWithImpl<$Res>
    extends _$WarehouseEventCopyWithImpl<$Res, _$LoadWarehouseDetailImpl>
    implements _$$LoadWarehouseDetailImplCopyWith<$Res> {
  __$$LoadWarehouseDetailImplCopyWithImpl(_$LoadWarehouseDetailImpl _value,
      $Res Function(_$LoadWarehouseDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of WarehouseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$LoadWarehouseDetailImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadWarehouseDetailImpl implements _LoadWarehouseDetail {
  const _$LoadWarehouseDetailImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'WarehouseEvent.loadWarehouseDetail(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadWarehouseDetailImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of WarehouseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadWarehouseDetailImplCopyWith<_$LoadWarehouseDetailImpl> get copyWith =>
      __$$LoadWarehouseDetailImplCopyWithImpl<_$LoadWarehouseDetailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? search, bool? isActive)
        loadWarehouses,
    required TResult Function(int id) loadWarehouseDetail,
    required TResult Function(StoreWarehouseRequestModel request)
        storeWarehouse,
    required TResult Function(int id, UpdateWarehouseRequestModel request)
        updateWarehouse,
    required TResult Function(int id) deleteWarehouse,
  }) {
    return loadWarehouseDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? search, bool? isActive)? loadWarehouses,
    TResult? Function(int id)? loadWarehouseDetail,
    TResult? Function(StoreWarehouseRequestModel request)? storeWarehouse,
    TResult? Function(int id, UpdateWarehouseRequestModel request)?
        updateWarehouse,
    TResult? Function(int id)? deleteWarehouse,
  }) {
    return loadWarehouseDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? search, bool? isActive)? loadWarehouses,
    TResult Function(int id)? loadWarehouseDetail,
    TResult Function(StoreWarehouseRequestModel request)? storeWarehouse,
    TResult Function(int id, UpdateWarehouseRequestModel request)?
        updateWarehouse,
    TResult Function(int id)? deleteWarehouse,
    required TResult orElse(),
  }) {
    if (loadWarehouseDetail != null) {
      return loadWarehouseDetail(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_LoadWarehouseDetail value) loadWarehouseDetail,
    required TResult Function(_StoreWarehouse value) storeWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_DeleteWarehouse value) deleteWarehouse,
  }) {
    return loadWarehouseDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_LoadWarehouseDetail value)? loadWarehouseDetail,
    TResult? Function(_StoreWarehouse value)? storeWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_DeleteWarehouse value)? deleteWarehouse,
  }) {
    return loadWarehouseDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_LoadWarehouseDetail value)? loadWarehouseDetail,
    TResult Function(_StoreWarehouse value)? storeWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_DeleteWarehouse value)? deleteWarehouse,
    required TResult orElse(),
  }) {
    if (loadWarehouseDetail != null) {
      return loadWarehouseDetail(this);
    }
    return orElse();
  }
}

abstract class _LoadWarehouseDetail implements WarehouseEvent {
  const factory _LoadWarehouseDetail(final int id) = _$LoadWarehouseDetailImpl;

  int get id;

  /// Create a copy of WarehouseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadWarehouseDetailImplCopyWith<_$LoadWarehouseDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoreWarehouseImplCopyWith<$Res> {
  factory _$$StoreWarehouseImplCopyWith(_$StoreWarehouseImpl value,
          $Res Function(_$StoreWarehouseImpl) then) =
      __$$StoreWarehouseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StoreWarehouseRequestModel request});
}

/// @nodoc
class __$$StoreWarehouseImplCopyWithImpl<$Res>
    extends _$WarehouseEventCopyWithImpl<$Res, _$StoreWarehouseImpl>
    implements _$$StoreWarehouseImplCopyWith<$Res> {
  __$$StoreWarehouseImplCopyWithImpl(
      _$StoreWarehouseImpl _value, $Res Function(_$StoreWarehouseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WarehouseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$StoreWarehouseImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as StoreWarehouseRequestModel,
    ));
  }
}

/// @nodoc

class _$StoreWarehouseImpl implements _StoreWarehouse {
  const _$StoreWarehouseImpl(this.request);

  @override
  final StoreWarehouseRequestModel request;

  @override
  String toString() {
    return 'WarehouseEvent.storeWarehouse(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreWarehouseImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of WarehouseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreWarehouseImplCopyWith<_$StoreWarehouseImpl> get copyWith =>
      __$$StoreWarehouseImplCopyWithImpl<_$StoreWarehouseImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? search, bool? isActive)
        loadWarehouses,
    required TResult Function(int id) loadWarehouseDetail,
    required TResult Function(StoreWarehouseRequestModel request)
        storeWarehouse,
    required TResult Function(int id, UpdateWarehouseRequestModel request)
        updateWarehouse,
    required TResult Function(int id) deleteWarehouse,
  }) {
    return storeWarehouse(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? search, bool? isActive)? loadWarehouses,
    TResult? Function(int id)? loadWarehouseDetail,
    TResult? Function(StoreWarehouseRequestModel request)? storeWarehouse,
    TResult? Function(int id, UpdateWarehouseRequestModel request)?
        updateWarehouse,
    TResult? Function(int id)? deleteWarehouse,
  }) {
    return storeWarehouse?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? search, bool? isActive)? loadWarehouses,
    TResult Function(int id)? loadWarehouseDetail,
    TResult Function(StoreWarehouseRequestModel request)? storeWarehouse,
    TResult Function(int id, UpdateWarehouseRequestModel request)?
        updateWarehouse,
    TResult Function(int id)? deleteWarehouse,
    required TResult orElse(),
  }) {
    if (storeWarehouse != null) {
      return storeWarehouse(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_LoadWarehouseDetail value) loadWarehouseDetail,
    required TResult Function(_StoreWarehouse value) storeWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_DeleteWarehouse value) deleteWarehouse,
  }) {
    return storeWarehouse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_LoadWarehouseDetail value)? loadWarehouseDetail,
    TResult? Function(_StoreWarehouse value)? storeWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_DeleteWarehouse value)? deleteWarehouse,
  }) {
    return storeWarehouse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_LoadWarehouseDetail value)? loadWarehouseDetail,
    TResult Function(_StoreWarehouse value)? storeWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_DeleteWarehouse value)? deleteWarehouse,
    required TResult orElse(),
  }) {
    if (storeWarehouse != null) {
      return storeWarehouse(this);
    }
    return orElse();
  }
}

abstract class _StoreWarehouse implements WarehouseEvent {
  const factory _StoreWarehouse(final StoreWarehouseRequestModel request) =
      _$StoreWarehouseImpl;

  StoreWarehouseRequestModel get request;

  /// Create a copy of WarehouseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreWarehouseImplCopyWith<_$StoreWarehouseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateWarehouseImplCopyWith<$Res> {
  factory _$$UpdateWarehouseImplCopyWith(_$UpdateWarehouseImpl value,
          $Res Function(_$UpdateWarehouseImpl) then) =
      __$$UpdateWarehouseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, UpdateWarehouseRequestModel request});
}

/// @nodoc
class __$$UpdateWarehouseImplCopyWithImpl<$Res>
    extends _$WarehouseEventCopyWithImpl<$Res, _$UpdateWarehouseImpl>
    implements _$$UpdateWarehouseImplCopyWith<$Res> {
  __$$UpdateWarehouseImplCopyWithImpl(
      _$UpdateWarehouseImpl _value, $Res Function(_$UpdateWarehouseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WarehouseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? request = null,
  }) {
    return _then(_$UpdateWarehouseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as UpdateWarehouseRequestModel,
    ));
  }
}

/// @nodoc

class _$UpdateWarehouseImpl implements _UpdateWarehouse {
  const _$UpdateWarehouseImpl({required this.id, required this.request});

  @override
  final int id;
  @override
  final UpdateWarehouseRequestModel request;

  @override
  String toString() {
    return 'WarehouseEvent.updateWarehouse(id: $id, request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateWarehouseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, request);

  /// Create a copy of WarehouseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateWarehouseImplCopyWith<_$UpdateWarehouseImpl> get copyWith =>
      __$$UpdateWarehouseImplCopyWithImpl<_$UpdateWarehouseImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? search, bool? isActive)
        loadWarehouses,
    required TResult Function(int id) loadWarehouseDetail,
    required TResult Function(StoreWarehouseRequestModel request)
        storeWarehouse,
    required TResult Function(int id, UpdateWarehouseRequestModel request)
        updateWarehouse,
    required TResult Function(int id) deleteWarehouse,
  }) {
    return updateWarehouse(id, request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? search, bool? isActive)? loadWarehouses,
    TResult? Function(int id)? loadWarehouseDetail,
    TResult? Function(StoreWarehouseRequestModel request)? storeWarehouse,
    TResult? Function(int id, UpdateWarehouseRequestModel request)?
        updateWarehouse,
    TResult? Function(int id)? deleteWarehouse,
  }) {
    return updateWarehouse?.call(id, request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? search, bool? isActive)? loadWarehouses,
    TResult Function(int id)? loadWarehouseDetail,
    TResult Function(StoreWarehouseRequestModel request)? storeWarehouse,
    TResult Function(int id, UpdateWarehouseRequestModel request)?
        updateWarehouse,
    TResult Function(int id)? deleteWarehouse,
    required TResult orElse(),
  }) {
    if (updateWarehouse != null) {
      return updateWarehouse(id, request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_LoadWarehouseDetail value) loadWarehouseDetail,
    required TResult Function(_StoreWarehouse value) storeWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_DeleteWarehouse value) deleteWarehouse,
  }) {
    return updateWarehouse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_LoadWarehouseDetail value)? loadWarehouseDetail,
    TResult? Function(_StoreWarehouse value)? storeWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_DeleteWarehouse value)? deleteWarehouse,
  }) {
    return updateWarehouse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_LoadWarehouseDetail value)? loadWarehouseDetail,
    TResult Function(_StoreWarehouse value)? storeWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_DeleteWarehouse value)? deleteWarehouse,
    required TResult orElse(),
  }) {
    if (updateWarehouse != null) {
      return updateWarehouse(this);
    }
    return orElse();
  }
}

abstract class _UpdateWarehouse implements WarehouseEvent {
  const factory _UpdateWarehouse(
          {required final int id,
          required final UpdateWarehouseRequestModel request}) =
      _$UpdateWarehouseImpl;

  int get id;
  UpdateWarehouseRequestModel get request;

  /// Create a copy of WarehouseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateWarehouseImplCopyWith<_$UpdateWarehouseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteWarehouseImplCopyWith<$Res> {
  factory _$$DeleteWarehouseImplCopyWith(_$DeleteWarehouseImpl value,
          $Res Function(_$DeleteWarehouseImpl) then) =
      __$$DeleteWarehouseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteWarehouseImplCopyWithImpl<$Res>
    extends _$WarehouseEventCopyWithImpl<$Res, _$DeleteWarehouseImpl>
    implements _$$DeleteWarehouseImplCopyWith<$Res> {
  __$$DeleteWarehouseImplCopyWithImpl(
      _$DeleteWarehouseImpl _value, $Res Function(_$DeleteWarehouseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WarehouseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteWarehouseImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteWarehouseImpl implements _DeleteWarehouse {
  const _$DeleteWarehouseImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'WarehouseEvent.deleteWarehouse(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteWarehouseImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of WarehouseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteWarehouseImplCopyWith<_$DeleteWarehouseImpl> get copyWith =>
      __$$DeleteWarehouseImplCopyWithImpl<_$DeleteWarehouseImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? search, bool? isActive)
        loadWarehouses,
    required TResult Function(int id) loadWarehouseDetail,
    required TResult Function(StoreWarehouseRequestModel request)
        storeWarehouse,
    required TResult Function(int id, UpdateWarehouseRequestModel request)
        updateWarehouse,
    required TResult Function(int id) deleteWarehouse,
  }) {
    return deleteWarehouse(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? search, bool? isActive)? loadWarehouses,
    TResult? Function(int id)? loadWarehouseDetail,
    TResult? Function(StoreWarehouseRequestModel request)? storeWarehouse,
    TResult? Function(int id, UpdateWarehouseRequestModel request)?
        updateWarehouse,
    TResult? Function(int id)? deleteWarehouse,
  }) {
    return deleteWarehouse?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? search, bool? isActive)? loadWarehouses,
    TResult Function(int id)? loadWarehouseDetail,
    TResult Function(StoreWarehouseRequestModel request)? storeWarehouse,
    TResult Function(int id, UpdateWarehouseRequestModel request)?
        updateWarehouse,
    TResult Function(int id)? deleteWarehouse,
    required TResult orElse(),
  }) {
    if (deleteWarehouse != null) {
      return deleteWarehouse(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_LoadWarehouseDetail value) loadWarehouseDetail,
    required TResult Function(_StoreWarehouse value) storeWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_DeleteWarehouse value) deleteWarehouse,
  }) {
    return deleteWarehouse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_LoadWarehouseDetail value)? loadWarehouseDetail,
    TResult? Function(_StoreWarehouse value)? storeWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_DeleteWarehouse value)? deleteWarehouse,
  }) {
    return deleteWarehouse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_LoadWarehouseDetail value)? loadWarehouseDetail,
    TResult Function(_StoreWarehouse value)? storeWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_DeleteWarehouse value)? deleteWarehouse,
    required TResult orElse(),
  }) {
    if (deleteWarehouse != null) {
      return deleteWarehouse(this);
    }
    return orElse();
  }
}

abstract class _DeleteWarehouse implements WarehouseEvent {
  const factory _DeleteWarehouse(final int id) = _$DeleteWarehouseImpl;

  int get id;

  /// Create a copy of WarehouseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteWarehouseImplCopyWith<_$DeleteWarehouseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WarehouseState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(WarehouseListResponseModel result) listLoaded,
    required TResult Function(WarehouseResponseModel result) detailLoaded,
    required TResult Function(String message, WarehouseResponseModel? data)
        actionSuccess,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(WarehouseListResponseModel result)? listLoaded,
    TResult? Function(WarehouseResponseModel result)? detailLoaded,
    TResult? Function(String message, WarehouseResponseModel? data)?
        actionSuccess,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(WarehouseListResponseModel result)? listLoaded,
    TResult Function(WarehouseResponseModel result)? detailLoaded,
    TResult Function(String message, WarehouseResponseModel? data)?
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
abstract class $WarehouseStateCopyWith<$Res> {
  factory $WarehouseStateCopyWith(
          WarehouseState value, $Res Function(WarehouseState) then) =
      _$WarehouseStateCopyWithImpl<$Res, WarehouseState>;
}

/// @nodoc
class _$WarehouseStateCopyWithImpl<$Res, $Val extends WarehouseState>
    implements $WarehouseStateCopyWith<$Res> {
  _$WarehouseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WarehouseState
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
    extends _$WarehouseStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of WarehouseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'WarehouseState.initial()';
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
    required TResult Function(WarehouseListResponseModel result) listLoaded,
    required TResult Function(WarehouseResponseModel result) detailLoaded,
    required TResult Function(String message, WarehouseResponseModel? data)
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
    TResult? Function(WarehouseListResponseModel result)? listLoaded,
    TResult? Function(WarehouseResponseModel result)? detailLoaded,
    TResult? Function(String message, WarehouseResponseModel? data)?
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
    TResult Function(WarehouseListResponseModel result)? listLoaded,
    TResult Function(WarehouseResponseModel result)? detailLoaded,
    TResult Function(String message, WarehouseResponseModel? data)?
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

abstract class _Initial implements WarehouseState {
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
    extends _$WarehouseStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of WarehouseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'WarehouseState.loading()';
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
    required TResult Function(WarehouseListResponseModel result) listLoaded,
    required TResult Function(WarehouseResponseModel result) detailLoaded,
    required TResult Function(String message, WarehouseResponseModel? data)
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
    TResult? Function(WarehouseListResponseModel result)? listLoaded,
    TResult? Function(WarehouseResponseModel result)? detailLoaded,
    TResult? Function(String message, WarehouseResponseModel? data)?
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
    TResult Function(WarehouseListResponseModel result)? listLoaded,
    TResult Function(WarehouseResponseModel result)? detailLoaded,
    TResult Function(String message, WarehouseResponseModel? data)?
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

abstract class _Loading implements WarehouseState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ListLoadedImplCopyWith<$Res> {
  factory _$$ListLoadedImplCopyWith(
          _$ListLoadedImpl value, $Res Function(_$ListLoadedImpl) then) =
      __$$ListLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({WarehouseListResponseModel result});
}

/// @nodoc
class __$$ListLoadedImplCopyWithImpl<$Res>
    extends _$WarehouseStateCopyWithImpl<$Res, _$ListLoadedImpl>
    implements _$$ListLoadedImplCopyWith<$Res> {
  __$$ListLoadedImplCopyWithImpl(
      _$ListLoadedImpl _value, $Res Function(_$ListLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of WarehouseState
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
              as WarehouseListResponseModel,
    ));
  }
}

/// @nodoc

class _$ListLoadedImpl implements _ListLoaded {
  const _$ListLoadedImpl(this.result);

  @override
  final WarehouseListResponseModel result;

  @override
  String toString() {
    return 'WarehouseState.listLoaded(result: $result)';
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

  /// Create a copy of WarehouseState
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
    required TResult Function(WarehouseListResponseModel result) listLoaded,
    required TResult Function(WarehouseResponseModel result) detailLoaded,
    required TResult Function(String message, WarehouseResponseModel? data)
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
    TResult? Function(WarehouseListResponseModel result)? listLoaded,
    TResult? Function(WarehouseResponseModel result)? detailLoaded,
    TResult? Function(String message, WarehouseResponseModel? data)?
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
    TResult Function(WarehouseListResponseModel result)? listLoaded,
    TResult Function(WarehouseResponseModel result)? detailLoaded,
    TResult Function(String message, WarehouseResponseModel? data)?
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

abstract class _ListLoaded implements WarehouseState {
  const factory _ListLoaded(final WarehouseListResponseModel result) =
      _$ListLoadedImpl;

  WarehouseListResponseModel get result;

  /// Create a copy of WarehouseState
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
  $Res call({WarehouseResponseModel result});
}

/// @nodoc
class __$$DetailLoadedImplCopyWithImpl<$Res>
    extends _$WarehouseStateCopyWithImpl<$Res, _$DetailLoadedImpl>
    implements _$$DetailLoadedImplCopyWith<$Res> {
  __$$DetailLoadedImplCopyWithImpl(
      _$DetailLoadedImpl _value, $Res Function(_$DetailLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of WarehouseState
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
              as WarehouseResponseModel,
    ));
  }
}

/// @nodoc

class _$DetailLoadedImpl implements _DetailLoaded {
  const _$DetailLoadedImpl(this.result);

  @override
  final WarehouseResponseModel result;

  @override
  String toString() {
    return 'WarehouseState.detailLoaded(result: $result)';
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

  /// Create a copy of WarehouseState
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
    required TResult Function(WarehouseListResponseModel result) listLoaded,
    required TResult Function(WarehouseResponseModel result) detailLoaded,
    required TResult Function(String message, WarehouseResponseModel? data)
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
    TResult? Function(WarehouseListResponseModel result)? listLoaded,
    TResult? Function(WarehouseResponseModel result)? detailLoaded,
    TResult? Function(String message, WarehouseResponseModel? data)?
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
    TResult Function(WarehouseListResponseModel result)? listLoaded,
    TResult Function(WarehouseResponseModel result)? detailLoaded,
    TResult Function(String message, WarehouseResponseModel? data)?
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

abstract class _DetailLoaded implements WarehouseState {
  const factory _DetailLoaded(final WarehouseResponseModel result) =
      _$DetailLoadedImpl;

  WarehouseResponseModel get result;

  /// Create a copy of WarehouseState
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
  $Res call({String message, WarehouseResponseModel? data});
}

/// @nodoc
class __$$ActionSuccessImplCopyWithImpl<$Res>
    extends _$WarehouseStateCopyWithImpl<$Res, _$ActionSuccessImpl>
    implements _$$ActionSuccessImplCopyWith<$Res> {
  __$$ActionSuccessImplCopyWithImpl(
      _$ActionSuccessImpl _value, $Res Function(_$ActionSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of WarehouseState
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
              as WarehouseResponseModel?,
    ));
  }
}

/// @nodoc

class _$ActionSuccessImpl implements _ActionSuccess {
  const _$ActionSuccessImpl(this.message, this.data);

  @override
  final String message;
  @override
  final WarehouseResponseModel? data;

  @override
  String toString() {
    return 'WarehouseState.actionSuccess(message: $message, data: $data)';
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

  /// Create a copy of WarehouseState
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
    required TResult Function(WarehouseListResponseModel result) listLoaded,
    required TResult Function(WarehouseResponseModel result) detailLoaded,
    required TResult Function(String message, WarehouseResponseModel? data)
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
    TResult? Function(WarehouseListResponseModel result)? listLoaded,
    TResult? Function(WarehouseResponseModel result)? detailLoaded,
    TResult? Function(String message, WarehouseResponseModel? data)?
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
    TResult Function(WarehouseListResponseModel result)? listLoaded,
    TResult Function(WarehouseResponseModel result)? detailLoaded,
    TResult Function(String message, WarehouseResponseModel? data)?
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

abstract class _ActionSuccess implements WarehouseState {
  const factory _ActionSuccess(
          final String message, final WarehouseResponseModel? data) =
      _$ActionSuccessImpl;

  String get message;
  WarehouseResponseModel? get data;

  /// Create a copy of WarehouseState
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
    extends _$WarehouseStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of WarehouseState
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
    return 'WarehouseState.error(message: $message)';
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

  /// Create a copy of WarehouseState
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
    required TResult Function(WarehouseListResponseModel result) listLoaded,
    required TResult Function(WarehouseResponseModel result) detailLoaded,
    required TResult Function(String message, WarehouseResponseModel? data)
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
    TResult? Function(WarehouseListResponseModel result)? listLoaded,
    TResult? Function(WarehouseResponseModel result)? detailLoaded,
    TResult? Function(String message, WarehouseResponseModel? data)?
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
    TResult Function(WarehouseListResponseModel result)? listLoaded,
    TResult Function(WarehouseResponseModel result)? detailLoaded,
    TResult Function(String message, WarehouseResponseModel? data)?
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

abstract class _Error implements WarehouseState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of WarehouseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
