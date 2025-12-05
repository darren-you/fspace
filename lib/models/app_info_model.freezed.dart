// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppInfoModel {
  String get packageName; // 包名
  String get appVersion; // App版本号
  String get deviceId; // 设备唯一标识
  String get deviceModel; // 设备平台: Android、iOS...
  String get systemVersion; // 系统版本
  bool get firstLaunch;

  /// Create a copy of AppInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppInfoModelCopyWith<AppInfoModel> get copyWith =>
      _$AppInfoModelCopyWithImpl<AppInfoModel>(
          this as AppInfoModel, _$identity);

  /// Serializes this AppInfoModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppInfoModel &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceModel, deviceModel) ||
                other.deviceModel == deviceModel) &&
            (identical(other.systemVersion, systemVersion) ||
                other.systemVersion == systemVersion) &&
            (identical(other.firstLaunch, firstLaunch) ||
                other.firstLaunch == firstLaunch));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, packageName, appVersion,
      deviceId, deviceModel, systemVersion, firstLaunch);

  @override
  String toString() {
    return 'AppInfoModel(packageName: $packageName, appVersion: $appVersion, deviceId: $deviceId, deviceModel: $deviceModel, systemVersion: $systemVersion, firstLaunch: $firstLaunch)';
  }
}

/// @nodoc
abstract mixin class $AppInfoModelCopyWith<$Res> {
  factory $AppInfoModelCopyWith(
          AppInfoModel value, $Res Function(AppInfoModel) _then) =
      _$AppInfoModelCopyWithImpl;
  @useResult
  $Res call(
      {String packageName,
      String appVersion,
      String deviceId,
      String deviceModel,
      String systemVersion,
      bool firstLaunch});
}

/// @nodoc
class _$AppInfoModelCopyWithImpl<$Res> implements $AppInfoModelCopyWith<$Res> {
  _$AppInfoModelCopyWithImpl(this._self, this._then);

  final AppInfoModel _self;
  final $Res Function(AppInfoModel) _then;

  /// Create a copy of AppInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageName = null,
    Object? appVersion = null,
    Object? deviceId = null,
    Object? deviceModel = null,
    Object? systemVersion = null,
    Object? firstLaunch = null,
  }) {
    return _then(_self.copyWith(
      packageName: null == packageName
          ? _self.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      appVersion: null == appVersion
          ? _self.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _self.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceModel: null == deviceModel
          ? _self.deviceModel
          : deviceModel // ignore: cast_nullable_to_non_nullable
              as String,
      systemVersion: null == systemVersion
          ? _self.systemVersion
          : systemVersion // ignore: cast_nullable_to_non_nullable
              as String,
      firstLaunch: null == firstLaunch
          ? _self.firstLaunch
          : firstLaunch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [AppInfoModel].
extension AppInfoModelPatterns on AppInfoModel {
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
    TResult Function(_AppInfoModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppInfoModel() when $default != null:
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
    TResult Function(_AppInfoModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppInfoModel():
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
    TResult? Function(_AppInfoModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppInfoModel() when $default != null:
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
    TResult Function(String packageName, String appVersion, String deviceId,
            String deviceModel, String systemVersion, bool firstLaunch)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppInfoModel() when $default != null:
        return $default(_that.packageName, _that.appVersion, _that.deviceId,
            _that.deviceModel, _that.systemVersion, _that.firstLaunch);
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
    TResult Function(String packageName, String appVersion, String deviceId,
            String deviceModel, String systemVersion, bool firstLaunch)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppInfoModel():
        return $default(_that.packageName, _that.appVersion, _that.deviceId,
            _that.deviceModel, _that.systemVersion, _that.firstLaunch);
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
    TResult? Function(String packageName, String appVersion, String deviceId,
            String deviceModel, String systemVersion, bool firstLaunch)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppInfoModel() when $default != null:
        return $default(_that.packageName, _that.appVersion, _that.deviceId,
            _that.deviceModel, _that.systemVersion, _that.firstLaunch);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AppInfoModel implements AppInfoModel {
  const _AppInfoModel(
      {this.packageName = '',
      this.appVersion = '',
      this.deviceId = '',
      this.deviceModel = '',
      this.systemVersion = '',
      this.firstLaunch = false});
  factory _AppInfoModel.fromJson(Map<String, dynamic> json) =>
      _$AppInfoModelFromJson(json);

  @override
  @JsonKey()
  final String packageName;
// 包名
  @override
  @JsonKey()
  final String appVersion;
// App版本号
  @override
  @JsonKey()
  final String deviceId;
// 设备唯一标识
  @override
  @JsonKey()
  final String deviceModel;
// 设备平台: Android、iOS...
  @override
  @JsonKey()
  final String systemVersion;
// 系统版本
  @override
  @JsonKey()
  final bool firstLaunch;

  /// Create a copy of AppInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppInfoModelCopyWith<_AppInfoModel> get copyWith =>
      __$AppInfoModelCopyWithImpl<_AppInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppInfoModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppInfoModel &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceModel, deviceModel) ||
                other.deviceModel == deviceModel) &&
            (identical(other.systemVersion, systemVersion) ||
                other.systemVersion == systemVersion) &&
            (identical(other.firstLaunch, firstLaunch) ||
                other.firstLaunch == firstLaunch));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, packageName, appVersion,
      deviceId, deviceModel, systemVersion, firstLaunch);

  @override
  String toString() {
    return 'AppInfoModel(packageName: $packageName, appVersion: $appVersion, deviceId: $deviceId, deviceModel: $deviceModel, systemVersion: $systemVersion, firstLaunch: $firstLaunch)';
  }
}

/// @nodoc
abstract mixin class _$AppInfoModelCopyWith<$Res>
    implements $AppInfoModelCopyWith<$Res> {
  factory _$AppInfoModelCopyWith(
          _AppInfoModel value, $Res Function(_AppInfoModel) _then) =
      __$AppInfoModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String packageName,
      String appVersion,
      String deviceId,
      String deviceModel,
      String systemVersion,
      bool firstLaunch});
}

/// @nodoc
class __$AppInfoModelCopyWithImpl<$Res>
    implements _$AppInfoModelCopyWith<$Res> {
  __$AppInfoModelCopyWithImpl(this._self, this._then);

  final _AppInfoModel _self;
  final $Res Function(_AppInfoModel) _then;

  /// Create a copy of AppInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? packageName = null,
    Object? appVersion = null,
    Object? deviceId = null,
    Object? deviceModel = null,
    Object? systemVersion = null,
    Object? firstLaunch = null,
  }) {
    return _then(_AppInfoModel(
      packageName: null == packageName
          ? _self.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      appVersion: null == appVersion
          ? _self.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _self.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceModel: null == deviceModel
          ? _self.deviceModel
          : deviceModel // ignore: cast_nullable_to_non_nullable
              as String,
      systemVersion: null == systemVersion
          ? _self.systemVersion
          : systemVersion // ignore: cast_nullable_to_non_nullable
              as String,
      firstLaunch: null == firstLaunch
          ? _self.firstLaunch
          : firstLaunch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
