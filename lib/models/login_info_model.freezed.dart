// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginInfoModel {
  @JsonKey(name: 'user_info')
  UserInfoModel get userInfo;
  @JsonKey(name: 'token')
  String get token;

  /// Create a copy of LoginInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginInfoModelCopyWith<LoginInfoModel> get copyWith =>
      _$LoginInfoModelCopyWithImpl<LoginInfoModel>(
          this as LoginInfoModel, _$identity);

  /// Serializes this LoginInfoModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginInfoModel &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userInfo, token);

  @override
  String toString() {
    return 'LoginInfoModel(userInfo: $userInfo, token: $token)';
  }
}

/// @nodoc
abstract mixin class $LoginInfoModelCopyWith<$Res> {
  factory $LoginInfoModelCopyWith(
          LoginInfoModel value, $Res Function(LoginInfoModel) _then) =
      _$LoginInfoModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_info') UserInfoModel userInfo,
      @JsonKey(name: 'token') String token});

  $UserInfoModelCopyWith<$Res> get userInfo;
}

/// @nodoc
class _$LoginInfoModelCopyWithImpl<$Res>
    implements $LoginInfoModelCopyWith<$Res> {
  _$LoginInfoModelCopyWithImpl(this._self, this._then);

  final LoginInfoModel _self;
  final $Res Function(LoginInfoModel) _then;

  /// Create a copy of LoginInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userInfo = null,
    Object? token = null,
  }) {
    return _then(_self.copyWith(
      userInfo: null == userInfo
          ? _self.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfoModel,
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of LoginInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoModelCopyWith<$Res> get userInfo {
    return $UserInfoModelCopyWith<$Res>(_self.userInfo, (value) {
      return _then(_self.copyWith(userInfo: value));
    });
  }
}

/// Adds pattern-matching-related methods to [LoginInfoModel].
extension LoginInfoModelPatterns on LoginInfoModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LoginInfoModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginInfoModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LoginInfoModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginInfoModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LoginInfoModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginInfoModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'user_info') UserInfoModel userInfo,
            @JsonKey(name: 'token') String token)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginInfoModel() when $default != null:
        return $default(_that.userInfo, _that.token);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'user_info') UserInfoModel userInfo,
            @JsonKey(name: 'token') String token)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginInfoModel():
        return $default(_that.userInfo, _that.token);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@JsonKey(name: 'user_info') UserInfoModel userInfo,
            @JsonKey(name: 'token') String token)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginInfoModel() when $default != null:
        return $default(_that.userInfo, _that.token);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LoginInfoModel implements LoginInfoModel {
  const _LoginInfoModel(
      {@JsonKey(name: 'user_info') this.userInfo = const UserInfoModel(),
      @JsonKey(name: 'token') this.token = ''});
  factory _LoginInfoModel.fromJson(Map<String, dynamic> json) =>
      _$LoginInfoModelFromJson(json);

  @override
  @JsonKey(name: 'user_info')
  final UserInfoModel userInfo;
  @override
  @JsonKey(name: 'token')
  final String token;

  /// Create a copy of LoginInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginInfoModelCopyWith<_LoginInfoModel> get copyWith =>
      __$LoginInfoModelCopyWithImpl<_LoginInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoginInfoModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginInfoModel &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userInfo, token);

  @override
  String toString() {
    return 'LoginInfoModel(userInfo: $userInfo, token: $token)';
  }
}

/// @nodoc
abstract mixin class _$LoginInfoModelCopyWith<$Res>
    implements $LoginInfoModelCopyWith<$Res> {
  factory _$LoginInfoModelCopyWith(
          _LoginInfoModel value, $Res Function(_LoginInfoModel) _then) =
      __$LoginInfoModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_info') UserInfoModel userInfo,
      @JsonKey(name: 'token') String token});

  @override
  $UserInfoModelCopyWith<$Res> get userInfo;
}

/// @nodoc
class __$LoginInfoModelCopyWithImpl<$Res>
    implements _$LoginInfoModelCopyWith<$Res> {
  __$LoginInfoModelCopyWithImpl(this._self, this._then);

  final _LoginInfoModel _self;
  final $Res Function(_LoginInfoModel) _then;

  /// Create a copy of LoginInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userInfo = null,
    Object? token = null,
  }) {
    return _then(_LoginInfoModel(
      userInfo: null == userInfo
          ? _self.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfoModel,
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of LoginInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoModelCopyWith<$Res> get userInfo {
    return $UserInfoModelCopyWith<$Res>(_self.userInfo, (value) {
      return _then(_self.copyWith(userInfo: value));
    });
  }
}

// dart format on
