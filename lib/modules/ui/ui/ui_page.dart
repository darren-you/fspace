import 'package:flutter/material.dart';
import 'package:fspace/base/base.dart';
import 'package:fspace/modules/ui/ui/ui_menu_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UiPage extends ConsumerWidget {
  const UiPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MAppBar(
        backgroundColor: Colors.white,
        enabledBackIcon: false,
        enabledBackdrop: false,
      ),
      backgroundColor: Colors.grey.withValues(alpha: 0.4),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        // color: Colors.grey,
        child: ListView.builder(
          itemCount: _buildFunMenuList(context).length,
          itemBuilder: (context, index) {
            return _buildFunMenuList(context)[index];
          },
        ),
      ),
    );
  }

  List<Widget> _buildFunMenuList(BuildContext context) {
    return [
      LineWidget(),
      UiMenuItem(title: 'UI示例'),
      LineWidget(),
    ];
  }
}
