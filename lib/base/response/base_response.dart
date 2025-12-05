import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

/// 响应数据结构
/// {
///     "code": 200,
///     "msg": "success",
///     "data": "业务数据",
///     "meta": {
///         "trace_id": "740a3e21-7da8-4ab7-8a3d-16b64217eaa9_1753154684072",
///         "timestamp": 1753154684084
///     }
/// }

@Freezed(genericArgumentFactories: true)
abstract class BaseResponse<T> with _$BaseResponse<T> {
  const factory BaseResponse({
    @Default(-1) int code,
    @Default('') String msg,
    T? data,
    Meta? meta,
  }) = _BaseResponse<T>;

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);
}

@Freezed(genericArgumentFactories: true)
abstract class Meta with _$Meta {
  const factory Meta({
    @JsonKey(name: 'trace_id') @Default('') String traceId,
    @Default(-1) int timestamp,
  }) = _Meta;

  factory Meta.fromJson(Map<String, Object?> json) => _$MetaFromJson(json);
}
