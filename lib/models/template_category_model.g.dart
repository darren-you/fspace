// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TemplateCategoryModel _$TemplateCategoryModelFromJson(
        Map<String, dynamic> json) =>
    _TemplateCategoryModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['name'] as String? ?? '',
      sort: (json['sort'] as num?)?.toInt() ?? -1,
      maxVersion: json['max_version'] as String? ?? '',
      maxVersionInt: (json['max_version_int'] as num?)?.toInt() ?? -1,
      isActive: (json['is_active'] as num?)?.toInt() ?? 1,
      isDelete: (json['is_delete'] as num?)?.toInt() ?? -1,
      createAt: json['create_at'] as String? ?? '',
      updateAt: json['update_at'] as String? ?? '',
      mainClass: (json['main_class'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$TemplateCategoryModelToJson(
        _TemplateCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sort': instance.sort,
      'max_version': instance.maxVersion,
      'max_version_int': instance.maxVersionInt,
      'is_active': instance.isActive,
      'is_delete': instance.isDelete,
      'create_at': instance.createAt,
      'update_at': instance.updateAt,
      'main_class': instance.mainClass,
    };
