// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TemplateModel _$TemplateModelFromJson(Map<String, dynamic> json) =>
    _TemplateModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['name'] as String? ?? '',
      coverUrl: json['cover_url'] as String? ?? '',
      videoCoverUrl: json['video_cover_url'] as String? ?? '',
      videoFirstFrame: json['video_first_frame'] as String? ?? '',
      status: (json['status'] as num?)?.toInt() ?? -1,
      sortOrder: (json['sort_order'] as num?)?.toInt() ?? -1,
      maxVersion: json['max_version'] as String? ?? '',
      categoryId: (json['category_id'] as num?)?.toInt() ?? -1,
      mainClass: (json['main_class'] as num?)?.toInt() ?? -1,
      description: json['description'] as String? ?? '',
      createAt: json['create_at'] as String? ?? '',
      updateAt: json['update_at'] as String? ?? '',
      diamondCost: (json['diamond_cost'] as num?)?.toInt() ?? 0,
      makeType: json['make_type'] as String? ?? '',
      photoRatio: json['photo_ratio'] as String? ?? '',
      appPromptType: json['app_prompt_type'] as String? ?? '',
      originalImage: json['original_image'] as String? ?? '',
      makeResultType: json['make_result_type'] as String? ?? '',
      resolution: json['resolution'] == null
          ? const Resolution()
          : Resolution.fromJson(json['resolution'] as Map<String, dynamic>),
      imageRequire: json['image_require'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$TemplateModelToJson(_TemplateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cover_url': instance.coverUrl,
      'video_cover_url': instance.videoCoverUrl,
      'video_first_frame': instance.videoFirstFrame,
      'status': instance.status,
      'sort_order': instance.sortOrder,
      'max_version': instance.maxVersion,
      'category_id': instance.categoryId,
      'main_class': instance.mainClass,
      'description': instance.description,
      'create_at': instance.createAt,
      'update_at': instance.updateAt,
      'diamond_cost': instance.diamondCost,
      'make_type': instance.makeType,
      'photo_ratio': instance.photoRatio,
      'app_prompt_type': instance.appPromptType,
      'original_image': instance.originalImage,
      'make_result_type': instance.makeResultType,
      'resolution': instance.resolution,
      'image_require': instance.imageRequire,
    };

_Resolution _$ResolutionFromJson(Map<String, dynamic> json) => _Resolution(
      image: json['image'] == null
          ? const ResolutionSize()
          : ResolutionSize.fromJson(json['image'] as Map<String, dynamic>),
      video: json['video'] == null
          ? const ResolutionSize()
          : ResolutionSize.fromJson(json['video'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResolutionToJson(_Resolution instance) =>
    <String, dynamic>{
      'image': instance.image,
      'video': instance.video,
    };

_ResolutionSize _$ResolutionSizeFromJson(Map<String, dynamic> json) =>
    _ResolutionSize(
      width: (json['width'] as num?)?.toInt() ?? 0,
      height: (json['height'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ResolutionSizeToJson(_ResolutionSize instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };
