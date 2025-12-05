// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserInfoModel {
  @JsonKey(name: 'id')
  int get id;
  @JsonKey(name: 'avatar')
  String get avatar;
  @JsonKey(name: 'username')
  String get username;
  @JsonKey(name: 'diamond')
  int get diamond;
  @JsonKey(name: 'phone')
  String get phone;

  ///1-vip 0-普通会员
  @JsonKey(name: 'is_vip')
  int get isVip;
  @JsonKey(name: 'vip_info')
  VipInfo get vipInfo;
  @JsonKey(name: 'regist_at')
  int get registAt;

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserInfoModelCopyWith<UserInfoModel> get copyWith =>
      _$UserInfoModelCopyWithImpl<UserInfoModel>(
          this as UserInfoModel, _$identity);

  /// Serializes this UserInfoModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserInfoModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.diamond, diamond) || other.diamond == diamond) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.isVip, isVip) || other.isVip == isVip) &&
            (identical(other.vipInfo, vipInfo) || other.vipInfo == vipInfo) &&
            (identical(other.registAt, registAt) ||
                other.registAt == registAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, avatar, username, diamond,
      phone, isVip, vipInfo, registAt);

  @override
  String toString() {
    return 'UserInfoModel(id: $id, avatar: $avatar, username: $username, diamond: $diamond, phone: $phone, isVip: $isVip, vipInfo: $vipInfo, registAt: $registAt)';
  }
}

/// @nodoc
abstract mixin class $UserInfoModelCopyWith<$Res> {
  factory $UserInfoModelCopyWith(
          UserInfoModel value, $Res Function(UserInfoModel) _then) =
      _$UserInfoModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'avatar') String avatar,
      @JsonKey(name: 'username') String username,
      @JsonKey(name: 'diamond') int diamond,
      @JsonKey(name: 'phone') String phone,
      @JsonKey(name: 'is_vip') int isVip,
      @JsonKey(name: 'vip_info') VipInfo vipInfo,
      @JsonKey(name: 'regist_at') int registAt});

  $VipInfoCopyWith<$Res> get vipInfo;
}

/// @nodoc
class _$UserInfoModelCopyWithImpl<$Res>
    implements $UserInfoModelCopyWith<$Res> {
  _$UserInfoModelCopyWithImpl(this._self, this._then);

  final UserInfoModel _self;
  final $Res Function(UserInfoModel) _then;

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatar = null,
    Object? username = null,
    Object? diamond = null,
    Object? phone = null,
    Object? isVip = null,
    Object? vipInfo = null,
    Object? registAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      avatar: null == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      diamond: null == diamond
          ? _self.diamond
          : diamond // ignore: cast_nullable_to_non_nullable
              as int,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      isVip: null == isVip
          ? _self.isVip
          : isVip // ignore: cast_nullable_to_non_nullable
              as int,
      vipInfo: null == vipInfo
          ? _self.vipInfo
          : vipInfo // ignore: cast_nullable_to_non_nullable
              as VipInfo,
      registAt: null == registAt
          ? _self.registAt
          : registAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VipInfoCopyWith<$Res> get vipInfo {
    return $VipInfoCopyWith<$Res>(_self.vipInfo, (value) {
      return _then(_self.copyWith(vipInfo: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UserInfoModel].
extension UserInfoModelPatterns on UserInfoModel {
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
    TResult Function(_UserInfoModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserInfoModel() when $default != null:
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
    TResult Function(_UserInfoModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfoModel():
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
    TResult? Function(_UserInfoModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfoModel() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'id') int id,
            @JsonKey(name: 'avatar') String avatar,
            @JsonKey(name: 'username') String username,
            @JsonKey(name: 'diamond') int diamond,
            @JsonKey(name: 'phone') String phone,
            @JsonKey(name: 'is_vip') int isVip,
            @JsonKey(name: 'vip_info') VipInfo vipInfo,
            @JsonKey(name: 'regist_at') int registAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserInfoModel() when $default != null:
        return $default(_that.id, _that.avatar, _that.username, _that.diamond,
            _that.phone, _that.isVip, _that.vipInfo, _that.registAt);
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
    TResult Function(
            @JsonKey(name: 'id') int id,
            @JsonKey(name: 'avatar') String avatar,
            @JsonKey(name: 'username') String username,
            @JsonKey(name: 'diamond') int diamond,
            @JsonKey(name: 'phone') String phone,
            @JsonKey(name: 'is_vip') int isVip,
            @JsonKey(name: 'vip_info') VipInfo vipInfo,
            @JsonKey(name: 'regist_at') int registAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfoModel():
        return $default(_that.id, _that.avatar, _that.username, _that.diamond,
            _that.phone, _that.isVip, _that.vipInfo, _that.registAt);
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
    TResult? Function(
            @JsonKey(name: 'id') int id,
            @JsonKey(name: 'avatar') String avatar,
            @JsonKey(name: 'username') String username,
            @JsonKey(name: 'diamond') int diamond,
            @JsonKey(name: 'phone') String phone,
            @JsonKey(name: 'is_vip') int isVip,
            @JsonKey(name: 'vip_info') VipInfo vipInfo,
            @JsonKey(name: 'regist_at') int registAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfoModel() when $default != null:
        return $default(_that.id, _that.avatar, _that.username, _that.diamond,
            _that.phone, _that.isVip, _that.vipInfo, _that.registAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserInfoModel implements UserInfoModel {
  const _UserInfoModel(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'avatar') this.avatar = '',
      @JsonKey(name: 'username') this.username = '',
      @JsonKey(name: 'diamond') this.diamond = 0,
      @JsonKey(name: 'phone') this.phone = '',
      @JsonKey(name: 'is_vip') this.isVip = 0,
      @JsonKey(name: 'vip_info') this.vipInfo = const VipInfo(),
      @JsonKey(name: 'regist_at') this.registAt = 0});
  factory _UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'avatar')
  final String avatar;
  @override
  @JsonKey(name: 'username')
  final String username;
  @override
  @JsonKey(name: 'diamond')
  final int diamond;
  @override
  @JsonKey(name: 'phone')
  final String phone;

  ///1-vip 0-普通会员
  @override
  @JsonKey(name: 'is_vip')
  final int isVip;
  @override
  @JsonKey(name: 'vip_info')
  final VipInfo vipInfo;
  @override
  @JsonKey(name: 'regist_at')
  final int registAt;

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserInfoModelCopyWith<_UserInfoModel> get copyWith =>
      __$UserInfoModelCopyWithImpl<_UserInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserInfoModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserInfoModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.diamond, diamond) || other.diamond == diamond) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.isVip, isVip) || other.isVip == isVip) &&
            (identical(other.vipInfo, vipInfo) || other.vipInfo == vipInfo) &&
            (identical(other.registAt, registAt) ||
                other.registAt == registAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, avatar, username, diamond,
      phone, isVip, vipInfo, registAt);

  @override
  String toString() {
    return 'UserInfoModel(id: $id, avatar: $avatar, username: $username, diamond: $diamond, phone: $phone, isVip: $isVip, vipInfo: $vipInfo, registAt: $registAt)';
  }
}

/// @nodoc
abstract mixin class _$UserInfoModelCopyWith<$Res>
    implements $UserInfoModelCopyWith<$Res> {
  factory _$UserInfoModelCopyWith(
          _UserInfoModel value, $Res Function(_UserInfoModel) _then) =
      __$UserInfoModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'avatar') String avatar,
      @JsonKey(name: 'username') String username,
      @JsonKey(name: 'diamond') int diamond,
      @JsonKey(name: 'phone') String phone,
      @JsonKey(name: 'is_vip') int isVip,
      @JsonKey(name: 'vip_info') VipInfo vipInfo,
      @JsonKey(name: 'regist_at') int registAt});

  @override
  $VipInfoCopyWith<$Res> get vipInfo;
}

/// @nodoc
class __$UserInfoModelCopyWithImpl<$Res>
    implements _$UserInfoModelCopyWith<$Res> {
  __$UserInfoModelCopyWithImpl(this._self, this._then);

  final _UserInfoModel _self;
  final $Res Function(_UserInfoModel) _then;

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? avatar = null,
    Object? username = null,
    Object? diamond = null,
    Object? phone = null,
    Object? isVip = null,
    Object? vipInfo = null,
    Object? registAt = null,
  }) {
    return _then(_UserInfoModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      avatar: null == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      diamond: null == diamond
          ? _self.diamond
          : diamond // ignore: cast_nullable_to_non_nullable
              as int,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      isVip: null == isVip
          ? _self.isVip
          : isVip // ignore: cast_nullable_to_non_nullable
              as int,
      vipInfo: null == vipInfo
          ? _self.vipInfo
          : vipInfo // ignore: cast_nullable_to_non_nullable
              as VipInfo,
      registAt: null == registAt
          ? _self.registAt
          : registAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VipInfoCopyWith<$Res> get vipInfo {
    return $VipInfoCopyWith<$Res>(_self.vipInfo, (value) {
      return _then(_self.copyWith(vipInfo: value));
    });
  }
}

/// @nodoc
mixin _$VipInfo {
  @JsonKey(name: 'vip_type')
  int get vipType;
  @JsonKey(name: 'create_at')
  String get createAt;
  @JsonKey(name: 'renewal_at')
  String get renewalAt;
  @JsonKey(name: 'expire_at')
  String get expireAt;
  @JsonKey(name: 'is_expire')
  int get isExpire;

  /// Create a copy of VipInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VipInfoCopyWith<VipInfo> get copyWith =>
      _$VipInfoCopyWithImpl<VipInfo>(this as VipInfo, _$identity);

  /// Serializes this VipInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VipInfo &&
            (identical(other.vipType, vipType) || other.vipType == vipType) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.renewalAt, renewalAt) ||
                other.renewalAt == renewalAt) &&
            (identical(other.expireAt, expireAt) ||
                other.expireAt == expireAt) &&
            (identical(other.isExpire, isExpire) ||
                other.isExpire == isExpire));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, vipType, createAt, renewalAt, expireAt, isExpire);

  @override
  String toString() {
    return 'VipInfo(vipType: $vipType, createAt: $createAt, renewalAt: $renewalAt, expireAt: $expireAt, isExpire: $isExpire)';
  }
}

/// @nodoc
abstract mixin class $VipInfoCopyWith<$Res> {
  factory $VipInfoCopyWith(VipInfo value, $Res Function(VipInfo) _then) =
      _$VipInfoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'vip_type') int vipType,
      @JsonKey(name: 'create_at') String createAt,
      @JsonKey(name: 'renewal_at') String renewalAt,
      @JsonKey(name: 'expire_at') String expireAt,
      @JsonKey(name: 'is_expire') int isExpire});
}

/// @nodoc
class _$VipInfoCopyWithImpl<$Res> implements $VipInfoCopyWith<$Res> {
  _$VipInfoCopyWithImpl(this._self, this._then);

  final VipInfo _self;
  final $Res Function(VipInfo) _then;

  /// Create a copy of VipInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vipType = null,
    Object? createAt = null,
    Object? renewalAt = null,
    Object? expireAt = null,
    Object? isExpire = null,
  }) {
    return _then(_self.copyWith(
      vipType: null == vipType
          ? _self.vipType
          : vipType // ignore: cast_nullable_to_non_nullable
              as int,
      createAt: null == createAt
          ? _self.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
      renewalAt: null == renewalAt
          ? _self.renewalAt
          : renewalAt // ignore: cast_nullable_to_non_nullable
              as String,
      expireAt: null == expireAt
          ? _self.expireAt
          : expireAt // ignore: cast_nullable_to_non_nullable
              as String,
      isExpire: null == isExpire
          ? _self.isExpire
          : isExpire // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [VipInfo].
extension VipInfoPatterns on VipInfo {
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
    TResult Function(_VipInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VipInfo() when $default != null:
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
    TResult Function(_VipInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VipInfo():
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
    TResult? Function(_VipInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VipInfo() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'vip_type') int vipType,
            @JsonKey(name: 'create_at') String createAt,
            @JsonKey(name: 'renewal_at') String renewalAt,
            @JsonKey(name: 'expire_at') String expireAt,
            @JsonKey(name: 'is_expire') int isExpire)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VipInfo() when $default != null:
        return $default(_that.vipType, _that.createAt, _that.renewalAt,
            _that.expireAt, _that.isExpire);
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
    TResult Function(
            @JsonKey(name: 'vip_type') int vipType,
            @JsonKey(name: 'create_at') String createAt,
            @JsonKey(name: 'renewal_at') String renewalAt,
            @JsonKey(name: 'expire_at') String expireAt,
            @JsonKey(name: 'is_expire') int isExpire)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VipInfo():
        return $default(_that.vipType, _that.createAt, _that.renewalAt,
            _that.expireAt, _that.isExpire);
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
    TResult? Function(
            @JsonKey(name: 'vip_type') int vipType,
            @JsonKey(name: 'create_at') String createAt,
            @JsonKey(name: 'renewal_at') String renewalAt,
            @JsonKey(name: 'expire_at') String expireAt,
            @JsonKey(name: 'is_expire') int isExpire)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VipInfo() when $default != null:
        return $default(_that.vipType, _that.createAt, _that.renewalAt,
            _that.expireAt, _that.isExpire);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VipInfo implements VipInfo {
  const _VipInfo(
      {@JsonKey(name: 'vip_type') this.vipType = 0,
      @JsonKey(name: 'create_at') this.createAt = '',
      @JsonKey(name: 'renewal_at') this.renewalAt = '',
      @JsonKey(name: 'expire_at') this.expireAt = '',
      @JsonKey(name: 'is_expire') this.isExpire = 0});
  factory _VipInfo.fromJson(Map<String, dynamic> json) =>
      _$VipInfoFromJson(json);

  @override
  @JsonKey(name: 'vip_type')
  final int vipType;
  @override
  @JsonKey(name: 'create_at')
  final String createAt;
  @override
  @JsonKey(name: 'renewal_at')
  final String renewalAt;
  @override
  @JsonKey(name: 'expire_at')
  final String expireAt;
  @override
  @JsonKey(name: 'is_expire')
  final int isExpire;

  /// Create a copy of VipInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VipInfoCopyWith<_VipInfo> get copyWith =>
      __$VipInfoCopyWithImpl<_VipInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VipInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VipInfo &&
            (identical(other.vipType, vipType) || other.vipType == vipType) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.renewalAt, renewalAt) ||
                other.renewalAt == renewalAt) &&
            (identical(other.expireAt, expireAt) ||
                other.expireAt == expireAt) &&
            (identical(other.isExpire, isExpire) ||
                other.isExpire == isExpire));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, vipType, createAt, renewalAt, expireAt, isExpire);

  @override
  String toString() {
    return 'VipInfo(vipType: $vipType, createAt: $createAt, renewalAt: $renewalAt, expireAt: $expireAt, isExpire: $isExpire)';
  }
}

/// @nodoc
abstract mixin class _$VipInfoCopyWith<$Res> implements $VipInfoCopyWith<$Res> {
  factory _$VipInfoCopyWith(_VipInfo value, $Res Function(_VipInfo) _then) =
      __$VipInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'vip_type') int vipType,
      @JsonKey(name: 'create_at') String createAt,
      @JsonKey(name: 'renewal_at') String renewalAt,
      @JsonKey(name: 'expire_at') String expireAt,
      @JsonKey(name: 'is_expire') int isExpire});
}

/// @nodoc
class __$VipInfoCopyWithImpl<$Res> implements _$VipInfoCopyWith<$Res> {
  __$VipInfoCopyWithImpl(this._self, this._then);

  final _VipInfo _self;
  final $Res Function(_VipInfo) _then;

  /// Create a copy of VipInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vipType = null,
    Object? createAt = null,
    Object? renewalAt = null,
    Object? expireAt = null,
    Object? isExpire = null,
  }) {
    return _then(_VipInfo(
      vipType: null == vipType
          ? _self.vipType
          : vipType // ignore: cast_nullable_to_non_nullable
              as int,
      createAt: null == createAt
          ? _self.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
      renewalAt: null == renewalAt
          ? _self.renewalAt
          : renewalAt // ignore: cast_nullable_to_non_nullable
              as String,
      expireAt: null == expireAt
          ? _self.expireAt
          : expireAt // ignore: cast_nullable_to_non_nullable
              as String,
      isExpire: null == isExpire
          ? _self.isExpire
          : isExpire // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
