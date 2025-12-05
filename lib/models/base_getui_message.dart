import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_getui_message.freezed.dart';
part 'base_getui_message.g.dart';

/// 个推静默消息Model
@Freezed(genericArgumentFactories: true)
abstract class BaseGetuiMessage<T> with _$BaseGetuiMessage<T> {
  const factory BaseGetuiMessage({
    @JsonKey(name: 'type') @Default('') String type,
    @JsonKey(name: 'msg') @Default('') String msg,
    @JsonKey(name: 'data') T? data,
    @JsonKey(name: 'time') @Default(-1) int time,
  }) = _BaseGetuiMessage<T>;

  factory BaseGetuiMessage.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$BaseGetuiMessageFromJson(json, fromJsonT);
}
