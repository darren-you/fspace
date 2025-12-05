// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TemplateCategoryModel implements DiagnosticableTreeMixin {
  int get id;
  String get name;
  int get sort;
  @JsonKey(name: 'max_version')
  String get maxVersion;
  @JsonKey(name: 'max_version_int')
  int get maxVersionInt;
  @JsonKey(name: 'is_active')
  int get isActive;
  @JsonKey(name: 'is_delete')
  int get isDelete;
  @JsonKey(name: 'create_at')
  String get createAt;
  @JsonKey(name: 'update_at')
  String get updateAt;
  @JsonKey(name: 'main_class')
  int get mainClass;

  /// Create a copy of TemplateCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TemplateCategoryModelCopyWith<TemplateCategoryModel> get copyWith =>
      _$TemplateCategoryModelCopyWithImpl<TemplateCategoryModel>(
          this as TemplateCategoryModel, _$identity);

  /// Serializes this TemplateCategoryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TemplateCategoryModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('sort', sort))
      ..add(DiagnosticsProperty('maxVersion', maxVersion))
      ..add(DiagnosticsProperty('maxVersionInt', maxVersionInt))
      ..add(DiagnosticsProperty('isActive', isActive))
      ..add(DiagnosticsProperty('isDelete', isDelete))
      ..add(DiagnosticsProperty('createAt', createAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('mainClass', mainClass));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TemplateCategoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.maxVersion, maxVersion) ||
                other.maxVersion == maxVersion) &&
            (identical(other.maxVersionInt, maxVersionInt) ||
                other.maxVersionInt == maxVersionInt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isDelete, isDelete) ||
                other.isDelete == isDelete) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.mainClass, mainClass) ||
                other.mainClass == mainClass));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, sort, maxVersion,
      maxVersionInt, isActive, isDelete, createAt, updateAt, mainClass);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TemplateCategoryModel(id: $id, name: $name, sort: $sort, maxVersion: $maxVersion, maxVersionInt: $maxVersionInt, isActive: $isActive, isDelete: $isDelete, createAt: $createAt, updateAt: $updateAt, mainClass: $mainClass)';
  }
}

/// @nodoc
abstract mixin class $TemplateCategoryModelCopyWith<$Res> {
  factory $TemplateCategoryModelCopyWith(TemplateCategoryModel value,
          $Res Function(TemplateCategoryModel) _then) =
      _$TemplateCategoryModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      int sort,
      @JsonKey(name: 'max_version') String maxVersion,
      @JsonKey(name: 'max_version_int') int maxVersionInt,
      @JsonKey(name: 'is_active') int isActive,
      @JsonKey(name: 'is_delete') int isDelete,
      @JsonKey(name: 'create_at') String createAt,
      @JsonKey(name: 'update_at') String updateAt,
      @JsonKey(name: 'main_class') int mainClass});
}

/// @nodoc
class _$TemplateCategoryModelCopyWithImpl<$Res>
    implements $TemplateCategoryModelCopyWith<$Res> {
  _$TemplateCategoryModelCopyWithImpl(this._self, this._then);

  final TemplateCategoryModel _self;
  final $Res Function(TemplateCategoryModel) _then;

  /// Create a copy of TemplateCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sort = null,
    Object? maxVersion = null,
    Object? maxVersionInt = null,
    Object? isActive = null,
    Object? isDelete = null,
    Object? createAt = null,
    Object? updateAt = null,
    Object? mainClass = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sort: null == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as int,
      maxVersion: null == maxVersion
          ? _self.maxVersion
          : maxVersion // ignore: cast_nullable_to_non_nullable
              as String,
      maxVersionInt: null == maxVersionInt
          ? _self.maxVersionInt
          : maxVersionInt // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int,
      isDelete: null == isDelete
          ? _self.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as int,
      createAt: null == createAt
          ? _self.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
      updateAt: null == updateAt
          ? _self.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as String,
      mainClass: null == mainClass
          ? _self.mainClass
          : mainClass // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [TemplateCategoryModel].
extension TemplateCategoryModelPatterns on TemplateCategoryModel {
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
    TResult Function(_TemplateCategoryModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TemplateCategoryModel() when $default != null:
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
    TResult Function(_TemplateCategoryModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateCategoryModel():
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
    TResult? Function(_TemplateCategoryModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateCategoryModel() when $default != null:
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
            int id,
            String name,
            int sort,
            @JsonKey(name: 'max_version') String maxVersion,
            @JsonKey(name: 'max_version_int') int maxVersionInt,
            @JsonKey(name: 'is_active') int isActive,
            @JsonKey(name: 'is_delete') int isDelete,
            @JsonKey(name: 'create_at') String createAt,
            @JsonKey(name: 'update_at') String updateAt,
            @JsonKey(name: 'main_class') int mainClass)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TemplateCategoryModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.sort,
            _that.maxVersion,
            _that.maxVersionInt,
            _that.isActive,
            _that.isDelete,
            _that.createAt,
            _that.updateAt,
            _that.mainClass);
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
            int id,
            String name,
            int sort,
            @JsonKey(name: 'max_version') String maxVersion,
            @JsonKey(name: 'max_version_int') int maxVersionInt,
            @JsonKey(name: 'is_active') int isActive,
            @JsonKey(name: 'is_delete') int isDelete,
            @JsonKey(name: 'create_at') String createAt,
            @JsonKey(name: 'update_at') String updateAt,
            @JsonKey(name: 'main_class') int mainClass)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateCategoryModel():
        return $default(
            _that.id,
            _that.name,
            _that.sort,
            _that.maxVersion,
            _that.maxVersionInt,
            _that.isActive,
            _that.isDelete,
            _that.createAt,
            _that.updateAt,
            _that.mainClass);
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
            int id,
            String name,
            int sort,
            @JsonKey(name: 'max_version') String maxVersion,
            @JsonKey(name: 'max_version_int') int maxVersionInt,
            @JsonKey(name: 'is_active') int isActive,
            @JsonKey(name: 'is_delete') int isDelete,
            @JsonKey(name: 'create_at') String createAt,
            @JsonKey(name: 'update_at') String updateAt,
            @JsonKey(name: 'main_class') int mainClass)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateCategoryModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.sort,
            _that.maxVersion,
            _that.maxVersionInt,
            _that.isActive,
            _that.isDelete,
            _that.createAt,
            _that.updateAt,
            _that.mainClass);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TemplateCategoryModel
    with DiagnosticableTreeMixin
    implements TemplateCategoryModel {
  const _TemplateCategoryModel(
      {this.id = -1,
      this.name = '',
      this.sort = -1,
      @JsonKey(name: 'max_version') this.maxVersion = '',
      @JsonKey(name: 'max_version_int') this.maxVersionInt = -1,
      @JsonKey(name: 'is_active') this.isActive = 1,
      @JsonKey(name: 'is_delete') this.isDelete = -1,
      @JsonKey(name: 'create_at') this.createAt = '',
      @JsonKey(name: 'update_at') this.updateAt = '',
      @JsonKey(name: 'main_class') this.mainClass = 1});
  factory _TemplateCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$TemplateCategoryModelFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int sort;
  @override
  @JsonKey(name: 'max_version')
  final String maxVersion;
  @override
  @JsonKey(name: 'max_version_int')
  final int maxVersionInt;
  @override
  @JsonKey(name: 'is_active')
  final int isActive;
  @override
  @JsonKey(name: 'is_delete')
  final int isDelete;
  @override
  @JsonKey(name: 'create_at')
  final String createAt;
  @override
  @JsonKey(name: 'update_at')
  final String updateAt;
  @override
  @JsonKey(name: 'main_class')
  final int mainClass;

  /// Create a copy of TemplateCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TemplateCategoryModelCopyWith<_TemplateCategoryModel> get copyWith =>
      __$TemplateCategoryModelCopyWithImpl<_TemplateCategoryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TemplateCategoryModelToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TemplateCategoryModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('sort', sort))
      ..add(DiagnosticsProperty('maxVersion', maxVersion))
      ..add(DiagnosticsProperty('maxVersionInt', maxVersionInt))
      ..add(DiagnosticsProperty('isActive', isActive))
      ..add(DiagnosticsProperty('isDelete', isDelete))
      ..add(DiagnosticsProperty('createAt', createAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('mainClass', mainClass));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TemplateCategoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.maxVersion, maxVersion) ||
                other.maxVersion == maxVersion) &&
            (identical(other.maxVersionInt, maxVersionInt) ||
                other.maxVersionInt == maxVersionInt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isDelete, isDelete) ||
                other.isDelete == isDelete) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.mainClass, mainClass) ||
                other.mainClass == mainClass));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, sort, maxVersion,
      maxVersionInt, isActive, isDelete, createAt, updateAt, mainClass);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TemplateCategoryModel(id: $id, name: $name, sort: $sort, maxVersion: $maxVersion, maxVersionInt: $maxVersionInt, isActive: $isActive, isDelete: $isDelete, createAt: $createAt, updateAt: $updateAt, mainClass: $mainClass)';
  }
}

/// @nodoc
abstract mixin class _$TemplateCategoryModelCopyWith<$Res>
    implements $TemplateCategoryModelCopyWith<$Res> {
  factory _$TemplateCategoryModelCopyWith(_TemplateCategoryModel value,
          $Res Function(_TemplateCategoryModel) _then) =
      __$TemplateCategoryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int sort,
      @JsonKey(name: 'max_version') String maxVersion,
      @JsonKey(name: 'max_version_int') int maxVersionInt,
      @JsonKey(name: 'is_active') int isActive,
      @JsonKey(name: 'is_delete') int isDelete,
      @JsonKey(name: 'create_at') String createAt,
      @JsonKey(name: 'update_at') String updateAt,
      @JsonKey(name: 'main_class') int mainClass});
}

/// @nodoc
class __$TemplateCategoryModelCopyWithImpl<$Res>
    implements _$TemplateCategoryModelCopyWith<$Res> {
  __$TemplateCategoryModelCopyWithImpl(this._self, this._then);

  final _TemplateCategoryModel _self;
  final $Res Function(_TemplateCategoryModel) _then;

  /// Create a copy of TemplateCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sort = null,
    Object? maxVersion = null,
    Object? maxVersionInt = null,
    Object? isActive = null,
    Object? isDelete = null,
    Object? createAt = null,
    Object? updateAt = null,
    Object? mainClass = null,
  }) {
    return _then(_TemplateCategoryModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sort: null == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as int,
      maxVersion: null == maxVersion
          ? _self.maxVersion
          : maxVersion // ignore: cast_nullable_to_non_nullable
              as String,
      maxVersionInt: null == maxVersionInt
          ? _self.maxVersionInt
          : maxVersionInt // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int,
      isDelete: null == isDelete
          ? _self.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as int,
      createAt: null == createAt
          ? _self.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
      updateAt: null == updateAt
          ? _self.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as String,
      mainClass: null == mainClass
          ? _self.mainClass
          : mainClass // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
