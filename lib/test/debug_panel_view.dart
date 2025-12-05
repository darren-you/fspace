import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/router_provider.dart';

/// Debug模式下显示调试面板
class DraggableDebugPanel extends ConsumerStatefulWidget {
  const DraggableDebugPanel({super.key});

  @override
  ConsumerState<DraggableDebugPanel> createState() =>
      _DraggableDebugPanelState();
}

class _DraggableDebugPanelState extends ConsumerState<DraggableDebugPanel> {
  Offset position = const Offset(16, 100);

  void _updatePosition(Offset delta) {
    final size = MediaQuery.of(context).size;
    final box = context.findRenderObject() as RenderBox;
    final panelSize = box.size;

    setState(() {
      position = Offset(
        position.dx +
            delta.dx.clamp(
              -position.dx,
              size.width - position.dx - panelSize.width,
            ),
        position.dy +
            delta.dy.clamp(
              -position.dy,
              size.height - position.dy - panelSize.height,
            ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.read(routerProvider);

    return Positioned(
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          _updatePosition(details.delta);
        },
        child: Container(
          padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
          decoration: BoxDecoration(
            color:
                const Color.fromARGB(255, 163, 163, 163).withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 8)),
              Container(
                width: 40,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 16)),
              const Material(
                color: Colors.transparent,
                child: Text(
                  'Debug调试面板',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              // const Padding(padding: EdgeInsets.only(bottom: 16)),
              // ElevatedButton(
              //   onPressed: () => router.push('/voiceclone'),
              //   child: const Text('声音克隆'),
              // ),
              // const Padding(padding: EdgeInsets.only(bottom: 16)),
              // ElevatedButton(
              //   onPressed: () => router.push('/sxtest'),
              //   child: const Text('SXVideo'),
              // ),
              // const Padding(padding: EdgeInsets.only(bottom: 16)),
              // ElevatedButton(
              //   onPressed: () => router.push('/genlyrictest'),
              //   child: const Text('歌词生成测试'),
              // ),
              const Padding(padding: EdgeInsets.only(bottom: 16)),
              ElevatedButton(
                onPressed: () => router.push('/markets'),
                child: const Text('应用市场测试'),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 16)),
              ElevatedButton(
                onPressed: () => router.push('/test'),
                child: const Text('测试Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
