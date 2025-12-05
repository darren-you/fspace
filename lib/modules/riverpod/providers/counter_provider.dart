import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build() => 0;

  /// 计数加1
  void increment() => state++;

  /// 计数置0
  void reset() => state = 0;
}
