import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'template_category_model.freezed.dart';
part 'template_category_model.g.dart';

/// 模板分类
@freezed
abstract class TemplateCategoryModel with _$TemplateCategoryModel {
  const factory TemplateCategoryModel({
    @Default(-1) int id,
    @Default('') String name,
    @Default(-1) int sort,
    @JsonKey(name: 'max_version') @Default('') String maxVersion,
    @JsonKey(name: 'max_version_int') @Default(-1) int maxVersionInt,
    @JsonKey(name: 'is_active') @Default(1) int isActive,
    @JsonKey(name: 'is_delete') @Default(-1) int isDelete,
    @JsonKey(name: 'create_at') @Default('') String createAt,
    @JsonKey(name: 'update_at') @Default('') String updateAt,
    @JsonKey(name: 'main_class') @Default(1) int mainClass,
  }) = _TemplateCategoryModel;

  factory TemplateCategoryModel.fromJson(Map<String, Object?> json) =>
      _$TemplateCategoryModelFromJson(json);
}
