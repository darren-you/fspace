// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppConfigModel implements DiagnosticableTreeMixin {
  @JsonKey(name: 'search_prompt')
  List<String> get searchPrompt;
  @JsonKey(name: 'search_prompt_remark')
  String get searchPromptRemark;
  @JsonKey(name: 'pic_ratio')
  List<String> get picRatio;
  @JsonKey(name: 'pic_ratio_remark')
  String get picRatioRemark;
  @JsonKey(name: 'video_ratio')
  List<String> get videoRatio;
  @JsonKey(name: 'video_ratio_remark')
  String get videoRatioRemark;
  @JsonKey(name: 'video_resolutions')
  List<String> get videoResolutions;
  @JsonKey(name: 'video_resolutions_remark')
  String get videoResolutionsRemark;
  @JsonKey(name: 'video_duration')
  List<String> get videoDuration;
  @JsonKey(name: 'video_duration_remark')
  String get videoDurationRemark;
  @JsonKey(name: 'prompt_make_cost')
  PromptMakeCost get promptMakeCost;

  /// Create a copy of AppConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppConfigModelCopyWith<AppConfigModel> get copyWith =>
      _$AppConfigModelCopyWithImpl<AppConfigModel>(
          this as AppConfigModel, _$identity);

  /// Serializes this AppConfigModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'AppConfigModel'))
      ..add(DiagnosticsProperty('searchPrompt', searchPrompt))
      ..add(DiagnosticsProperty('searchPromptRemark', searchPromptRemark))
      ..add(DiagnosticsProperty('picRatio', picRatio))
      ..add(DiagnosticsProperty('picRatioRemark', picRatioRemark))
      ..add(DiagnosticsProperty('videoRatio', videoRatio))
      ..add(DiagnosticsProperty('videoRatioRemark', videoRatioRemark))
      ..add(DiagnosticsProperty('videoResolutions', videoResolutions))
      ..add(
          DiagnosticsProperty('videoResolutionsRemark', videoResolutionsRemark))
      ..add(DiagnosticsProperty('videoDuration', videoDuration))
      ..add(DiagnosticsProperty('videoDurationRemark', videoDurationRemark))
      ..add(DiagnosticsProperty('promptMakeCost', promptMakeCost));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppConfigModel &&
            const DeepCollectionEquality()
                .equals(other.searchPrompt, searchPrompt) &&
            (identical(other.searchPromptRemark, searchPromptRemark) ||
                other.searchPromptRemark == searchPromptRemark) &&
            const DeepCollectionEquality().equals(other.picRatio, picRatio) &&
            (identical(other.picRatioRemark, picRatioRemark) ||
                other.picRatioRemark == picRatioRemark) &&
            const DeepCollectionEquality()
                .equals(other.videoRatio, videoRatio) &&
            (identical(other.videoRatioRemark, videoRatioRemark) ||
                other.videoRatioRemark == videoRatioRemark) &&
            const DeepCollectionEquality()
                .equals(other.videoResolutions, videoResolutions) &&
            (identical(other.videoResolutionsRemark, videoResolutionsRemark) ||
                other.videoResolutionsRemark == videoResolutionsRemark) &&
            const DeepCollectionEquality()
                .equals(other.videoDuration, videoDuration) &&
            (identical(other.videoDurationRemark, videoDurationRemark) ||
                other.videoDurationRemark == videoDurationRemark) &&
            (identical(other.promptMakeCost, promptMakeCost) ||
                other.promptMakeCost == promptMakeCost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(searchPrompt),
      searchPromptRemark,
      const DeepCollectionEquality().hash(picRatio),
      picRatioRemark,
      const DeepCollectionEquality().hash(videoRatio),
      videoRatioRemark,
      const DeepCollectionEquality().hash(videoResolutions),
      videoResolutionsRemark,
      const DeepCollectionEquality().hash(videoDuration),
      videoDurationRemark,
      promptMakeCost);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppConfigModel(searchPrompt: $searchPrompt, searchPromptRemark: $searchPromptRemark, picRatio: $picRatio, picRatioRemark: $picRatioRemark, videoRatio: $videoRatio, videoRatioRemark: $videoRatioRemark, videoResolutions: $videoResolutions, videoResolutionsRemark: $videoResolutionsRemark, videoDuration: $videoDuration, videoDurationRemark: $videoDurationRemark, promptMakeCost: $promptMakeCost)';
  }
}

/// @nodoc
abstract mixin class $AppConfigModelCopyWith<$Res> {
  factory $AppConfigModelCopyWith(
          AppConfigModel value, $Res Function(AppConfigModel) _then) =
      _$AppConfigModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'search_prompt') List<String> searchPrompt,
      @JsonKey(name: 'search_prompt_remark') String searchPromptRemark,
      @JsonKey(name: 'pic_ratio') List<String> picRatio,
      @JsonKey(name: 'pic_ratio_remark') String picRatioRemark,
      @JsonKey(name: 'video_ratio') List<String> videoRatio,
      @JsonKey(name: 'video_ratio_remark') String videoRatioRemark,
      @JsonKey(name: 'video_resolutions') List<String> videoResolutions,
      @JsonKey(name: 'video_resolutions_remark') String videoResolutionsRemark,
      @JsonKey(name: 'video_duration') List<String> videoDuration,
      @JsonKey(name: 'video_duration_remark') String videoDurationRemark,
      @JsonKey(name: 'prompt_make_cost') PromptMakeCost promptMakeCost});

  $PromptMakeCostCopyWith<$Res> get promptMakeCost;
}

/// @nodoc
class _$AppConfigModelCopyWithImpl<$Res>
    implements $AppConfigModelCopyWith<$Res> {
  _$AppConfigModelCopyWithImpl(this._self, this._then);

  final AppConfigModel _self;
  final $Res Function(AppConfigModel) _then;

  /// Create a copy of AppConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchPrompt = null,
    Object? searchPromptRemark = null,
    Object? picRatio = null,
    Object? picRatioRemark = null,
    Object? videoRatio = null,
    Object? videoRatioRemark = null,
    Object? videoResolutions = null,
    Object? videoResolutionsRemark = null,
    Object? videoDuration = null,
    Object? videoDurationRemark = null,
    Object? promptMakeCost = null,
  }) {
    return _then(_self.copyWith(
      searchPrompt: null == searchPrompt
          ? _self.searchPrompt
          : searchPrompt // ignore: cast_nullable_to_non_nullable
              as List<String>,
      searchPromptRemark: null == searchPromptRemark
          ? _self.searchPromptRemark
          : searchPromptRemark // ignore: cast_nullable_to_non_nullable
              as String,
      picRatio: null == picRatio
          ? _self.picRatio
          : picRatio // ignore: cast_nullable_to_non_nullable
              as List<String>,
      picRatioRemark: null == picRatioRemark
          ? _self.picRatioRemark
          : picRatioRemark // ignore: cast_nullable_to_non_nullable
              as String,
      videoRatio: null == videoRatio
          ? _self.videoRatio
          : videoRatio // ignore: cast_nullable_to_non_nullable
              as List<String>,
      videoRatioRemark: null == videoRatioRemark
          ? _self.videoRatioRemark
          : videoRatioRemark // ignore: cast_nullable_to_non_nullable
              as String,
      videoResolutions: null == videoResolutions
          ? _self.videoResolutions
          : videoResolutions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      videoResolutionsRemark: null == videoResolutionsRemark
          ? _self.videoResolutionsRemark
          : videoResolutionsRemark // ignore: cast_nullable_to_non_nullable
              as String,
      videoDuration: null == videoDuration
          ? _self.videoDuration
          : videoDuration // ignore: cast_nullable_to_non_nullable
              as List<String>,
      videoDurationRemark: null == videoDurationRemark
          ? _self.videoDurationRemark
          : videoDurationRemark // ignore: cast_nullable_to_non_nullable
              as String,
      promptMakeCost: null == promptMakeCost
          ? _self.promptMakeCost
          : promptMakeCost // ignore: cast_nullable_to_non_nullable
              as PromptMakeCost,
    ));
  }

  /// Create a copy of AppConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PromptMakeCostCopyWith<$Res> get promptMakeCost {
    return $PromptMakeCostCopyWith<$Res>(_self.promptMakeCost, (value) {
      return _then(_self.copyWith(promptMakeCost: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AppConfigModel].
extension AppConfigModelPatterns on AppConfigModel {
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
    TResult Function(_AppConfigModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppConfigModel() when $default != null:
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
    TResult Function(_AppConfigModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppConfigModel():
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
    TResult? Function(_AppConfigModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppConfigModel() when $default != null:
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
            @JsonKey(name: 'search_prompt') List<String> searchPrompt,
            @JsonKey(name: 'search_prompt_remark') String searchPromptRemark,
            @JsonKey(name: 'pic_ratio') List<String> picRatio,
            @JsonKey(name: 'pic_ratio_remark') String picRatioRemark,
            @JsonKey(name: 'video_ratio') List<String> videoRatio,
            @JsonKey(name: 'video_ratio_remark') String videoRatioRemark,
            @JsonKey(name: 'video_resolutions') List<String> videoResolutions,
            @JsonKey(name: 'video_resolutions_remark')
            String videoResolutionsRemark,
            @JsonKey(name: 'video_duration') List<String> videoDuration,
            @JsonKey(name: 'video_duration_remark') String videoDurationRemark,
            @JsonKey(name: 'prompt_make_cost') PromptMakeCost promptMakeCost)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppConfigModel() when $default != null:
        return $default(
            _that.searchPrompt,
            _that.searchPromptRemark,
            _that.picRatio,
            _that.picRatioRemark,
            _that.videoRatio,
            _that.videoRatioRemark,
            _that.videoResolutions,
            _that.videoResolutionsRemark,
            _that.videoDuration,
            _that.videoDurationRemark,
            _that.promptMakeCost);
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
            @JsonKey(name: 'search_prompt') List<String> searchPrompt,
            @JsonKey(name: 'search_prompt_remark') String searchPromptRemark,
            @JsonKey(name: 'pic_ratio') List<String> picRatio,
            @JsonKey(name: 'pic_ratio_remark') String picRatioRemark,
            @JsonKey(name: 'video_ratio') List<String> videoRatio,
            @JsonKey(name: 'video_ratio_remark') String videoRatioRemark,
            @JsonKey(name: 'video_resolutions') List<String> videoResolutions,
            @JsonKey(name: 'video_resolutions_remark')
            String videoResolutionsRemark,
            @JsonKey(name: 'video_duration') List<String> videoDuration,
            @JsonKey(name: 'video_duration_remark') String videoDurationRemark,
            @JsonKey(name: 'prompt_make_cost') PromptMakeCost promptMakeCost)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppConfigModel():
        return $default(
            _that.searchPrompt,
            _that.searchPromptRemark,
            _that.picRatio,
            _that.picRatioRemark,
            _that.videoRatio,
            _that.videoRatioRemark,
            _that.videoResolutions,
            _that.videoResolutionsRemark,
            _that.videoDuration,
            _that.videoDurationRemark,
            _that.promptMakeCost);
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
            @JsonKey(name: 'search_prompt') List<String> searchPrompt,
            @JsonKey(name: 'search_prompt_remark') String searchPromptRemark,
            @JsonKey(name: 'pic_ratio') List<String> picRatio,
            @JsonKey(name: 'pic_ratio_remark') String picRatioRemark,
            @JsonKey(name: 'video_ratio') List<String> videoRatio,
            @JsonKey(name: 'video_ratio_remark') String videoRatioRemark,
            @JsonKey(name: 'video_resolutions') List<String> videoResolutions,
            @JsonKey(name: 'video_resolutions_remark')
            String videoResolutionsRemark,
            @JsonKey(name: 'video_duration') List<String> videoDuration,
            @JsonKey(name: 'video_duration_remark') String videoDurationRemark,
            @JsonKey(name: 'prompt_make_cost') PromptMakeCost promptMakeCost)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppConfigModel() when $default != null:
        return $default(
            _that.searchPrompt,
            _that.searchPromptRemark,
            _that.picRatio,
            _that.picRatioRemark,
            _that.videoRatio,
            _that.videoRatioRemark,
            _that.videoResolutions,
            _that.videoResolutionsRemark,
            _that.videoDuration,
            _that.videoDurationRemark,
            _that.promptMakeCost);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AppConfigModel with DiagnosticableTreeMixin implements AppConfigModel {
  const _AppConfigModel(
      {@JsonKey(name: 'search_prompt')
      final List<String> searchPrompt = const [],
      @JsonKey(name: 'search_prompt_remark') this.searchPromptRemark = '',
      @JsonKey(name: 'pic_ratio') final List<String> picRatio = const [],
      @JsonKey(name: 'pic_ratio_remark') this.picRatioRemark = '',
      @JsonKey(name: 'video_ratio') final List<String> videoRatio = const [],
      @JsonKey(name: 'video_ratio_remark') this.videoRatioRemark = '',
      @JsonKey(name: 'video_resolutions')
      final List<String> videoResolutions = const [],
      @JsonKey(name: 'video_resolutions_remark')
      this.videoResolutionsRemark = '',
      @JsonKey(name: 'video_duration')
      final List<String> videoDuration = const [],
      @JsonKey(name: 'video_duration_remark') this.videoDurationRemark = '',
      @JsonKey(name: 'prompt_make_cost')
      this.promptMakeCost = const PromptMakeCost()})
      : _searchPrompt = searchPrompt,
        _picRatio = picRatio,
        _videoRatio = videoRatio,
        _videoResolutions = videoResolutions,
        _videoDuration = videoDuration;
  factory _AppConfigModel.fromJson(Map<String, dynamic> json) =>
      _$AppConfigModelFromJson(json);

  final List<String> _searchPrompt;
  @override
  @JsonKey(name: 'search_prompt')
  List<String> get searchPrompt {
    if (_searchPrompt is EqualUnmodifiableListView) return _searchPrompt;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchPrompt);
  }

  @override
  @JsonKey(name: 'search_prompt_remark')
  final String searchPromptRemark;
  final List<String> _picRatio;
  @override
  @JsonKey(name: 'pic_ratio')
  List<String> get picRatio {
    if (_picRatio is EqualUnmodifiableListView) return _picRatio;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_picRatio);
  }

  @override
  @JsonKey(name: 'pic_ratio_remark')
  final String picRatioRemark;
  final List<String> _videoRatio;
  @override
  @JsonKey(name: 'video_ratio')
  List<String> get videoRatio {
    if (_videoRatio is EqualUnmodifiableListView) return _videoRatio;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoRatio);
  }

  @override
  @JsonKey(name: 'video_ratio_remark')
  final String videoRatioRemark;
  final List<String> _videoResolutions;
  @override
  @JsonKey(name: 'video_resolutions')
  List<String> get videoResolutions {
    if (_videoResolutions is EqualUnmodifiableListView)
      return _videoResolutions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoResolutions);
  }

  @override
  @JsonKey(name: 'video_resolutions_remark')
  final String videoResolutionsRemark;
  final List<String> _videoDuration;
  @override
  @JsonKey(name: 'video_duration')
  List<String> get videoDuration {
    if (_videoDuration is EqualUnmodifiableListView) return _videoDuration;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoDuration);
  }

  @override
  @JsonKey(name: 'video_duration_remark')
  final String videoDurationRemark;
  @override
  @JsonKey(name: 'prompt_make_cost')
  final PromptMakeCost promptMakeCost;

  /// Create a copy of AppConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppConfigModelCopyWith<_AppConfigModel> get copyWith =>
      __$AppConfigModelCopyWithImpl<_AppConfigModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppConfigModelToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'AppConfigModel'))
      ..add(DiagnosticsProperty('searchPrompt', searchPrompt))
      ..add(DiagnosticsProperty('searchPromptRemark', searchPromptRemark))
      ..add(DiagnosticsProperty('picRatio', picRatio))
      ..add(DiagnosticsProperty('picRatioRemark', picRatioRemark))
      ..add(DiagnosticsProperty('videoRatio', videoRatio))
      ..add(DiagnosticsProperty('videoRatioRemark', videoRatioRemark))
      ..add(DiagnosticsProperty('videoResolutions', videoResolutions))
      ..add(
          DiagnosticsProperty('videoResolutionsRemark', videoResolutionsRemark))
      ..add(DiagnosticsProperty('videoDuration', videoDuration))
      ..add(DiagnosticsProperty('videoDurationRemark', videoDurationRemark))
      ..add(DiagnosticsProperty('promptMakeCost', promptMakeCost));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppConfigModel &&
            const DeepCollectionEquality()
                .equals(other._searchPrompt, _searchPrompt) &&
            (identical(other.searchPromptRemark, searchPromptRemark) ||
                other.searchPromptRemark == searchPromptRemark) &&
            const DeepCollectionEquality().equals(other._picRatio, _picRatio) &&
            (identical(other.picRatioRemark, picRatioRemark) ||
                other.picRatioRemark == picRatioRemark) &&
            const DeepCollectionEquality()
                .equals(other._videoRatio, _videoRatio) &&
            (identical(other.videoRatioRemark, videoRatioRemark) ||
                other.videoRatioRemark == videoRatioRemark) &&
            const DeepCollectionEquality()
                .equals(other._videoResolutions, _videoResolutions) &&
            (identical(other.videoResolutionsRemark, videoResolutionsRemark) ||
                other.videoResolutionsRemark == videoResolutionsRemark) &&
            const DeepCollectionEquality()
                .equals(other._videoDuration, _videoDuration) &&
            (identical(other.videoDurationRemark, videoDurationRemark) ||
                other.videoDurationRemark == videoDurationRemark) &&
            (identical(other.promptMakeCost, promptMakeCost) ||
                other.promptMakeCost == promptMakeCost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_searchPrompt),
      searchPromptRemark,
      const DeepCollectionEquality().hash(_picRatio),
      picRatioRemark,
      const DeepCollectionEquality().hash(_videoRatio),
      videoRatioRemark,
      const DeepCollectionEquality().hash(_videoResolutions),
      videoResolutionsRemark,
      const DeepCollectionEquality().hash(_videoDuration),
      videoDurationRemark,
      promptMakeCost);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppConfigModel(searchPrompt: $searchPrompt, searchPromptRemark: $searchPromptRemark, picRatio: $picRatio, picRatioRemark: $picRatioRemark, videoRatio: $videoRatio, videoRatioRemark: $videoRatioRemark, videoResolutions: $videoResolutions, videoResolutionsRemark: $videoResolutionsRemark, videoDuration: $videoDuration, videoDurationRemark: $videoDurationRemark, promptMakeCost: $promptMakeCost)';
  }
}

/// @nodoc
abstract mixin class _$AppConfigModelCopyWith<$Res>
    implements $AppConfigModelCopyWith<$Res> {
  factory _$AppConfigModelCopyWith(
          _AppConfigModel value, $Res Function(_AppConfigModel) _then) =
      __$AppConfigModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'search_prompt') List<String> searchPrompt,
      @JsonKey(name: 'search_prompt_remark') String searchPromptRemark,
      @JsonKey(name: 'pic_ratio') List<String> picRatio,
      @JsonKey(name: 'pic_ratio_remark') String picRatioRemark,
      @JsonKey(name: 'video_ratio') List<String> videoRatio,
      @JsonKey(name: 'video_ratio_remark') String videoRatioRemark,
      @JsonKey(name: 'video_resolutions') List<String> videoResolutions,
      @JsonKey(name: 'video_resolutions_remark') String videoResolutionsRemark,
      @JsonKey(name: 'video_duration') List<String> videoDuration,
      @JsonKey(name: 'video_duration_remark') String videoDurationRemark,
      @JsonKey(name: 'prompt_make_cost') PromptMakeCost promptMakeCost});

  @override
  $PromptMakeCostCopyWith<$Res> get promptMakeCost;
}

/// @nodoc
class __$AppConfigModelCopyWithImpl<$Res>
    implements _$AppConfigModelCopyWith<$Res> {
  __$AppConfigModelCopyWithImpl(this._self, this._then);

  final _AppConfigModel _self;
  final $Res Function(_AppConfigModel) _then;

  /// Create a copy of AppConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? searchPrompt = null,
    Object? searchPromptRemark = null,
    Object? picRatio = null,
    Object? picRatioRemark = null,
    Object? videoRatio = null,
    Object? videoRatioRemark = null,
    Object? videoResolutions = null,
    Object? videoResolutionsRemark = null,
    Object? videoDuration = null,
    Object? videoDurationRemark = null,
    Object? promptMakeCost = null,
  }) {
    return _then(_AppConfigModel(
      searchPrompt: null == searchPrompt
          ? _self._searchPrompt
          : searchPrompt // ignore: cast_nullable_to_non_nullable
              as List<String>,
      searchPromptRemark: null == searchPromptRemark
          ? _self.searchPromptRemark
          : searchPromptRemark // ignore: cast_nullable_to_non_nullable
              as String,
      picRatio: null == picRatio
          ? _self._picRatio
          : picRatio // ignore: cast_nullable_to_non_nullable
              as List<String>,
      picRatioRemark: null == picRatioRemark
          ? _self.picRatioRemark
          : picRatioRemark // ignore: cast_nullable_to_non_nullable
              as String,
      videoRatio: null == videoRatio
          ? _self._videoRatio
          : videoRatio // ignore: cast_nullable_to_non_nullable
              as List<String>,
      videoRatioRemark: null == videoRatioRemark
          ? _self.videoRatioRemark
          : videoRatioRemark // ignore: cast_nullable_to_non_nullable
              as String,
      videoResolutions: null == videoResolutions
          ? _self._videoResolutions
          : videoResolutions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      videoResolutionsRemark: null == videoResolutionsRemark
          ? _self.videoResolutionsRemark
          : videoResolutionsRemark // ignore: cast_nullable_to_non_nullable
              as String,
      videoDuration: null == videoDuration
          ? _self._videoDuration
          : videoDuration // ignore: cast_nullable_to_non_nullable
              as List<String>,
      videoDurationRemark: null == videoDurationRemark
          ? _self.videoDurationRemark
          : videoDurationRemark // ignore: cast_nullable_to_non_nullable
              as String,
      promptMakeCost: null == promptMakeCost
          ? _self.promptMakeCost
          : promptMakeCost // ignore: cast_nullable_to_non_nullable
              as PromptMakeCost,
    ));
  }

  /// Create a copy of AppConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PromptMakeCostCopyWith<$Res> get promptMakeCost {
    return $PromptMakeCostCopyWith<$Res>(_self.promptMakeCost, (value) {
      return _then(_self.copyWith(promptMakeCost: value));
    });
  }
}

/// @nodoc
mixin _$PromptMakeCost implements DiagnosticableTreeMixin {
  @JsonKey(name: 'make_image_cost')
  String get makeImageCost;
  @JsonKey(name: 'make_video_cost')
  String get makeVideoCost;
  @JsonKey(name: 'make_lip_sync_cost')
  String get makeLipSyncCost;

  /// Create a copy of PromptMakeCost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PromptMakeCostCopyWith<PromptMakeCost> get copyWith =>
      _$PromptMakeCostCopyWithImpl<PromptMakeCost>(
          this as PromptMakeCost, _$identity);

  /// Serializes this PromptMakeCost to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'PromptMakeCost'))
      ..add(DiagnosticsProperty('makeImageCost', makeImageCost))
      ..add(DiagnosticsProperty('makeVideoCost', makeVideoCost))
      ..add(DiagnosticsProperty('makeLipSyncCost', makeLipSyncCost));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PromptMakeCost &&
            (identical(other.makeImageCost, makeImageCost) ||
                other.makeImageCost == makeImageCost) &&
            (identical(other.makeVideoCost, makeVideoCost) ||
                other.makeVideoCost == makeVideoCost) &&
            (identical(other.makeLipSyncCost, makeLipSyncCost) ||
                other.makeLipSyncCost == makeLipSyncCost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, makeImageCost, makeVideoCost, makeLipSyncCost);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PromptMakeCost(makeImageCost: $makeImageCost, makeVideoCost: $makeVideoCost, makeLipSyncCost: $makeLipSyncCost)';
  }
}

/// @nodoc
abstract mixin class $PromptMakeCostCopyWith<$Res> {
  factory $PromptMakeCostCopyWith(
          PromptMakeCost value, $Res Function(PromptMakeCost) _then) =
      _$PromptMakeCostCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'make_image_cost') String makeImageCost,
      @JsonKey(name: 'make_video_cost') String makeVideoCost,
      @JsonKey(name: 'make_lip_sync_cost') String makeLipSyncCost});
}

/// @nodoc
class _$PromptMakeCostCopyWithImpl<$Res>
    implements $PromptMakeCostCopyWith<$Res> {
  _$PromptMakeCostCopyWithImpl(this._self, this._then);

  final PromptMakeCost _self;
  final $Res Function(PromptMakeCost) _then;

  /// Create a copy of PromptMakeCost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? makeImageCost = null,
    Object? makeVideoCost = null,
    Object? makeLipSyncCost = null,
  }) {
    return _then(_self.copyWith(
      makeImageCost: null == makeImageCost
          ? _self.makeImageCost
          : makeImageCost // ignore: cast_nullable_to_non_nullable
              as String,
      makeVideoCost: null == makeVideoCost
          ? _self.makeVideoCost
          : makeVideoCost // ignore: cast_nullable_to_non_nullable
              as String,
      makeLipSyncCost: null == makeLipSyncCost
          ? _self.makeLipSyncCost
          : makeLipSyncCost // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [PromptMakeCost].
extension PromptMakeCostPatterns on PromptMakeCost {
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
    TResult Function(_PromptMakeCost value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromptMakeCost() when $default != null:
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
    TResult Function(_PromptMakeCost value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromptMakeCost():
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
    TResult? Function(_PromptMakeCost value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromptMakeCost() when $default != null:
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
            @JsonKey(name: 'make_image_cost') String makeImageCost,
            @JsonKey(name: 'make_video_cost') String makeVideoCost,
            @JsonKey(name: 'make_lip_sync_cost') String makeLipSyncCost)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PromptMakeCost() when $default != null:
        return $default(
            _that.makeImageCost, _that.makeVideoCost, _that.makeLipSyncCost);
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
            @JsonKey(name: 'make_image_cost') String makeImageCost,
            @JsonKey(name: 'make_video_cost') String makeVideoCost,
            @JsonKey(name: 'make_lip_sync_cost') String makeLipSyncCost)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromptMakeCost():
        return $default(
            _that.makeImageCost, _that.makeVideoCost, _that.makeLipSyncCost);
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
            @JsonKey(name: 'make_image_cost') String makeImageCost,
            @JsonKey(name: 'make_video_cost') String makeVideoCost,
            @JsonKey(name: 'make_lip_sync_cost') String makeLipSyncCost)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PromptMakeCost() when $default != null:
        return $default(
            _that.makeImageCost, _that.makeVideoCost, _that.makeLipSyncCost);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PromptMakeCost with DiagnosticableTreeMixin implements PromptMakeCost {
  const _PromptMakeCost(
      {@JsonKey(name: 'make_image_cost') this.makeImageCost = '',
      @JsonKey(name: 'make_video_cost') this.makeVideoCost = '',
      @JsonKey(name: 'make_lip_sync_cost') this.makeLipSyncCost = ''});
  factory _PromptMakeCost.fromJson(Map<String, dynamic> json) =>
      _$PromptMakeCostFromJson(json);

  @override
  @JsonKey(name: 'make_image_cost')
  final String makeImageCost;
  @override
  @JsonKey(name: 'make_video_cost')
  final String makeVideoCost;
  @override
  @JsonKey(name: 'make_lip_sync_cost')
  final String makeLipSyncCost;

  /// Create a copy of PromptMakeCost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PromptMakeCostCopyWith<_PromptMakeCost> get copyWith =>
      __$PromptMakeCostCopyWithImpl<_PromptMakeCost>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PromptMakeCostToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'PromptMakeCost'))
      ..add(DiagnosticsProperty('makeImageCost', makeImageCost))
      ..add(DiagnosticsProperty('makeVideoCost', makeVideoCost))
      ..add(DiagnosticsProperty('makeLipSyncCost', makeLipSyncCost));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PromptMakeCost &&
            (identical(other.makeImageCost, makeImageCost) ||
                other.makeImageCost == makeImageCost) &&
            (identical(other.makeVideoCost, makeVideoCost) ||
                other.makeVideoCost == makeVideoCost) &&
            (identical(other.makeLipSyncCost, makeLipSyncCost) ||
                other.makeLipSyncCost == makeLipSyncCost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, makeImageCost, makeVideoCost, makeLipSyncCost);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PromptMakeCost(makeImageCost: $makeImageCost, makeVideoCost: $makeVideoCost, makeLipSyncCost: $makeLipSyncCost)';
  }
}

/// @nodoc
abstract mixin class _$PromptMakeCostCopyWith<$Res>
    implements $PromptMakeCostCopyWith<$Res> {
  factory _$PromptMakeCostCopyWith(
          _PromptMakeCost value, $Res Function(_PromptMakeCost) _then) =
      __$PromptMakeCostCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'make_image_cost') String makeImageCost,
      @JsonKey(name: 'make_video_cost') String makeVideoCost,
      @JsonKey(name: 'make_lip_sync_cost') String makeLipSyncCost});
}

/// @nodoc
class __$PromptMakeCostCopyWithImpl<$Res>
    implements _$PromptMakeCostCopyWith<$Res> {
  __$PromptMakeCostCopyWithImpl(this._self, this._then);

  final _PromptMakeCost _self;
  final $Res Function(_PromptMakeCost) _then;

  /// Create a copy of PromptMakeCost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? makeImageCost = null,
    Object? makeVideoCost = null,
    Object? makeLipSyncCost = null,
  }) {
    return _then(_PromptMakeCost(
      makeImageCost: null == makeImageCost
          ? _self.makeImageCost
          : makeImageCost // ignore: cast_nullable_to_non_nullable
              as String,
      makeVideoCost: null == makeVideoCost
          ? _self.makeVideoCost
          : makeVideoCost // ignore: cast_nullable_to_non_nullable
              as String,
      makeLipSyncCost: null == makeLipSyncCost
          ? _self.makeLipSyncCost
          : makeLipSyncCost // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
