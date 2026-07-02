// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_budget_request_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminBudgetRequestEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status, String? jenis,
            String? urgensi, String? divisi, String? dateFrom, String? dateTo)
        getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(int id, ApproveBudgetRequestModel request)
        approve,
    required TResult Function(int id, RejectBudgetRequestModel request) reject,
    required TResult Function(int id, TundaBudgetRequestModel request) tunda,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status, String? jenis, String? urgensi,
            String? divisi, String? dateFrom, String? dateTo)?
        getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(int id, ApproveBudgetRequestModel request)? approve,
    TResult? Function(int id, RejectBudgetRequestModel request)? reject,
    TResult? Function(int id, TundaBudgetRequestModel request)? tunda,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status, String? jenis, String? urgensi,
            String? divisi, String? dateFrom, String? dateTo)?
        getAll,
    TResult Function(int id)? getDetail,
    TResult Function(int id, ApproveBudgetRequestModel request)? approve,
    TResult Function(int id, RejectBudgetRequestModel request)? reject,
    TResult Function(int id, TundaBudgetRequestModel request)? tunda,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AdminBudgetRequestGetAll value) getAll,
    required TResult Function(AdminBudgetRequestGetDetail value) getDetail,
    required TResult Function(AdminBudgetRequestApprove value) approve,
    required TResult Function(AdminBudgetRequestReject value) reject,
    required TResult Function(AdminBudgetRequestTunda value) tunda,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdminBudgetRequestGetAll value)? getAll,
    TResult? Function(AdminBudgetRequestGetDetail value)? getDetail,
    TResult? Function(AdminBudgetRequestApprove value)? approve,
    TResult? Function(AdminBudgetRequestReject value)? reject,
    TResult? Function(AdminBudgetRequestTunda value)? tunda,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdminBudgetRequestGetAll value)? getAll,
    TResult Function(AdminBudgetRequestGetDetail value)? getDetail,
    TResult Function(AdminBudgetRequestApprove value)? approve,
    TResult Function(AdminBudgetRequestReject value)? reject,
    TResult Function(AdminBudgetRequestTunda value)? tunda,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminBudgetRequestEventCopyWith<$Res> {
  factory $AdminBudgetRequestEventCopyWith(AdminBudgetRequestEvent value,
          $Res Function(AdminBudgetRequestEvent) then) =
      _$AdminBudgetRequestEventCopyWithImpl<$Res, AdminBudgetRequestEvent>;
}

/// @nodoc
class _$AdminBudgetRequestEventCopyWithImpl<$Res,
        $Val extends AdminBudgetRequestEvent>
    implements $AdminBudgetRequestEventCopyWith<$Res> {
  _$AdminBudgetRequestEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AdminBudgetRequestGetAllImplCopyWith<$Res> {
  factory _$$AdminBudgetRequestGetAllImplCopyWith(
          _$AdminBudgetRequestGetAllImpl value,
          $Res Function(_$AdminBudgetRequestGetAllImpl) then) =
      __$$AdminBudgetRequestGetAllImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int page,
      String? status,
      String? jenis,
      String? urgensi,
      String? divisi,
      String? dateFrom,
      String? dateTo});
}

/// @nodoc
class __$$AdminBudgetRequestGetAllImplCopyWithImpl<$Res>
    extends _$AdminBudgetRequestEventCopyWithImpl<$Res,
        _$AdminBudgetRequestGetAllImpl>
    implements _$$AdminBudgetRequestGetAllImplCopyWith<$Res> {
  __$$AdminBudgetRequestGetAllImplCopyWithImpl(
      _$AdminBudgetRequestGetAllImpl _value,
      $Res Function(_$AdminBudgetRequestGetAllImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? status = freezed,
    Object? jenis = freezed,
    Object? urgensi = freezed,
    Object? divisi = freezed,
    Object? dateFrom = freezed,
    Object? dateTo = freezed,
  }) {
    return _then(_$AdminBudgetRequestGetAllImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      jenis: freezed == jenis
          ? _value.jenis
          : jenis // ignore: cast_nullable_to_non_nullable
              as String?,
      urgensi: freezed == urgensi
          ? _value.urgensi
          : urgensi // ignore: cast_nullable_to_non_nullable
              as String?,
      divisi: freezed == divisi
          ? _value.divisi
          : divisi // ignore: cast_nullable_to_non_nullable
              as String?,
      dateFrom: freezed == dateFrom
          ? _value.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTo: freezed == dateTo
          ? _value.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AdminBudgetRequestGetAllImpl implements AdminBudgetRequestGetAll {
  const _$AdminBudgetRequestGetAllImpl(
      {this.page = 1,
      this.status,
      this.jenis,
      this.urgensi,
      this.divisi,
      this.dateFrom,
      this.dateTo});

  @override
  @JsonKey()
  final int page;
  @override
  final String? status;
  @override
  final String? jenis;
  @override
  final String? urgensi;
  @override
  final String? divisi;
  @override
  final String? dateFrom;
  @override
  final String? dateTo;

  @override
  String toString() {
    return 'AdminBudgetRequestEvent.getAll(page: $page, status: $status, jenis: $jenis, urgensi: $urgensi, divisi: $divisi, dateFrom: $dateFrom, dateTo: $dateTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminBudgetRequestGetAllImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.jenis, jenis) || other.jenis == jenis) &&
            (identical(other.urgensi, urgensi) || other.urgensi == urgensi) &&
            (identical(other.divisi, divisi) || other.divisi == divisi) &&
            (identical(other.dateFrom, dateFrom) ||
                other.dateFrom == dateFrom) &&
            (identical(other.dateTo, dateTo) || other.dateTo == dateTo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, page, status, jenis, urgensi, divisi, dateFrom, dateTo);

  /// Create a copy of AdminBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminBudgetRequestGetAllImplCopyWith<_$AdminBudgetRequestGetAllImpl>
      get copyWith => __$$AdminBudgetRequestGetAllImplCopyWithImpl<
          _$AdminBudgetRequestGetAllImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status, String? jenis,
            String? urgensi, String? divisi, String? dateFrom, String? dateTo)
        getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(int id, ApproveBudgetRequestModel request)
        approve,
    required TResult Function(int id, RejectBudgetRequestModel request) reject,
    required TResult Function(int id, TundaBudgetRequestModel request) tunda,
  }) {
    return getAll(page, status, jenis, urgensi, divisi, dateFrom, dateTo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status, String? jenis, String? urgensi,
            String? divisi, String? dateFrom, String? dateTo)?
        getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(int id, ApproveBudgetRequestModel request)? approve,
    TResult? Function(int id, RejectBudgetRequestModel request)? reject,
    TResult? Function(int id, TundaBudgetRequestModel request)? tunda,
  }) {
    return getAll?.call(page, status, jenis, urgensi, divisi, dateFrom, dateTo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status, String? jenis, String? urgensi,
            String? divisi, String? dateFrom, String? dateTo)?
        getAll,
    TResult Function(int id)? getDetail,
    TResult Function(int id, ApproveBudgetRequestModel request)? approve,
    TResult Function(int id, RejectBudgetRequestModel request)? reject,
    TResult Function(int id, TundaBudgetRequestModel request)? tunda,
    required TResult orElse(),
  }) {
    if (getAll != null) {
      return getAll(page, status, jenis, urgensi, divisi, dateFrom, dateTo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AdminBudgetRequestGetAll value) getAll,
    required TResult Function(AdminBudgetRequestGetDetail value) getDetail,
    required TResult Function(AdminBudgetRequestApprove value) approve,
    required TResult Function(AdminBudgetRequestReject value) reject,
    required TResult Function(AdminBudgetRequestTunda value) tunda,
  }) {
    return getAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdminBudgetRequestGetAll value)? getAll,
    TResult? Function(AdminBudgetRequestGetDetail value)? getDetail,
    TResult? Function(AdminBudgetRequestApprove value)? approve,
    TResult? Function(AdminBudgetRequestReject value)? reject,
    TResult? Function(AdminBudgetRequestTunda value)? tunda,
  }) {
    return getAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdminBudgetRequestGetAll value)? getAll,
    TResult Function(AdminBudgetRequestGetDetail value)? getDetail,
    TResult Function(AdminBudgetRequestApprove value)? approve,
    TResult Function(AdminBudgetRequestReject value)? reject,
    TResult Function(AdminBudgetRequestTunda value)? tunda,
    required TResult orElse(),
  }) {
    if (getAll != null) {
      return getAll(this);
    }
    return orElse();
  }
}

abstract class AdminBudgetRequestGetAll implements AdminBudgetRequestEvent {
  const factory AdminBudgetRequestGetAll(
      {final int page,
      final String? status,
      final String? jenis,
      final String? urgensi,
      final String? divisi,
      final String? dateFrom,
      final String? dateTo}) = _$AdminBudgetRequestGetAllImpl;

  int get page;
  String? get status;
  String? get jenis;
  String? get urgensi;
  String? get divisi;
  String? get dateFrom;
  String? get dateTo;

  /// Create a copy of AdminBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminBudgetRequestGetAllImplCopyWith<_$AdminBudgetRequestGetAllImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdminBudgetRequestGetDetailImplCopyWith<$Res> {
  factory _$$AdminBudgetRequestGetDetailImplCopyWith(
          _$AdminBudgetRequestGetDetailImpl value,
          $Res Function(_$AdminBudgetRequestGetDetailImpl) then) =
      __$$AdminBudgetRequestGetDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$AdminBudgetRequestGetDetailImplCopyWithImpl<$Res>
    extends _$AdminBudgetRequestEventCopyWithImpl<$Res,
        _$AdminBudgetRequestGetDetailImpl>
    implements _$$AdminBudgetRequestGetDetailImplCopyWith<$Res> {
  __$$AdminBudgetRequestGetDetailImplCopyWithImpl(
      _$AdminBudgetRequestGetDetailImpl _value,
      $Res Function(_$AdminBudgetRequestGetDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$AdminBudgetRequestGetDetailImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AdminBudgetRequestGetDetailImpl implements AdminBudgetRequestGetDetail {
  const _$AdminBudgetRequestGetDetailImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'AdminBudgetRequestEvent.getDetail(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminBudgetRequestGetDetailImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of AdminBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminBudgetRequestGetDetailImplCopyWith<_$AdminBudgetRequestGetDetailImpl>
      get copyWith => __$$AdminBudgetRequestGetDetailImplCopyWithImpl<
          _$AdminBudgetRequestGetDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status, String? jenis,
            String? urgensi, String? divisi, String? dateFrom, String? dateTo)
        getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(int id, ApproveBudgetRequestModel request)
        approve,
    required TResult Function(int id, RejectBudgetRequestModel request) reject,
    required TResult Function(int id, TundaBudgetRequestModel request) tunda,
  }) {
    return getDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status, String? jenis, String? urgensi,
            String? divisi, String? dateFrom, String? dateTo)?
        getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(int id, ApproveBudgetRequestModel request)? approve,
    TResult? Function(int id, RejectBudgetRequestModel request)? reject,
    TResult? Function(int id, TundaBudgetRequestModel request)? tunda,
  }) {
    return getDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status, String? jenis, String? urgensi,
            String? divisi, String? dateFrom, String? dateTo)?
        getAll,
    TResult Function(int id)? getDetail,
    TResult Function(int id, ApproveBudgetRequestModel request)? approve,
    TResult Function(int id, RejectBudgetRequestModel request)? reject,
    TResult Function(int id, TundaBudgetRequestModel request)? tunda,
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
    required TResult Function(AdminBudgetRequestGetAll value) getAll,
    required TResult Function(AdminBudgetRequestGetDetail value) getDetail,
    required TResult Function(AdminBudgetRequestApprove value) approve,
    required TResult Function(AdminBudgetRequestReject value) reject,
    required TResult Function(AdminBudgetRequestTunda value) tunda,
  }) {
    return getDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdminBudgetRequestGetAll value)? getAll,
    TResult? Function(AdminBudgetRequestGetDetail value)? getDetail,
    TResult? Function(AdminBudgetRequestApprove value)? approve,
    TResult? Function(AdminBudgetRequestReject value)? reject,
    TResult? Function(AdminBudgetRequestTunda value)? tunda,
  }) {
    return getDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdminBudgetRequestGetAll value)? getAll,
    TResult Function(AdminBudgetRequestGetDetail value)? getDetail,
    TResult Function(AdminBudgetRequestApprove value)? approve,
    TResult Function(AdminBudgetRequestReject value)? reject,
    TResult Function(AdminBudgetRequestTunda value)? tunda,
    required TResult orElse(),
  }) {
    if (getDetail != null) {
      return getDetail(this);
    }
    return orElse();
  }
}

abstract class AdminBudgetRequestGetDetail implements AdminBudgetRequestEvent {
  const factory AdminBudgetRequestGetDetail(final int id) =
      _$AdminBudgetRequestGetDetailImpl;

  int get id;

  /// Create a copy of AdminBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminBudgetRequestGetDetailImplCopyWith<_$AdminBudgetRequestGetDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdminBudgetRequestApproveImplCopyWith<$Res> {
  factory _$$AdminBudgetRequestApproveImplCopyWith(
          _$AdminBudgetRequestApproveImpl value,
          $Res Function(_$AdminBudgetRequestApproveImpl) then) =
      __$$AdminBudgetRequestApproveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, ApproveBudgetRequestModel request});
}

/// @nodoc
class __$$AdminBudgetRequestApproveImplCopyWithImpl<$Res>
    extends _$AdminBudgetRequestEventCopyWithImpl<$Res,
        _$AdminBudgetRequestApproveImpl>
    implements _$$AdminBudgetRequestApproveImplCopyWith<$Res> {
  __$$AdminBudgetRequestApproveImplCopyWithImpl(
      _$AdminBudgetRequestApproveImpl _value,
      $Res Function(_$AdminBudgetRequestApproveImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? request = null,
  }) {
    return _then(_$AdminBudgetRequestApproveImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as ApproveBudgetRequestModel,
    ));
  }
}

/// @nodoc

class _$AdminBudgetRequestApproveImpl implements AdminBudgetRequestApprove {
  const _$AdminBudgetRequestApproveImpl(
      {required this.id, required this.request});

  @override
  final int id;
  @override
  final ApproveBudgetRequestModel request;

  @override
  String toString() {
    return 'AdminBudgetRequestEvent.approve(id: $id, request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminBudgetRequestApproveImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, request);

  /// Create a copy of AdminBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminBudgetRequestApproveImplCopyWith<_$AdminBudgetRequestApproveImpl>
      get copyWith => __$$AdminBudgetRequestApproveImplCopyWithImpl<
          _$AdminBudgetRequestApproveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status, String? jenis,
            String? urgensi, String? divisi, String? dateFrom, String? dateTo)
        getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(int id, ApproveBudgetRequestModel request)
        approve,
    required TResult Function(int id, RejectBudgetRequestModel request) reject,
    required TResult Function(int id, TundaBudgetRequestModel request) tunda,
  }) {
    return approve(id, request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status, String? jenis, String? urgensi,
            String? divisi, String? dateFrom, String? dateTo)?
        getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(int id, ApproveBudgetRequestModel request)? approve,
    TResult? Function(int id, RejectBudgetRequestModel request)? reject,
    TResult? Function(int id, TundaBudgetRequestModel request)? tunda,
  }) {
    return approve?.call(id, request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status, String? jenis, String? urgensi,
            String? divisi, String? dateFrom, String? dateTo)?
        getAll,
    TResult Function(int id)? getDetail,
    TResult Function(int id, ApproveBudgetRequestModel request)? approve,
    TResult Function(int id, RejectBudgetRequestModel request)? reject,
    TResult Function(int id, TundaBudgetRequestModel request)? tunda,
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
    required TResult Function(AdminBudgetRequestGetAll value) getAll,
    required TResult Function(AdminBudgetRequestGetDetail value) getDetail,
    required TResult Function(AdminBudgetRequestApprove value) approve,
    required TResult Function(AdminBudgetRequestReject value) reject,
    required TResult Function(AdminBudgetRequestTunda value) tunda,
  }) {
    return approve(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdminBudgetRequestGetAll value)? getAll,
    TResult? Function(AdminBudgetRequestGetDetail value)? getDetail,
    TResult? Function(AdminBudgetRequestApprove value)? approve,
    TResult? Function(AdminBudgetRequestReject value)? reject,
    TResult? Function(AdminBudgetRequestTunda value)? tunda,
  }) {
    return approve?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdminBudgetRequestGetAll value)? getAll,
    TResult Function(AdminBudgetRequestGetDetail value)? getDetail,
    TResult Function(AdminBudgetRequestApprove value)? approve,
    TResult Function(AdminBudgetRequestReject value)? reject,
    TResult Function(AdminBudgetRequestTunda value)? tunda,
    required TResult orElse(),
  }) {
    if (approve != null) {
      return approve(this);
    }
    return orElse();
  }
}

abstract class AdminBudgetRequestApprove implements AdminBudgetRequestEvent {
  const factory AdminBudgetRequestApprove(
          {required final int id,
          required final ApproveBudgetRequestModel request}) =
      _$AdminBudgetRequestApproveImpl;

  int get id;
  ApproveBudgetRequestModel get request;

  /// Create a copy of AdminBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminBudgetRequestApproveImplCopyWith<_$AdminBudgetRequestApproveImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdminBudgetRequestRejectImplCopyWith<$Res> {
  factory _$$AdminBudgetRequestRejectImplCopyWith(
          _$AdminBudgetRequestRejectImpl value,
          $Res Function(_$AdminBudgetRequestRejectImpl) then) =
      __$$AdminBudgetRequestRejectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, RejectBudgetRequestModel request});
}

/// @nodoc
class __$$AdminBudgetRequestRejectImplCopyWithImpl<$Res>
    extends _$AdminBudgetRequestEventCopyWithImpl<$Res,
        _$AdminBudgetRequestRejectImpl>
    implements _$$AdminBudgetRequestRejectImplCopyWith<$Res> {
  __$$AdminBudgetRequestRejectImplCopyWithImpl(
      _$AdminBudgetRequestRejectImpl _value,
      $Res Function(_$AdminBudgetRequestRejectImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? request = null,
  }) {
    return _then(_$AdminBudgetRequestRejectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RejectBudgetRequestModel,
    ));
  }
}

/// @nodoc

class _$AdminBudgetRequestRejectImpl implements AdminBudgetRequestReject {
  const _$AdminBudgetRequestRejectImpl(
      {required this.id, required this.request});

  @override
  final int id;
  @override
  final RejectBudgetRequestModel request;

  @override
  String toString() {
    return 'AdminBudgetRequestEvent.reject(id: $id, request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminBudgetRequestRejectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, request);

  /// Create a copy of AdminBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminBudgetRequestRejectImplCopyWith<_$AdminBudgetRequestRejectImpl>
      get copyWith => __$$AdminBudgetRequestRejectImplCopyWithImpl<
          _$AdminBudgetRequestRejectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status, String? jenis,
            String? urgensi, String? divisi, String? dateFrom, String? dateTo)
        getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(int id, ApproveBudgetRequestModel request)
        approve,
    required TResult Function(int id, RejectBudgetRequestModel request) reject,
    required TResult Function(int id, TundaBudgetRequestModel request) tunda,
  }) {
    return reject(id, request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status, String? jenis, String? urgensi,
            String? divisi, String? dateFrom, String? dateTo)?
        getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(int id, ApproveBudgetRequestModel request)? approve,
    TResult? Function(int id, RejectBudgetRequestModel request)? reject,
    TResult? Function(int id, TundaBudgetRequestModel request)? tunda,
  }) {
    return reject?.call(id, request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status, String? jenis, String? urgensi,
            String? divisi, String? dateFrom, String? dateTo)?
        getAll,
    TResult Function(int id)? getDetail,
    TResult Function(int id, ApproveBudgetRequestModel request)? approve,
    TResult Function(int id, RejectBudgetRequestModel request)? reject,
    TResult Function(int id, TundaBudgetRequestModel request)? tunda,
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
    required TResult Function(AdminBudgetRequestGetAll value) getAll,
    required TResult Function(AdminBudgetRequestGetDetail value) getDetail,
    required TResult Function(AdminBudgetRequestApprove value) approve,
    required TResult Function(AdminBudgetRequestReject value) reject,
    required TResult Function(AdminBudgetRequestTunda value) tunda,
  }) {
    return reject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdminBudgetRequestGetAll value)? getAll,
    TResult? Function(AdminBudgetRequestGetDetail value)? getDetail,
    TResult? Function(AdminBudgetRequestApprove value)? approve,
    TResult? Function(AdminBudgetRequestReject value)? reject,
    TResult? Function(AdminBudgetRequestTunda value)? tunda,
  }) {
    return reject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdminBudgetRequestGetAll value)? getAll,
    TResult Function(AdminBudgetRequestGetDetail value)? getDetail,
    TResult Function(AdminBudgetRequestApprove value)? approve,
    TResult Function(AdminBudgetRequestReject value)? reject,
    TResult Function(AdminBudgetRequestTunda value)? tunda,
    required TResult orElse(),
  }) {
    if (reject != null) {
      return reject(this);
    }
    return orElse();
  }
}

abstract class AdminBudgetRequestReject implements AdminBudgetRequestEvent {
  const factory AdminBudgetRequestReject(
          {required final int id,
          required final RejectBudgetRequestModel request}) =
      _$AdminBudgetRequestRejectImpl;

  int get id;
  RejectBudgetRequestModel get request;

  /// Create a copy of AdminBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminBudgetRequestRejectImplCopyWith<_$AdminBudgetRequestRejectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdminBudgetRequestTundaImplCopyWith<$Res> {
  factory _$$AdminBudgetRequestTundaImplCopyWith(
          _$AdminBudgetRequestTundaImpl value,
          $Res Function(_$AdminBudgetRequestTundaImpl) then) =
      __$$AdminBudgetRequestTundaImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, TundaBudgetRequestModel request});
}

/// @nodoc
class __$$AdminBudgetRequestTundaImplCopyWithImpl<$Res>
    extends _$AdminBudgetRequestEventCopyWithImpl<$Res,
        _$AdminBudgetRequestTundaImpl>
    implements _$$AdminBudgetRequestTundaImplCopyWith<$Res> {
  __$$AdminBudgetRequestTundaImplCopyWithImpl(
      _$AdminBudgetRequestTundaImpl _value,
      $Res Function(_$AdminBudgetRequestTundaImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? request = null,
  }) {
    return _then(_$AdminBudgetRequestTundaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as TundaBudgetRequestModel,
    ));
  }
}

/// @nodoc

class _$AdminBudgetRequestTundaImpl implements AdminBudgetRequestTunda {
  const _$AdminBudgetRequestTundaImpl(
      {required this.id, required this.request});

  @override
  final int id;
  @override
  final TundaBudgetRequestModel request;

  @override
  String toString() {
    return 'AdminBudgetRequestEvent.tunda(id: $id, request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminBudgetRequestTundaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, request);

  /// Create a copy of AdminBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminBudgetRequestTundaImplCopyWith<_$AdminBudgetRequestTundaImpl>
      get copyWith => __$$AdminBudgetRequestTundaImplCopyWithImpl<
          _$AdminBudgetRequestTundaImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, String? status, String? jenis,
            String? urgensi, String? divisi, String? dateFrom, String? dateTo)
        getAll,
    required TResult Function(int id) getDetail,
    required TResult Function(int id, ApproveBudgetRequestModel request)
        approve,
    required TResult Function(int id, RejectBudgetRequestModel request) reject,
    required TResult Function(int id, TundaBudgetRequestModel request) tunda,
  }) {
    return tunda(id, request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, String? status, String? jenis, String? urgensi,
            String? divisi, String? dateFrom, String? dateTo)?
        getAll,
    TResult? Function(int id)? getDetail,
    TResult? Function(int id, ApproveBudgetRequestModel request)? approve,
    TResult? Function(int id, RejectBudgetRequestModel request)? reject,
    TResult? Function(int id, TundaBudgetRequestModel request)? tunda,
  }) {
    return tunda?.call(id, request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, String? status, String? jenis, String? urgensi,
            String? divisi, String? dateFrom, String? dateTo)?
        getAll,
    TResult Function(int id)? getDetail,
    TResult Function(int id, ApproveBudgetRequestModel request)? approve,
    TResult Function(int id, RejectBudgetRequestModel request)? reject,
    TResult Function(int id, TundaBudgetRequestModel request)? tunda,
    required TResult orElse(),
  }) {
    if (tunda != null) {
      return tunda(id, request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AdminBudgetRequestGetAll value) getAll,
    required TResult Function(AdminBudgetRequestGetDetail value) getDetail,
    required TResult Function(AdminBudgetRequestApprove value) approve,
    required TResult Function(AdminBudgetRequestReject value) reject,
    required TResult Function(AdminBudgetRequestTunda value) tunda,
  }) {
    return tunda(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdminBudgetRequestGetAll value)? getAll,
    TResult? Function(AdminBudgetRequestGetDetail value)? getDetail,
    TResult? Function(AdminBudgetRequestApprove value)? approve,
    TResult? Function(AdminBudgetRequestReject value)? reject,
    TResult? Function(AdminBudgetRequestTunda value)? tunda,
  }) {
    return tunda?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdminBudgetRequestGetAll value)? getAll,
    TResult Function(AdminBudgetRequestGetDetail value)? getDetail,
    TResult Function(AdminBudgetRequestApprove value)? approve,
    TResult Function(AdminBudgetRequestReject value)? reject,
    TResult Function(AdminBudgetRequestTunda value)? tunda,
    required TResult orElse(),
  }) {
    if (tunda != null) {
      return tunda(this);
    }
    return orElse();
  }
}

abstract class AdminBudgetRequestTunda implements AdminBudgetRequestEvent {
  const factory AdminBudgetRequestTunda(
          {required final int id,
          required final TundaBudgetRequestModel request}) =
      _$AdminBudgetRequestTundaImpl;

  int get id;
  TundaBudgetRequestModel get request;

  /// Create a copy of AdminBudgetRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminBudgetRequestTundaImplCopyWith<_$AdminBudgetRequestTundaImpl>
      get copyWith => throw _privateConstructorUsedError;
}
