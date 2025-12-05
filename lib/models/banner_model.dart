import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

part 'banner_model.freezed.dart';
part 'banner_model.g.dart';

/// 首页轮播
@freezed
abstract class BannerModel with _$BannerModel {
  const factory BannerModel({
    @Default(-1) int id,
    @Default('') String title,
    @Default('') String image,
    @Default('') String video,
    @Default('') String desc,
    @Default(1) int sort,
    @JsonKey(name: 'is_active') @Default(1) int isActive,
    @JsonKey(name: 'create_at') @Default('') String createAt,
    @JsonKey(name: 'update_at') @Default('') String updateAt,
    @JsonKey(name: 'is_delete') @Default(-1) int isDelete,
    @JsonKey(name: 'max_version') @Default('') String maxVersion,
    @JsonKey(name: 'max_version_int') @Default(-1) int maxVersionInt,
    @JsonKey(name: 'template_id') @Default(-1) int templateId,
    @JsonKey(name: 'category_id') @Default(-1) int categoryId,
    @JsonKey(name: 'category_name') @Default('') String categoryName,
    @JsonKey(name: 'location') @Default('') String location,
    @JsonKey(name: 'jump_param') @Default('') String jumpParam,
  }) = _BannerModel;

  factory BannerModel.fromJson(Map<String, Object?> json) =>
      _$BannerModelFromJson(json);
}

extension BannerModelExt on BannerModel {
  /// 是否跳转分类详情
  bool get isToCategroy {
    if (categoryId != 0) {
      return true;
    }
    return false;
  }

  /// 是否跳转模板详情
  bool get isToTemplateInfo {
    if (templateId != 0) {
      return true;
    }
    return false;
  }

  /// 从jump_param获取跳转分类jump_category_id
  int get jumpCategoryId {
    try {
      if (jumpParam.isEmpty) return -1;
      final Map<String, dynamic> params = json.decode(jumpParam);
      return params['jump_category_id'] ?? -1;
    } catch (e) {
      return -1;
    }
  }

  /// 从jump_param获取跳转分类jump_category_name
  String get jumpCategoryName {
    try {
      if (jumpParam.isEmpty) return '';
      final Map<String, dynamic> params = json.decode(jumpParam);
      return params['jump_category_name'] ?? '';
    } catch (e) {
      return '';
    }
  }
}
