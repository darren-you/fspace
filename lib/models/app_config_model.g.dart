// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppConfigModel _$AppConfigModelFromJson(Map<String, dynamic> json) =>
    _AppConfigModel(
      searchPrompt: (json['search_prompt'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      searchPromptRemark: json['search_prompt_remark'] as String? ?? '',
      picRatio: (json['pic_ratio'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      picRatioRemark: json['pic_ratio_remark'] as String? ?? '',
      videoRatio: (json['video_ratio'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      videoRatioRemark: json['video_ratio_remark'] as String? ?? '',
      videoResolutions: (json['video_resolutions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      videoResolutionsRemark: json['video_resolutions_remark'] as String? ?? '',
      videoDuration: (json['video_duration'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      videoDurationRemark: json['video_duration_remark'] as String? ?? '',
      promptMakeCost: json['prompt_make_cost'] == null
          ? const PromptMakeCost()
          : PromptMakeCost.fromJson(
              json['prompt_make_cost'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppConfigModelToJson(_AppConfigModel instance) =>
    <String, dynamic>{
      'search_prompt': instance.searchPrompt,
      'search_prompt_remark': instance.searchPromptRemark,
      'pic_ratio': instance.picRatio,
      'pic_ratio_remark': instance.picRatioRemark,
      'video_ratio': instance.videoRatio,
      'video_ratio_remark': instance.videoRatioRemark,
      'video_resolutions': instance.videoResolutions,
      'video_resolutions_remark': instance.videoResolutionsRemark,
      'video_duration': instance.videoDuration,
      'video_duration_remark': instance.videoDurationRemark,
      'prompt_make_cost': instance.promptMakeCost,
    };

_PromptMakeCost _$PromptMakeCostFromJson(Map<String, dynamic> json) =>
    _PromptMakeCost(
      makeImageCost: json['make_image_cost'] as String? ?? '',
      makeVideoCost: json['make_video_cost'] as String? ?? '',
      makeLipSyncCost: json['make_lip_sync_cost'] as String? ?? '',
    );

Map<String, dynamic> _$PromptMakeCostToJson(_PromptMakeCost instance) =>
    <String, dynamic>{
      'make_image_cost': instance.makeImageCost,
      'make_video_cost': instance.makeVideoCost,
      'make_lip_sync_cost': instance.makeLipSyncCost,
    };
