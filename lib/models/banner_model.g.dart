// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BannerModel _$BannerModelFromJson(Map<String, dynamic> json) => _BannerModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      title: json['title'] as String? ?? '',
      image: json['image'] as String? ?? '',
      video: json['video'] as String? ?? '',
      desc: json['desc'] as String? ?? '',
      sort: (json['sort'] as num?)?.toInt() ?? 1,
      isActive: (json['is_active'] as num?)?.toInt() ?? 1,
      createAt: json['create_at'] as String? ?? '',
      updateAt: json['update_at'] as String? ?? '',
      isDelete: (json['is_delete'] as num?)?.toInt() ?? -1,
      maxVersion: json['max_version'] as String? ?? '',
      maxVersionInt: (json['max_version_int'] as num?)?.toInt() ?? -1,
      templateId: (json['template_id'] as num?)?.toInt() ?? -1,
      categoryId: (json['category_id'] as num?)?.toInt() ?? -1,
      categoryName: json['category_name'] as String? ?? '',
      location: json['location'] as String? ?? '',
      jumpParam: json['jump_param'] as String? ?? '',
    );

Map<String, dynamic> _$BannerModelToJson(_BannerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'video': instance.video,
      'desc': instance.desc,
      'sort': instance.sort,
      'is_active': instance.isActive,
      'create_at': instance.createAt,
      'update_at': instance.updateAt,
      'is_delete': instance.isDelete,
      'max_version': instance.maxVersion,
      'max_version_int': instance.maxVersionInt,
      'template_id': instance.templateId,
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'location': instance.location,
      'jump_param': instance.jumpParam,
    };
