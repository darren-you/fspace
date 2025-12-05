// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_getui_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BaseGetuiMessage<T> {
  @JsonKey(name: 'type')
  String get type;
  @JsonKey(name: 'msg')
  String get msg;
  @JsonKey(name: 'data')
  T? get data;
  @JsonKey(name: 'time')
  int get time;

  /// Create a copy of BaseGetuiMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BaseGetuiMessageCopyWith<T, BaseGetuiMessage<T>> get copyWith =>
      _$BaseGetuiMessageCopyWithImpl<T, BaseGetuiMessage<T>>(
          this as BaseGetuiMessage<T>, _$identity);

  /// Serializes this BaseGetuiMessage to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BaseGetuiMessage<T> &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.msg, msg) || other.msg == msg) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, msg, const DeepCollectionEquality().hash(data), time);

  @override
  String toString() {
    return 'BaseGetuiMessage<$T>(type: $type, msg: $msg, data: $data, time: $time)';
  }
}

/// @nodoc
abstract mixin class $BaseGetuiMessageCopyWith<T, $Res> {
  factory $BaseGetuiMessageCopyWith(
          BaseGetuiMessage<T> value, $Res Function(BaseGetuiMessage<T>) _then) =
      _$BaseGetuiMessageCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'type') String type,
      @JsonKey(name: 'msg') String msg,
      @JsonKey(name: 'data') T? data,
      @JsonKey(name: 'time') int time});
}

/// @nodoc
class _$BaseGetuiMessageCopyWithImpl<T, $Res>
    implements $BaseGetuiMessageCopyWith<T, $Res> {
  _$BaseGetuiMessageCopyWithImpl(this._self, this._then);

  final BaseGetuiMessage<T> _self;
  final $Res Function(BaseGetuiMessage<T>) _then;

  /// Create a copy of BaseGetuiMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? msg = null,
    Object? data = freezed,
    Object? time = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      msg: null == msg
          ? _self.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [BaseGetuiMessage].
extension BaseGetuiMessagePatterns<T> on BaseGetuiMessage<T> {
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
    TResult Function(_BaseGetuiMessage<T> value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BaseGetuiMessage() when $default != null:
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
    TResult Function(_BaseGetuiMessage<T> value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BaseGetuiMessage():
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
    TResult? Function(_BaseGetuiMessage<T> value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BaseGetuiMessage() when $default != null:
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
            @JsonKey(name: 'type') String type,
            @JsonKey(name: 'msg') String msg,
            @JsonKey(name: 'data') T? data,
            @JsonKey(name: 'time') int time)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BaseGetuiMessage() when $default != null:
        return $default(_that.type, _that.msg, _that.data, _that.time);
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
            @JsonKey(name: 'type') String type,
            @JsonKey(name: 'msg') String msg,
            @JsonKey(name: 'data') T? data,
            @JsonKey(name: 'time') int time)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BaseGetuiMessage():
        return $default(_that.type, _that.msg, _that.data, _that.time);
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
            @JsonKey(name: 'type') String type,
            @JsonKey(name: 'msg') String msg,
            @JsonKey(name: 'data') T? data,
            @JsonKey(name: 'time') int time)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BaseGetuiMessage() when $default != null:
        return $default(_that.type, _that.msg, _that.data, _that.time);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _BaseGetuiMessage<T> implements BaseGetuiMessage<T> {
  const _BaseGetuiMessage(
      {@JsonKey(name: 'type') this.type = '',
      @JsonKey(name: 'msg') this.msg = '',
      @JsonKey(name: 'data') this.data,
      @JsonKey(name: 'time') this.time = -1});
  factory _BaseGetuiMessage.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$BaseGetuiMessageFromJson(json, fromJsonT);

  @override
  @JsonKey(name: 'type')
  final String type;
  @override
  @JsonKey(name: 'msg')
  final String msg;
  @override
  @JsonKey(name: 'data')
  final T? data;
  @override
  @JsonKey(name: 'time')
  final int time;

  /// Create a copy of BaseGetuiMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BaseGetuiMessageCopyWith<T, _BaseGetuiMessage<T>> get copyWith =>
      __$BaseGetuiMessageCopyWithImpl<T, _BaseGetuiMessage<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$BaseGetuiMessageToJson<T>(this, toJsonT);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BaseGetuiMessage<T> &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.msg, msg) || other.msg == msg) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, msg, const DeepCollectionEquality().hash(data), time);

  @override
  String toString() {
    return 'BaseGetuiMessage<$T>(type: $type, msg: $msg, data: $data, time: $time)';
  }
}

/// @nodoc
abstract mixin class _$BaseGetuiMessageCopyWith<T, $Res>
    implements $BaseGetuiMessageCopyWith<T, $Res> {
  factory _$BaseGetuiMessageCopyWith(_BaseGetuiMessage<T> value,
          $Res Function(_BaseGetuiMessage<T>) _then) =
      __$BaseGetuiMessageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type') String type,
      @JsonKey(name: 'msg') String msg,
      @JsonKey(name: 'data') T? data,
      @JsonKey(name: 'time') int time});
}

/// @nodoc
class __$BaseGetuiMessageCopyWithImpl<T, $Res>
    implements _$BaseGetuiMessageCopyWith<T, $Res> {
  __$BaseGetuiMessageCopyWithImpl(this._self, this._then);

  final _BaseGetuiMessage<T> _self;
  final $Res Function(_BaseGetuiMessage<T>) _then;

  /// Create a copy of BaseGetuiMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? msg = null,
    Object? data = freezed,
    Object? time = null,
  }) {
    return _then(_BaseGetuiMessage<T>(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      msg: null == msg
          ? _self.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
