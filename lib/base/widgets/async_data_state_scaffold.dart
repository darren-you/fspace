import 'package:flutter/cupertino.dart';
import 'package:fspace/base/extension/build_context_extension.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fspace/generated/l10n/l10n.dart';

typedef IsEmptyCallback<T> = bool Function(T value);

class AsyncDataStateScaffold<T> extends StatelessWidget {
  const AsyncDataStateScaffold({
    super.key,
    required this.data,
    this.onReload,
    this.refreshNeedLoading = true,
    this.padding,
    this.isSliver = false,
    this.emptyCallback,
    this.emptyWidget,
    this.loadingWidget,
    required this.builder,
  });

  final AsyncValue<T> data;
  final VoidCallback? onReload;
  final bool refreshNeedLoading;
  final EdgeInsets? padding;
  final bool isSliver;
  final IsEmptyCallback? emptyCallback;
  final Widget? emptyWidget;
  final Widget? loadingWidget;
  final Widget Function(T value) builder;

  @override
  Widget build(BuildContext context) {
    switch (data) {
      case AsyncData() when data.isLoading && refreshNeedLoading:
      case AsyncLoading():
        Widget child = loadingWidget ??
            Container(
              alignment: Alignment.center,
              padding: padding,
              child: const CommonLoadingView(),
            );
        return isSliver
            ? SafeArea(child: SliverToBoxAdapter(child: child))
            : child;
      case AsyncData(:final value):
        bool isEmpty = false;
        if (emptyCallback != null) {
          isEmpty = emptyCallback!(value);
        } else {
          if (value is List) {
            isEmpty = value.isEmpty;
          }
        }
        if (isEmpty && onReload != null) {
          Widget child = emptyWidget ??
              Container(
                alignment: Alignment.center,
                padding: padding,
                child: CommonLoadingFailureView(onReload: onReload!),
              );
          return isSliver
              ? SafeArea(child: SliverToBoxAdapter(child: child))
              : SafeArea(child: child);
        }
        return builder(value);
      default:
        Widget child = Container(
          alignment: Alignment.center,
          padding: padding,
          child: onReload != null
              ? CommonLoadingFailureView(onReload: onReload!)
              : null,
        );
        return isSliver
            ? SafeArea(child: SliverToBoxAdapter(child: child))
            : SafeArea(child: child);
    }
  }
}

class CommonLoadingView extends StatelessWidget {
  const CommonLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        radius: 10, // 默认半径是 10，适当调大更符合 iOS 设计
        color: CupertinoColors.systemGrey, // 使用 iOS 系统灰色
      ),
    );
  }
}

class CommonLoadingFailureView extends StatelessWidget {
  const CommonLoadingFailureView({
    super.key,
    required this.onReload,
  });

  final VoidCallback onReload;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            alignment: Alignment.center,
            child: Text(
              t.common.loadFail,
              style: TextStyle(
                fontSize: 17,
                height: 24.0 / 17,
                color: context.appColors.textSecond,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CupertinoButton(
              onPressed: onReload,
              padding: EdgeInsets.zero,
              child: Container(
                height: 48,
                alignment: Alignment.center,
                child: Text(
                  t.common.tryAgain,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: context.appColors.textMain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
