// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BannerModel implements DiagnosticableTreeMixin {
  int get id;
  String get title;
  String get image;
  String get video;
  String get desc;
  int get sort;
  @JsonKey(name: 'is_active')
  int get isActive;
  @JsonKey(name: 'create_at')
  String get createAt;
  @JsonKey(name: 'update_at')
  String get updateAt;
  @JsonKey(name: 'is_delete')
  int get isDelete;
  @JsonKey(name: 'max_version')
  String get maxVersion;
  @JsonKey(name: 'max_version_int')
  int get maxVersionInt;
  @JsonKey(name: 'template_id')
  int get templateId;
  @JsonKey(name: 'category_id')
  int get categoryId;
  @JsonKey(name: 'category_name')
  String get categoryName;
  @JsonKey(name: 'location')
  String get location;
  @JsonKey(name: 'jump_param')
  String get jumpParam;

  /// Create a copy of BannerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BannerModelCopyWith<BannerModel> get copyWith =>
      _$BannerModelCopyWithImpl<BannerModel>(this as BannerModel, _$identity);

  /// Serializes this BannerModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BannerModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('video', video))
      ..add(DiagnosticsProperty('desc', desc))
      ..add(DiagnosticsProperty('sort', sort))
      ..add(DiagnosticsProperty('isActive', isActive))
      ..add(DiagnosticsProperty('createAt', createAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('isDelete', isDelete))
      ..add(DiagnosticsProperty('maxVersion', maxVersion))
      ..add(DiagnosticsProperty('maxVersionInt', maxVersionInt))
      ..add(DiagnosticsProperty('templateId', templateId))
      ..add(DiagnosticsProperty('categoryId', categoryId))
      ..add(DiagnosticsProperty('categoryName', categoryName))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('jumpParam', jumpParam));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BannerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.isDelete, isDelete) ||
                other.isDelete == isDelete) &&
            (identical(other.maxVersion, maxVersion) ||
                other.maxVersion == maxVersion) &&
            (identical(other.maxVersionInt, maxVersionInt) ||
                other.maxVersionInt == maxVersionInt) &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.jumpParam, jumpParam) ||
                other.jumpParam == jumpParam));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      image,
      video,
      desc,
      sort,
      isActive,
      createAt,
      updateAt,
      isDelete,
      maxVersion,
      maxVersionInt,
      templateId,
      categoryId,
      categoryName,
      location,
      jumpParam);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BannerModel(id: $id, title: $title, image: $image, video: $video, desc: $desc, sort: $sort, isActive: $isActive, createAt: $createAt, updateAt: $updateAt, isDelete: $isDelete, maxVersion: $maxVersion, maxVersionInt: $maxVersionInt, templateId: $templateId, categoryId: $categoryId, categoryName: $categoryName, location: $location, jumpParam: $jumpParam)';
  }
}

/// @nodoc
abstract mixin class $BannerModelCopyWith<$Res> {
  factory $BannerModelCopyWith(
          BannerModel value, $Res Function(BannerModel) _then) =
      _$BannerModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String title,
      String image,
      String video,
      String desc,
      int sort,
      @JsonKey(name: 'is_active') int isActive,
      @JsonKey(name: 'create_at') String createAt,
      @JsonKey(name: 'update_at') String updateAt,
      @JsonKey(name: 'is_delete') int isDelete,
      @JsonKey(name: 'max_version') String maxVersion,
      @JsonKey(name: 'max_version_int') int maxVersionInt,
      @JsonKey(name: 'template_id') int templateId,
      @JsonKey(name: 'category_id') int categoryId,
      @JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'location') String location,
      @JsonKey(name: 'jump_param') String jumpParam});
}

/// @nodoc
class _$BannerModelCopyWithImpl<$Res> implements $BannerModelCopyWith<$Res> {
  _$BannerModelCopyWithImpl(this._self, this._then);

  final BannerModel _self;
  final $Res Function(BannerModel) _then;

  /// Create a copy of BannerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = null,
    Object? video = null,
    Object? desc = null,
    Object? sort = null,
    Object? isActive = null,
    Object? createAt = null,
    Object? updateAt = null,
    Object? isDelete = null,
    Object? maxVersion = null,
    Object? maxVersionInt = null,
    Object? templateId = null,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? location = null,
    Object? jumpParam = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      video: null == video
          ? _self.video
          : video // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _self.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      sort: null == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int,
      createAt: null == createAt
          ? _self.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
      updateAt: null == updateAt
          ? _self.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as String,
      isDelete: null == isDelete
          ? _self.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as int,
      maxVersion: null == maxVersion
          ? _self.maxVersion
          : maxVersion // ignore: cast_nullable_to_non_nullable
              as String,
      maxVersionInt: null == maxVersionInt
          ? _self.maxVersionInt
          : maxVersionInt // ignore: cast_nullable_to_non_nullable
              as int,
      templateId: null == templateId
          ? _self.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      jumpParam: null == jumpParam
          ? _self.jumpParam
          : jumpParam // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [BannerModel].
extension BannerModelPatterns on BannerModel {
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
    TResult Function(_BannerModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BannerModel() when $default != null:
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
    TResult Function(_BannerModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BannerModel():
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
    TResult? Function(_BannerModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BannerModel() when $default != null:
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
            String title,
            String image,
            String video,
            String desc,
            int sort,
            @JsonKey(name: 'is_active') int isActive,
            @JsonKey(name: 'create_at') String createAt,
            @JsonKey(name: 'update_at') String updateAt,
            @JsonKey(name: 'is_delete') int isDelete,
            @JsonKey(name: 'max_version') String maxVersion,
            @JsonKey(name: 'max_version_int') int maxVersionInt,
            @JsonKey(name: 'template_id') int templateId,
            @JsonKey(name: 'category_id') int categoryId,
            @JsonKey(name: 'category_name') String categoryName,
            @JsonKey(name: 'location') String location,
            @JsonKey(name: 'jump_param') String jumpParam)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BannerModel() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.image,
            _that.video,
            _that.desc,
            _that.sort,
            _that.isActive,
            _that.createAt,
            _that.updateAt,
            _that.isDelete,
            _that.maxVersion,
            _that.maxVersionInt,
            _that.templateId,
            _that.categoryId,
            _that.categoryName,
            _that.location,
            _that.jumpParam);
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
            String title,
            String image,
            String video,
            String desc,
            int sort,
            @JsonKey(name: 'is_active') int isActive,
            @JsonKey(name: 'create_at') String createAt,
            @JsonKey(name: 'update_at') String updateAt,
            @JsonKey(name: 'is_delete') int isDelete,
            @JsonKey(name: 'max_version') String maxVersion,
            @JsonKey(name: 'max_version_int') int maxVersionInt,
            @JsonKey(name: 'template_id') int templateId,
            @JsonKey(name: 'category_id') int categoryId,
            @JsonKey(name: 'category_name') String categoryName,
            @JsonKey(name: 'location') String location,
            @JsonKey(name: 'jump_param') String jumpParam)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BannerModel():
        return $default(
            _that.id,
            _that.title,
            _that.image,
            _that.video,
            _that.desc,
            _that.sort,
            _that.isActive,
            _that.createAt,
            _that.updateAt,
            _that.isDelete,
            _that.maxVersion,
            _that.maxVersionInt,
            _that.templateId,
            _that.categoryId,
            _that.categoryName,
            _that.location,
            _that.jumpParam);
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
            String title,
            String image,
            String video,
            String desc,
            int sort,
            @JsonKey(name: 'is_active') int isActive,
            @JsonKey(name: 'create_at') String createAt,
            @JsonKey(name: 'update_at') String updateAt,
            @JsonKey(name: 'is_delete') int isDelete,
            @JsonKey(name: 'max_version') String maxVersion,
            @JsonKey(name: 'max_version_int') int maxVersionInt,
            @JsonKey(name: 'template_id') int templateId,
            @JsonKey(name: 'category_id') int categoryId,
            @JsonKey(name: 'category_name') String categoryName,
            @JsonKey(name: 'location') String location,
            @JsonKey(name: 'jump_param') String jumpParam)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BannerModel() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.image,
            _that.video,
            _that.desc,
            _that.sort,
            _that.isActive,
            _that.createAt,
            _that.updateAt,
            _that.isDelete,
            _that.maxVersion,
            _that.maxVersionInt,
            _that.templateId,
            _that.categoryId,
            _that.categoryName,
            _that.location,
            _that.jumpParam);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BannerModel with DiagnosticableTreeMixin implements BannerModel {
  const _BannerModel(
      {this.id = -1,
      this.title = '',
      this.image = '',
      this.video = '',
      this.desc = '',
      this.sort = 1,
      @JsonKey(name: 'is_active') this.isActive = 1,
      @JsonKey(name: 'create_at') this.createAt = '',
      @JsonKey(name: 'update_at') this.updateAt = '',
      @JsonKey(name: 'is_delete') this.isDelete = -1,
      @JsonKey(name: 'max_version') this.maxVersion = '',
      @JsonKey(name: 'max_version_int') this.maxVersionInt = -1,
      @JsonKey(name: 'template_id') this.templateId = -1,
      @JsonKey(name: 'category_id') this.categoryId = -1,
      @JsonKey(name: 'category_name') this.categoryName = '',
      @JsonKey(name: 'location') this.location = '',
      @JsonKey(name: 'jump_param') this.jumpParam = ''});
  factory _BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  final String video;
  @override
  @JsonKey()
  final String desc;
  @override
  @JsonKey()
  final int sort;
  @override
  @JsonKey(name: 'is_active')
  final int isActive;
  @override
  @JsonKey(name: 'create_at')
  final String createAt;
  @override
  @JsonKey(name: 'update_at')
  final String updateAt;
  @override
  @JsonKey(name: 'is_delete')
  final int isDelete;
  @override
  @JsonKey(name: 'max_version')
  final String maxVersion;
  @override
  @JsonKey(name: 'max_version_int')
  final int maxVersionInt;
  @override
  @JsonKey(name: 'template_id')
  final int templateId;
  @override
  @JsonKey(name: 'category_id')
  final int categoryId;
  @override
  @JsonKey(name: 'category_name')
  final String categoryName;
  @override
  @JsonKey(name: 'location')
  final String location;
  @override
  @JsonKey(name: 'jump_param')
  final String jumpParam;

  /// Create a copy of BannerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BannerModelCopyWith<_BannerModel> get copyWith =>
      __$BannerModelCopyWithImpl<_BannerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BannerModelToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BannerModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('video', video))
      ..add(DiagnosticsProperty('desc', desc))
      ..add(DiagnosticsProperty('sort', sort))
      ..add(DiagnosticsProperty('isActive', isActive))
      ..add(DiagnosticsProperty('createAt', createAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('isDelete', isDelete))
      ..add(DiagnosticsProperty('maxVersion', maxVersion))
      ..add(DiagnosticsProperty('maxVersionInt', maxVersionInt))
      ..add(DiagnosticsProperty('templateId', templateId))
      ..add(DiagnosticsProperty('categoryId', categoryId))
      ..add(DiagnosticsProperty('categoryName', categoryName))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('jumpParam', jumpParam));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BannerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.isDelete, isDelete) ||
                other.isDelete == isDelete) &&
            (identical(other.maxVersion, maxVersion) ||
                other.maxVersion == maxVersion) &&
            (identical(other.maxVersionInt, maxVersionInt) ||
                other.maxVersionInt == maxVersionInt) &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.jumpParam, jumpParam) ||
                other.jumpParam == jumpParam));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      image,
      video,
      desc,
      sort,
      isActive,
      createAt,
      updateAt,
      isDelete,
      maxVersion,
      maxVersionInt,
      templateId,
      categoryId,
      categoryName,
      location,
      jumpParam);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BannerModel(id: $id, title: $title, image: $image, video: $video, desc: $desc, sort: $sort, isActive: $isActive, createAt: $createAt, updateAt: $updateAt, isDelete: $isDelete, maxVersion: $maxVersion, maxVersionInt: $maxVersionInt, templateId: $templateId, categoryId: $categoryId, categoryName: $categoryName, location: $location, jumpParam: $jumpParam)';
  }
}

/// @nodoc
abstract mixin class _$BannerModelCopyWith<$Res>
    implements $BannerModelCopyWith<$Res> {
  factory _$BannerModelCopyWith(
          _BannerModel value, $Res Function(_BannerModel) _then) =
      __$BannerModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String image,
      String video,
      String desc,
      int sort,
      @JsonKey(name: 'is_active') int isActive,
      @JsonKey(name: 'create_at') String createAt,
      @JsonKey(name: 'update_at') String updateAt,
      @JsonKey(name: 'is_delete') int isDelete,
      @JsonKey(name: 'max_version') String maxVersion,
      @JsonKey(name: 'max_version_int') int maxVersionInt,
      @JsonKey(name: 'template_id') int templateId,
      @JsonKey(name: 'category_id') int categoryId,
      @JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'location') String location,
      @JsonKey(name: 'jump_param') String jumpParam});
}

/// @nodoc
class __$BannerModelCopyWithImpl<$Res> implements _$BannerModelCopyWith<$Res> {
  __$BannerModelCopyWithImpl(this._self, this._then);

  final _BannerModel _self;
  final $Res Function(_BannerModel) _then;

  /// Create a copy of BannerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = null,
    Object? video = null,
    Object? desc = null,
    Object? sort = null,
    Object? isActive = null,
    Object? createAt = null,
    Object? updateAt = null,
    Object? isDelete = null,
    Object? maxVersion = null,
    Object? maxVersionInt = null,
    Object? templateId = null,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? location = null,
    Object? jumpParam = null,
  }) {
    return _then(_BannerModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      video: null == video
          ? _self.video
          : video // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _self.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      sort: null == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int,
      createAt: null == createAt
          ? _self.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
      updateAt: null == updateAt
          ? _self.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as String,
      isDelete: null == isDelete
          ? _self.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as int,
      maxVersion: null == maxVersion
          ? _self.maxVersion
          : maxVersion // ignore: cast_nullable_to_non_nullable
              as String,
      maxVersionInt: null == maxVersionInt
          ? _self.maxVersionInt
          : maxVersionInt // ignore: cast_nullable_to_non_nullable
              as int,
      templateId: null == templateId
          ? _self.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      jumpParam: null == jumpParam
          ? _self.jumpParam
          : jumpParam // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
