// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TemplateModel implements DiagnosticableTreeMixin {
  @JsonKey(name: 'id')
  int get id;
  @JsonKey(name: 'name')
  String get name;
  @JsonKey(name: 'cover_url')
  String get coverUrl;
  @JsonKey(name: 'video_cover_url')
  String get videoCoverUrl;
  @JsonKey(name: 'video_first_frame')
  String get videoFirstFrame;
  @JsonKey(name: 'status')
  int get status;
  @JsonKey(name: 'sort_order')
  int get sortOrder;
  @JsonKey(name: 'max_version')
  String get maxVersion;
  @JsonKey(name: 'category_id')
  int get categoryId;
  @JsonKey(name: 'main_class')
  int get mainClass;
  @JsonKey(name: 'description')
  String get description;
  @JsonKey(name: 'create_at')
  String get createAt;
  @JsonKey(name: 'update_at')
  String get updateAt;
  @JsonKey(name: 'diamond_cost')
  int get diamondCost; // single_image: 单图制作、double_image: 双图制作
// group_single_image: 组合单图制作、group_double_image: 组合双图制作
  @JsonKey(name: 'make_type')
  String get makeType;
  @JsonKey(name: 'photo_ratio')
  String get photoRatio; // pet: 宠物、 person: 人物
  @JsonKey(name: 'app_prompt_type')
  String get appPromptType; // photo类型，原始封面图，用于视觉上效果过渡
  @JsonKey(name: 'original_image')
  String get originalImage;

  /// 直接指定模板制作结果类型 "image": 图片类型结果 "video": 视频类型结果
  @JsonKey(name: 'make_result_type')
  String get makeResultType;

  ///图片和视频的分辨率信息
  @JsonKey(name: 'resolution')
  Resolution get resolution;

  ///下发模板所需上传制作的图片数量以及图片对应的类型
  @JsonKey(name: 'image_require')
  Map<String, dynamic> get imageRequire;

  /// Create a copy of TemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TemplateModelCopyWith<TemplateModel> get copyWith =>
      _$TemplateModelCopyWithImpl<TemplateModel>(
          this as TemplateModel, _$identity);

  /// Serializes this TemplateModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TemplateModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('coverUrl', coverUrl))
      ..add(DiagnosticsProperty('videoCoverUrl', videoCoverUrl))
      ..add(DiagnosticsProperty('videoFirstFrame', videoFirstFrame))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('sortOrder', sortOrder))
      ..add(DiagnosticsProperty('maxVersion', maxVersion))
      ..add(DiagnosticsProperty('categoryId', categoryId))
      ..add(DiagnosticsProperty('mainClass', mainClass))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('createAt', createAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('diamondCost', diamondCost))
      ..add(DiagnosticsProperty('makeType', makeType))
      ..add(DiagnosticsProperty('photoRatio', photoRatio))
      ..add(DiagnosticsProperty('appPromptType', appPromptType))
      ..add(DiagnosticsProperty('originalImage', originalImage))
      ..add(DiagnosticsProperty('makeResultType', makeResultType))
      ..add(DiagnosticsProperty('resolution', resolution))
      ..add(DiagnosticsProperty('imageRequire', imageRequire));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TemplateModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.coverUrl, coverUrl) ||
                other.coverUrl == coverUrl) &&
            (identical(other.videoCoverUrl, videoCoverUrl) ||
                other.videoCoverUrl == videoCoverUrl) &&
            (identical(other.videoFirstFrame, videoFirstFrame) ||
                other.videoFirstFrame == videoFirstFrame) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.maxVersion, maxVersion) ||
                other.maxVersion == maxVersion) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.mainClass, mainClass) ||
                other.mainClass == mainClass) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.diamondCost, diamondCost) ||
                other.diamondCost == diamondCost) &&
            (identical(other.makeType, makeType) ||
                other.makeType == makeType) &&
            (identical(other.photoRatio, photoRatio) ||
                other.photoRatio == photoRatio) &&
            (identical(other.appPromptType, appPromptType) ||
                other.appPromptType == appPromptType) &&
            (identical(other.originalImage, originalImage) ||
                other.originalImage == originalImage) &&
            (identical(other.makeResultType, makeResultType) ||
                other.makeResultType == makeResultType) &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution) &&
            const DeepCollectionEquality()
                .equals(other.imageRequire, imageRequire));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        coverUrl,
        videoCoverUrl,
        videoFirstFrame,
        status,
        sortOrder,
        maxVersion,
        categoryId,
        mainClass,
        description,
        createAt,
        updateAt,
        diamondCost,
        makeType,
        photoRatio,
        appPromptType,
        originalImage,
        makeResultType,
        resolution,
        const DeepCollectionEquality().hash(imageRequire)
      ]);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TemplateModel(id: $id, name: $name, coverUrl: $coverUrl, videoCoverUrl: $videoCoverUrl, videoFirstFrame: $videoFirstFrame, status: $status, sortOrder: $sortOrder, maxVersion: $maxVersion, categoryId: $categoryId, mainClass: $mainClass, description: $description, createAt: $createAt, updateAt: $updateAt, diamondCost: $diamondCost, makeType: $makeType, photoRatio: $photoRatio, appPromptType: $appPromptType, originalImage: $originalImage, makeResultType: $makeResultType, resolution: $resolution, imageRequire: $imageRequire)';
  }
}

/// @nodoc
abstract mixin class $TemplateModelCopyWith<$Res> {
  factory $TemplateModelCopyWith(
          TemplateModel value, $Res Function(TemplateModel) _then) =
      _$TemplateModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'cover_url') String coverUrl,
      @JsonKey(name: 'video_cover_url') String videoCoverUrl,
      @JsonKey(name: 'video_first_frame') String videoFirstFrame,
      @JsonKey(name: 'status') int status,
      @JsonKey(name: 'sort_order') int sortOrder,
      @JsonKey(name: 'max_version') String maxVersion,
      @JsonKey(name: 'category_id') int categoryId,
      @JsonKey(name: 'main_class') int mainClass,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'create_at') String createAt,
      @JsonKey(name: 'update_at') String updateAt,
      @JsonKey(name: 'diamond_cost') int diamondCost,
      @JsonKey(name: 'make_type') String makeType,
      @JsonKey(name: 'photo_ratio') String photoRatio,
      @JsonKey(name: 'app_prompt_type') String appPromptType,
      @JsonKey(name: 'original_image') String originalImage,
      @JsonKey(name: 'make_result_type') String makeResultType,
      @JsonKey(name: 'resolution') Resolution resolution,
      @JsonKey(name: 'image_require') Map<String, dynamic> imageRequire});

  $ResolutionCopyWith<$Res> get resolution;
}

/// @nodoc
class _$TemplateModelCopyWithImpl<$Res>
    implements $TemplateModelCopyWith<$Res> {
  _$TemplateModelCopyWithImpl(this._self, this._then);

  final TemplateModel _self;
  final $Res Function(TemplateModel) _then;

  /// Create a copy of TemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? coverUrl = null,
    Object? videoCoverUrl = null,
    Object? videoFirstFrame = null,
    Object? status = null,
    Object? sortOrder = null,
    Object? maxVersion = null,
    Object? categoryId = null,
    Object? mainClass = null,
    Object? description = null,
    Object? createAt = null,
    Object? updateAt = null,
    Object? diamondCost = null,
    Object? makeType = null,
    Object? photoRatio = null,
    Object? appPromptType = null,
    Object? originalImage = null,
    Object? makeResultType = null,
    Object? resolution = null,
    Object? imageRequire = null,
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
      coverUrl: null == coverUrl
          ? _self.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      videoCoverUrl: null == videoCoverUrl
          ? _self.videoCoverUrl
          : videoCoverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      videoFirstFrame: null == videoFirstFrame
          ? _self.videoFirstFrame
          : videoFirstFrame // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      maxVersion: null == maxVersion
          ? _self.maxVersion
          : maxVersion // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      mainClass: null == mainClass
          ? _self.mainClass
          : mainClass // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _self.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
      updateAt: null == updateAt
          ? _self.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as String,
      diamondCost: null == diamondCost
          ? _self.diamondCost
          : diamondCost // ignore: cast_nullable_to_non_nullable
              as int,
      makeType: null == makeType
          ? _self.makeType
          : makeType // ignore: cast_nullable_to_non_nullable
              as String,
      photoRatio: null == photoRatio
          ? _self.photoRatio
          : photoRatio // ignore: cast_nullable_to_non_nullable
              as String,
      appPromptType: null == appPromptType
          ? _self.appPromptType
          : appPromptType // ignore: cast_nullable_to_non_nullable
              as String,
      originalImage: null == originalImage
          ? _self.originalImage
          : originalImage // ignore: cast_nullable_to_non_nullable
              as String,
      makeResultType: null == makeResultType
          ? _self.makeResultType
          : makeResultType // ignore: cast_nullable_to_non_nullable
              as String,
      resolution: null == resolution
          ? _self.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as Resolution,
      imageRequire: null == imageRequire
          ? _self.imageRequire
          : imageRequire // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }

  /// Create a copy of TemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResolutionCopyWith<$Res> get resolution {
    return $ResolutionCopyWith<$Res>(_self.resolution, (value) {
      return _then(_self.copyWith(resolution: value));
    });
  }
}

/// Adds pattern-matching-related methods to [TemplateModel].
extension TemplateModelPatterns on TemplateModel {
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
    TResult Function(_TemplateModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TemplateModel() when $default != null:
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
    TResult Function(_TemplateModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateModel():
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
    TResult? Function(_TemplateModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateModel() when $default != null:
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
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'cover_url') String coverUrl,
            @JsonKey(name: 'video_cover_url') String videoCoverUrl,
            @JsonKey(name: 'video_first_frame') String videoFirstFrame,
            @JsonKey(name: 'status') int status,
            @JsonKey(name: 'sort_order') int sortOrder,
            @JsonKey(name: 'max_version') String maxVersion,
            @JsonKey(name: 'category_id') int categoryId,
            @JsonKey(name: 'main_class') int mainClass,
            @JsonKey(name: 'description') String description,
            @JsonKey(name: 'create_at') String createAt,
            @JsonKey(name: 'update_at') String updateAt,
            @JsonKey(name: 'diamond_cost') int diamondCost,
            @JsonKey(name: 'make_type') String makeType,
            @JsonKey(name: 'photo_ratio') String photoRatio,
            @JsonKey(name: 'app_prompt_type') String appPromptType,
            @JsonKey(name: 'original_image') String originalImage,
            @JsonKey(name: 'make_result_type') String makeResultType,
            @JsonKey(name: 'resolution') Resolution resolution,
            @JsonKey(name: 'image_require') Map<String, dynamic> imageRequire)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TemplateModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.coverUrl,
            _that.videoCoverUrl,
            _that.videoFirstFrame,
            _that.status,
            _that.sortOrder,
            _that.maxVersion,
            _that.categoryId,
            _that.mainClass,
            _that.description,
            _that.createAt,
            _that.updateAt,
            _that.diamondCost,
            _that.makeType,
            _that.photoRatio,
            _that.appPromptType,
            _that.originalImage,
            _that.makeResultType,
            _that.resolution,
            _that.imageRequire);
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
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'cover_url') String coverUrl,
            @JsonKey(name: 'video_cover_url') String videoCoverUrl,
            @JsonKey(name: 'video_first_frame') String videoFirstFrame,
            @JsonKey(name: 'status') int status,
            @JsonKey(name: 'sort_order') int sortOrder,
            @JsonKey(name: 'max_version') String maxVersion,
            @JsonKey(name: 'category_id') int categoryId,
            @JsonKey(name: 'main_class') int mainClass,
            @JsonKey(name: 'description') String description,
            @JsonKey(name: 'create_at') String createAt,
            @JsonKey(name: 'update_at') String updateAt,
            @JsonKey(name: 'diamond_cost') int diamondCost,
            @JsonKey(name: 'make_type') String makeType,
            @JsonKey(name: 'photo_ratio') String photoRatio,
            @JsonKey(name: 'app_prompt_type') String appPromptType,
            @JsonKey(name: 'original_image') String originalImage,
            @JsonKey(name: 'make_result_type') String makeResultType,
            @JsonKey(name: 'resolution') Resolution resolution,
            @JsonKey(name: 'image_require') Map<String, dynamic> imageRequire)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateModel():
        return $default(
            _that.id,
            _that.name,
            _that.coverUrl,
            _that.videoCoverUrl,
            _that.videoFirstFrame,
            _that.status,
            _that.sortOrder,
            _that.maxVersion,
            _that.categoryId,
            _that.mainClass,
            _that.description,
            _that.createAt,
            _that.updateAt,
            _that.diamondCost,
            _that.makeType,
            _that.photoRatio,
            _that.appPromptType,
            _that.originalImage,
            _that.makeResultType,
            _that.resolution,
            _that.imageRequire);
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
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'cover_url') String coverUrl,
            @JsonKey(name: 'video_cover_url') String videoCoverUrl,
            @JsonKey(name: 'video_first_frame') String videoFirstFrame,
            @JsonKey(name: 'status') int status,
            @JsonKey(name: 'sort_order') int sortOrder,
            @JsonKey(name: 'max_version') String maxVersion,
            @JsonKey(name: 'category_id') int categoryId,
            @JsonKey(name: 'main_class') int mainClass,
            @JsonKey(name: 'description') String description,
            @JsonKey(name: 'create_at') String createAt,
            @JsonKey(name: 'update_at') String updateAt,
            @JsonKey(name: 'diamond_cost') int diamondCost,
            @JsonKey(name: 'make_type') String makeType,
            @JsonKey(name: 'photo_ratio') String photoRatio,
            @JsonKey(name: 'app_prompt_type') String appPromptType,
            @JsonKey(name: 'original_image') String originalImage,
            @JsonKey(name: 'make_result_type') String makeResultType,
            @JsonKey(name: 'resolution') Resolution resolution,
            @JsonKey(name: 'image_require') Map<String, dynamic> imageRequire)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.coverUrl,
            _that.videoCoverUrl,
            _that.videoFirstFrame,
            _that.status,
            _that.sortOrder,
            _that.maxVersion,
            _that.categoryId,
            _that.mainClass,
            _that.description,
            _that.createAt,
            _that.updateAt,
            _that.diamondCost,
            _that.makeType,
            _that.photoRatio,
            _that.appPromptType,
            _that.originalImage,
            _that.makeResultType,
            _that.resolution,
            _that.imageRequire);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TemplateModel with DiagnosticableTreeMixin implements TemplateModel {
  const _TemplateModel(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'cover_url') this.coverUrl = '',
      @JsonKey(name: 'video_cover_url') this.videoCoverUrl = '',
      @JsonKey(name: 'video_first_frame') this.videoFirstFrame = '',
      @JsonKey(name: 'status') this.status = -1,
      @JsonKey(name: 'sort_order') this.sortOrder = -1,
      @JsonKey(name: 'max_version') this.maxVersion = '',
      @JsonKey(name: 'category_id') this.categoryId = -1,
      @JsonKey(name: 'main_class') this.mainClass = -1,
      @JsonKey(name: 'description') this.description = '',
      @JsonKey(name: 'create_at') this.createAt = '',
      @JsonKey(name: 'update_at') this.updateAt = '',
      @JsonKey(name: 'diamond_cost') this.diamondCost = 0,
      @JsonKey(name: 'make_type') this.makeType = '',
      @JsonKey(name: 'photo_ratio') this.photoRatio = '',
      @JsonKey(name: 'app_prompt_type') this.appPromptType = '',
      @JsonKey(name: 'original_image') this.originalImage = '',
      @JsonKey(name: 'make_result_type') this.makeResultType = '',
      @JsonKey(name: 'resolution') this.resolution = const Resolution(),
      @JsonKey(name: 'image_require')
      final Map<String, dynamic> imageRequire = const {}})
      : _imageRequire = imageRequire;
  factory _TemplateModel.fromJson(Map<String, dynamic> json) =>
      _$TemplateModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'cover_url')
  final String coverUrl;
  @override
  @JsonKey(name: 'video_cover_url')
  final String videoCoverUrl;
  @override
  @JsonKey(name: 'video_first_frame')
  final String videoFirstFrame;
  @override
  @JsonKey(name: 'status')
  final int status;
  @override
  @JsonKey(name: 'sort_order')
  final int sortOrder;
  @override
  @JsonKey(name: 'max_version')
  final String maxVersion;
  @override
  @JsonKey(name: 'category_id')
  final int categoryId;
  @override
  @JsonKey(name: 'main_class')
  final int mainClass;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'create_at')
  final String createAt;
  @override
  @JsonKey(name: 'update_at')
  final String updateAt;
  @override
  @JsonKey(name: 'diamond_cost')
  final int diamondCost;
// single_image: 单图制作、double_image: 双图制作
// group_single_image: 组合单图制作、group_double_image: 组合双图制作
  @override
  @JsonKey(name: 'make_type')
  final String makeType;
  @override
  @JsonKey(name: 'photo_ratio')
  final String photoRatio;
// pet: 宠物、 person: 人物
  @override
  @JsonKey(name: 'app_prompt_type')
  final String appPromptType;
// photo类型，原始封面图，用于视觉上效果过渡
  @override
  @JsonKey(name: 'original_image')
  final String originalImage;

  /// 直接指定模板制作结果类型 "image": 图片类型结果 "video": 视频类型结果
  @override
  @JsonKey(name: 'make_result_type')
  final String makeResultType;

  ///图片和视频的分辨率信息
  @override
  @JsonKey(name: 'resolution')
  final Resolution resolution;

  ///下发模板所需上传制作的图片数量以及图片对应的类型
  final Map<String, dynamic> _imageRequire;

  ///下发模板所需上传制作的图片数量以及图片对应的类型
  @override
  @JsonKey(name: 'image_require')
  Map<String, dynamic> get imageRequire {
    if (_imageRequire is EqualUnmodifiableMapView) return _imageRequire;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_imageRequire);
  }

  /// Create a copy of TemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TemplateModelCopyWith<_TemplateModel> get copyWith =>
      __$TemplateModelCopyWithImpl<_TemplateModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TemplateModelToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TemplateModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('coverUrl', coverUrl))
      ..add(DiagnosticsProperty('videoCoverUrl', videoCoverUrl))
      ..add(DiagnosticsProperty('videoFirstFrame', videoFirstFrame))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('sortOrder', sortOrder))
      ..add(DiagnosticsProperty('maxVersion', maxVersion))
      ..add(DiagnosticsProperty('categoryId', categoryId))
      ..add(DiagnosticsProperty('mainClass', mainClass))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('createAt', createAt))
      ..add(DiagnosticsProperty('updateAt', updateAt))
      ..add(DiagnosticsProperty('diamondCost', diamondCost))
      ..add(DiagnosticsProperty('makeType', makeType))
      ..add(DiagnosticsProperty('photoRatio', photoRatio))
      ..add(DiagnosticsProperty('appPromptType', appPromptType))
      ..add(DiagnosticsProperty('originalImage', originalImage))
      ..add(DiagnosticsProperty('makeResultType', makeResultType))
      ..add(DiagnosticsProperty('resolution', resolution))
      ..add(DiagnosticsProperty('imageRequire', imageRequire));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TemplateModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.coverUrl, coverUrl) ||
                other.coverUrl == coverUrl) &&
            (identical(other.videoCoverUrl, videoCoverUrl) ||
                other.videoCoverUrl == videoCoverUrl) &&
            (identical(other.videoFirstFrame, videoFirstFrame) ||
                other.videoFirstFrame == videoFirstFrame) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.maxVersion, maxVersion) ||
                other.maxVersion == maxVersion) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.mainClass, mainClass) ||
                other.mainClass == mainClass) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.diamondCost, diamondCost) ||
                other.diamondCost == diamondCost) &&
            (identical(other.makeType, makeType) ||
                other.makeType == makeType) &&
            (identical(other.photoRatio, photoRatio) ||
                other.photoRatio == photoRatio) &&
            (identical(other.appPromptType, appPromptType) ||
                other.appPromptType == appPromptType) &&
            (identical(other.originalImage, originalImage) ||
                other.originalImage == originalImage) &&
            (identical(other.makeResultType, makeResultType) ||
                other.makeResultType == makeResultType) &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution) &&
            const DeepCollectionEquality()
                .equals(other._imageRequire, _imageRequire));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        coverUrl,
        videoCoverUrl,
        videoFirstFrame,
        status,
        sortOrder,
        maxVersion,
        categoryId,
        mainClass,
        description,
        createAt,
        updateAt,
        diamondCost,
        makeType,
        photoRatio,
        appPromptType,
        originalImage,
        makeResultType,
        resolution,
        const DeepCollectionEquality().hash(_imageRequire)
      ]);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TemplateModel(id: $id, name: $name, coverUrl: $coverUrl, videoCoverUrl: $videoCoverUrl, videoFirstFrame: $videoFirstFrame, status: $status, sortOrder: $sortOrder, maxVersion: $maxVersion, categoryId: $categoryId, mainClass: $mainClass, description: $description, createAt: $createAt, updateAt: $updateAt, diamondCost: $diamondCost, makeType: $makeType, photoRatio: $photoRatio, appPromptType: $appPromptType, originalImage: $originalImage, makeResultType: $makeResultType, resolution: $resolution, imageRequire: $imageRequire)';
  }
}

/// @nodoc
abstract mixin class _$TemplateModelCopyWith<$Res>
    implements $TemplateModelCopyWith<$Res> {
  factory _$TemplateModelCopyWith(
          _TemplateModel value, $Res Function(_TemplateModel) _then) =
      __$TemplateModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'cover_url') String coverUrl,
      @JsonKey(name: 'video_cover_url') String videoCoverUrl,
      @JsonKey(name: 'video_first_frame') String videoFirstFrame,
      @JsonKey(name: 'status') int status,
      @JsonKey(name: 'sort_order') int sortOrder,
      @JsonKey(name: 'max_version') String maxVersion,
      @JsonKey(name: 'category_id') int categoryId,
      @JsonKey(name: 'main_class') int mainClass,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'create_at') String createAt,
      @JsonKey(name: 'update_at') String updateAt,
      @JsonKey(name: 'diamond_cost') int diamondCost,
      @JsonKey(name: 'make_type') String makeType,
      @JsonKey(name: 'photo_ratio') String photoRatio,
      @JsonKey(name: 'app_prompt_type') String appPromptType,
      @JsonKey(name: 'original_image') String originalImage,
      @JsonKey(name: 'make_result_type') String makeResultType,
      @JsonKey(name: 'resolution') Resolution resolution,
      @JsonKey(name: 'image_require') Map<String, dynamic> imageRequire});

  @override
  $ResolutionCopyWith<$Res> get resolution;
}

/// @nodoc
class __$TemplateModelCopyWithImpl<$Res>
    implements _$TemplateModelCopyWith<$Res> {
  __$TemplateModelCopyWithImpl(this._self, this._then);

  final _TemplateModel _self;
  final $Res Function(_TemplateModel) _then;

  /// Create a copy of TemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? coverUrl = null,
    Object? videoCoverUrl = null,
    Object? videoFirstFrame = null,
    Object? status = null,
    Object? sortOrder = null,
    Object? maxVersion = null,
    Object? categoryId = null,
    Object? mainClass = null,
    Object? description = null,
    Object? createAt = null,
    Object? updateAt = null,
    Object? diamondCost = null,
    Object? makeType = null,
    Object? photoRatio = null,
    Object? appPromptType = null,
    Object? originalImage = null,
    Object? makeResultType = null,
    Object? resolution = null,
    Object? imageRequire = null,
  }) {
    return _then(_TemplateModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      coverUrl: null == coverUrl
          ? _self.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      videoCoverUrl: null == videoCoverUrl
          ? _self.videoCoverUrl
          : videoCoverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      videoFirstFrame: null == videoFirstFrame
          ? _self.videoFirstFrame
          : videoFirstFrame // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      sortOrder: null == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      maxVersion: null == maxVersion
          ? _self.maxVersion
          : maxVersion // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      mainClass: null == mainClass
          ? _self.mainClass
          : mainClass // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _self.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
      updateAt: null == updateAt
          ? _self.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as String,
      diamondCost: null == diamondCost
          ? _self.diamondCost
          : diamondCost // ignore: cast_nullable_to_non_nullable
              as int,
      makeType: null == makeType
          ? _self.makeType
          : makeType // ignore: cast_nullable_to_non_nullable
              as String,
      photoRatio: null == photoRatio
          ? _self.photoRatio
          : photoRatio // ignore: cast_nullable_to_non_nullable
              as String,
      appPromptType: null == appPromptType
          ? _self.appPromptType
          : appPromptType // ignore: cast_nullable_to_non_nullable
              as String,
      originalImage: null == originalImage
          ? _self.originalImage
          : originalImage // ignore: cast_nullable_to_non_nullable
              as String,
      makeResultType: null == makeResultType
          ? _self.makeResultType
          : makeResultType // ignore: cast_nullable_to_non_nullable
              as String,
      resolution: null == resolution
          ? _self.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as Resolution,
      imageRequire: null == imageRequire
          ? _self._imageRequire
          : imageRequire // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }

  /// Create a copy of TemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResolutionCopyWith<$Res> get resolution {
    return $ResolutionCopyWith<$Res>(_self.resolution, (value) {
      return _then(_self.copyWith(resolution: value));
    });
  }
}

/// @nodoc
mixin _$Resolution implements DiagnosticableTreeMixin {
  @JsonKey(name: 'image')
  ResolutionSize get image;
  @JsonKey(name: 'video')
  ResolutionSize get video;

  /// Create a copy of Resolution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResolutionCopyWith<Resolution> get copyWith =>
      _$ResolutionCopyWithImpl<Resolution>(this as Resolution, _$identity);

  /// Serializes this Resolution to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Resolution'))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('video', video));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Resolution &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.video, video) || other.video == video));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, image, video);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Resolution(image: $image, video: $video)';
  }
}

/// @nodoc
abstract mixin class $ResolutionCopyWith<$Res> {
  factory $ResolutionCopyWith(
          Resolution value, $Res Function(Resolution) _then) =
      _$ResolutionCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'image') ResolutionSize image,
      @JsonKey(name: 'video') ResolutionSize video});

  $ResolutionSizeCopyWith<$Res> get image;
  $ResolutionSizeCopyWith<$Res> get video;
}

/// @nodoc
class _$ResolutionCopyWithImpl<$Res> implements $ResolutionCopyWith<$Res> {
  _$ResolutionCopyWithImpl(this._self, this._then);

  final Resolution _self;
  final $Res Function(Resolution) _then;

  /// Create a copy of Resolution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? video = null,
  }) {
    return _then(_self.copyWith(
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as ResolutionSize,
      video: null == video
          ? _self.video
          : video // ignore: cast_nullable_to_non_nullable
              as ResolutionSize,
    ));
  }

  /// Create a copy of Resolution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResolutionSizeCopyWith<$Res> get image {
    return $ResolutionSizeCopyWith<$Res>(_self.image, (value) {
      return _then(_self.copyWith(image: value));
    });
  }

  /// Create a copy of Resolution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResolutionSizeCopyWith<$Res> get video {
    return $ResolutionSizeCopyWith<$Res>(_self.video, (value) {
      return _then(_self.copyWith(video: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Resolution].
extension ResolutionPatterns on Resolution {
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
    TResult Function(_Resolution value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Resolution() when $default != null:
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
    TResult Function(_Resolution value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Resolution():
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
    TResult? Function(_Resolution value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Resolution() when $default != null:
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
    TResult Function(@JsonKey(name: 'image') ResolutionSize image,
            @JsonKey(name: 'video') ResolutionSize video)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Resolution() when $default != null:
        return $default(_that.image, _that.video);
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
    TResult Function(@JsonKey(name: 'image') ResolutionSize image,
            @JsonKey(name: 'video') ResolutionSize video)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Resolution():
        return $default(_that.image, _that.video);
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
    TResult? Function(@JsonKey(name: 'image') ResolutionSize image,
            @JsonKey(name: 'video') ResolutionSize video)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Resolution() when $default != null:
        return $default(_that.image, _that.video);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Resolution with DiagnosticableTreeMixin implements Resolution {
  const _Resolution(
      {@JsonKey(name: 'image') this.image = const ResolutionSize(),
      @JsonKey(name: 'video') this.video = const ResolutionSize()});
  factory _Resolution.fromJson(Map<String, dynamic> json) =>
      _$ResolutionFromJson(json);

  @override
  @JsonKey(name: 'image')
  final ResolutionSize image;
  @override
  @JsonKey(name: 'video')
  final ResolutionSize video;

  /// Create a copy of Resolution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResolutionCopyWith<_Resolution> get copyWith =>
      __$ResolutionCopyWithImpl<_Resolution>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResolutionToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Resolution'))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('video', video));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Resolution &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.video, video) || other.video == video));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, image, video);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Resolution(image: $image, video: $video)';
  }
}

/// @nodoc
abstract mixin class _$ResolutionCopyWith<$Res>
    implements $ResolutionCopyWith<$Res> {
  factory _$ResolutionCopyWith(
          _Resolution value, $Res Function(_Resolution) _then) =
      __$ResolutionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'image') ResolutionSize image,
      @JsonKey(name: 'video') ResolutionSize video});

  @override
  $ResolutionSizeCopyWith<$Res> get image;
  @override
  $ResolutionSizeCopyWith<$Res> get video;
}

/// @nodoc
class __$ResolutionCopyWithImpl<$Res> implements _$ResolutionCopyWith<$Res> {
  __$ResolutionCopyWithImpl(this._self, this._then);

  final _Resolution _self;
  final $Res Function(_Resolution) _then;

  /// Create a copy of Resolution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? image = null,
    Object? video = null,
  }) {
    return _then(_Resolution(
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as ResolutionSize,
      video: null == video
          ? _self.video
          : video // ignore: cast_nullable_to_non_nullable
              as ResolutionSize,
    ));
  }

  /// Create a copy of Resolution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResolutionSizeCopyWith<$Res> get image {
    return $ResolutionSizeCopyWith<$Res>(_self.image, (value) {
      return _then(_self.copyWith(image: value));
    });
  }

  /// Create a copy of Resolution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResolutionSizeCopyWith<$Res> get video {
    return $ResolutionSizeCopyWith<$Res>(_self.video, (value) {
      return _then(_self.copyWith(video: value));
    });
  }
}

/// @nodoc
mixin _$ResolutionSize implements DiagnosticableTreeMixin {
  @JsonKey(name: 'width')
  int get width;
  @JsonKey(name: 'height')
  int get height;

  /// Create a copy of ResolutionSize
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResolutionSizeCopyWith<ResolutionSize> get copyWith =>
      _$ResolutionSizeCopyWithImpl<ResolutionSize>(
          this as ResolutionSize, _$identity);

  /// Serializes this ResolutionSize to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ResolutionSize'))
      ..add(DiagnosticsProperty('width', width))
      ..add(DiagnosticsProperty('height', height));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResolutionSize &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, width, height);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResolutionSize(width: $width, height: $height)';
  }
}

/// @nodoc
abstract mixin class $ResolutionSizeCopyWith<$Res> {
  factory $ResolutionSizeCopyWith(
          ResolutionSize value, $Res Function(ResolutionSize) _then) =
      _$ResolutionSizeCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'width') int width, @JsonKey(name: 'height') int height});
}

/// @nodoc
class _$ResolutionSizeCopyWithImpl<$Res>
    implements $ResolutionSizeCopyWith<$Res> {
  _$ResolutionSizeCopyWithImpl(this._self, this._then);

  final ResolutionSize _self;
  final $Res Function(ResolutionSize) _then;

  /// Create a copy of ResolutionSize
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_self.copyWith(
      width: null == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [ResolutionSize].
extension ResolutionSizePatterns on ResolutionSize {
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
    TResult Function(_ResolutionSize value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ResolutionSize() when $default != null:
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
    TResult Function(_ResolutionSize value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResolutionSize():
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
    TResult? Function(_ResolutionSize value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResolutionSize() when $default != null:
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
    TResult Function(@JsonKey(name: 'width') int width,
            @JsonKey(name: 'height') int height)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ResolutionSize() when $default != null:
        return $default(_that.width, _that.height);
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
    TResult Function(@JsonKey(name: 'width') int width,
            @JsonKey(name: 'height') int height)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResolutionSize():
        return $default(_that.width, _that.height);
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
    TResult? Function(@JsonKey(name: 'width') int width,
            @JsonKey(name: 'height') int height)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResolutionSize() when $default != null:
        return $default(_that.width, _that.height);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ResolutionSize with DiagnosticableTreeMixin implements ResolutionSize {
  const _ResolutionSize(
      {@JsonKey(name: 'width') this.width = 0,
      @JsonKey(name: 'height') this.height = 0});
  factory _ResolutionSize.fromJson(Map<String, dynamic> json) =>
      _$ResolutionSizeFromJson(json);

  @override
  @JsonKey(name: 'width')
  final int width;
  @override
  @JsonKey(name: 'height')
  final int height;

  /// Create a copy of ResolutionSize
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResolutionSizeCopyWith<_ResolutionSize> get copyWith =>
      __$ResolutionSizeCopyWithImpl<_ResolutionSize>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResolutionSizeToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ResolutionSize'))
      ..add(DiagnosticsProperty('width', width))
      ..add(DiagnosticsProperty('height', height));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResolutionSize &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, width, height);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResolutionSize(width: $width, height: $height)';
  }
}

/// @nodoc
abstract mixin class _$ResolutionSizeCopyWith<$Res>
    implements $ResolutionSizeCopyWith<$Res> {
  factory _$ResolutionSizeCopyWith(
          _ResolutionSize value, $Res Function(_ResolutionSize) _then) =
      __$ResolutionSizeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'width') int width, @JsonKey(name: 'height') int height});
}

/// @nodoc
class __$ResolutionSizeCopyWithImpl<$Res>
    implements _$ResolutionSizeCopyWith<$Res> {
  __$ResolutionSizeCopyWithImpl(this._self, this._then);

  final _ResolutionSize _self;
  final $Res Function(_ResolutionSize) _then;

  /// Create a copy of ResolutionSize
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_ResolutionSize(
      width: null == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
