import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'app_config_model.freezed.dart';
part 'app_config_model.g.dart';

@freezed
abstract class AppConfigModel with _$AppConfigModel {
  const factory AppConfigModel({
    @JsonKey(name: 'search_prompt') @Default([]) List<String> searchPrompt,
    @JsonKey(name: 'search_prompt_remark')
    @Default('')
    String searchPromptRemark,
    @JsonKey(name: 'pic_ratio') @Default([]) List<String> picRatio,
    @JsonKey(name: 'pic_ratio_remark') @Default('') String picRatioRemark,
    @JsonKey(name: 'video_ratio') @Default([]) List<String> videoRatio,
    @JsonKey(name: 'video_ratio_remark') @Default('') String videoRatioRemark,
    @JsonKey(name: 'video_resolutions')
    @Default([])
    List<String> videoResolutions,
    @JsonKey(name: 'video_resolutions_remark')
    @Default('')
    String videoResolutionsRemark,
    @JsonKey(name: 'video_duration') @Default([]) List<String> videoDuration,
    @JsonKey(name: 'video_duration_remark')
    @Default('')
    String videoDurationRemark,
    @JsonKey(name: 'prompt_make_cost')
    @Default(PromptMakeCost())
    PromptMakeCost promptMakeCost,
  }) = _AppConfigModel;

  factory AppConfigModel.fromJson(Map<String, Object?> json) =>
      _$AppConfigModelFromJson(json);
}

@freezed
abstract class PromptMakeCost with _$PromptMakeCost {
  const factory PromptMakeCost({
    @JsonKey(name: 'make_image_cost') @Default('') String makeImageCost,
    @JsonKey(name: 'make_video_cost') @Default('') String makeVideoCost,
    @JsonKey(name: 'make_lip_sync_cost') @Default('') String makeLipSyncCost,
  }) = _PromptMakeCost;

  factory PromptMakeCost.fromJson(Map<String, Object?> json) =>
      _$PromptMakeCostFromJson(json);
}
