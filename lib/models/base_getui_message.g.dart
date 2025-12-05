// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_getui_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BaseGetuiMessage<T> _$BaseGetuiMessageFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _BaseGetuiMessage<T>(
      type: json['type'] as String? ?? '',
      msg: json['msg'] as String? ?? '',
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      time: (json['time'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$BaseGetuiMessageToJson<T>(
  _BaseGetuiMessage<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'type': instance.type,
      'msg': instance.msg,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'time': instance.time,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
