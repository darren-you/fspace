import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'template_model.freezed.dart';
part 'template_model.g.dart';

enum SelPicType {
  pet,
  human,
  humanAndPet,
}

enum UploadImageType {
  petImage('pet_image'),
  personImage('person_image');

  final String value;
  const UploadImageType(this.value);
}

/// 模板信息
@freezed
abstract class TemplateModel with _$TemplateModel {
  const factory TemplateModel({
    @Default(-1) @JsonKey(name: 'id') int id,
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'cover_url') String coverUrl,
    @Default('') @JsonKey(name: 'video_cover_url') String videoCoverUrl,
    @Default('') @JsonKey(name: 'video_first_frame') String videoFirstFrame,
    @Default(-1) @JsonKey(name: 'status') int status,
    @Default(-1) @JsonKey(name: 'sort_order') int sortOrder,
    @Default('') @JsonKey(name: 'max_version') String maxVersion,
    @Default(-1) @JsonKey(name: 'category_id') int categoryId,
    @Default(-1) @JsonKey(name: 'main_class') int mainClass,
    @Default('') @JsonKey(name: 'description') String description,
    @Default('') @JsonKey(name: 'create_at') String createAt,
    @Default('') @JsonKey(name: 'update_at') String updateAt,
    @Default(0) @JsonKey(name: 'diamond_cost') int diamondCost,
    // single_image: 单图制作、double_image: 双图制作
    // group_single_image: 组合单图制作、group_double_image: 组合双图制作
    @Default('') @JsonKey(name: 'make_type') String makeType,
    @Default('') @JsonKey(name: 'photo_ratio') String photoRatio,
    // pet: 宠物、 person: 人物
    @Default('') @JsonKey(name: 'app_prompt_type') String appPromptType,
    // photo类型，原始封面图，用于视觉上效果过渡
    @Default('') @JsonKey(name: 'original_image') String originalImage,

    /// 直接指定模板制作结果类型 "image": 图片类型结果 "video": 视频类型结果
    @Default('') @JsonKey(name: 'make_result_type') String makeResultType,

    ///图片和视频的分辨率信息
    @Default(Resolution()) @JsonKey(name: 'resolution') Resolution resolution,

    ///下发模板所需上传制作的图片数量以及图片对应的类型
    @Default({})
    @JsonKey(name: 'image_require')
    Map<String, dynamic> imageRequire,
  }) = _TemplateModel;

  factory TemplateModel.fromJson(Map<String, Object?> json) =>
      _$TemplateModelFromJson(json);
}

@freezed
abstract class Resolution with _$Resolution {
  const factory Resolution({
    @Default(ResolutionSize()) @JsonKey(name: 'image') ResolutionSize image,
    @Default(ResolutionSize()) @JsonKey(name: 'video') ResolutionSize video,
  }) = _Resolution;

  factory Resolution.fromJson(Map<String, Object?> json) =>
      _$ResolutionFromJson(json);
}

@freezed
abstract class ResolutionSize with _$ResolutionSize {
  const factory ResolutionSize({
    @Default(0) @JsonKey(name: 'width') int width,
    @Default(0) @JsonKey(name: 'height') int height,
  }) = _ResolutionSize;

  factory ResolutionSize.fromJson(Map<String, Object?> json) =>
      _$ResolutionSizeFromJson(json);
}
