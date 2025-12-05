import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fspace/base/extension/build_context_extension.dart';
import 'package:fspace/base/widgets/custom_container.dart';
import 'package:fspace/generated/assets.gen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'swiper_page_demo.g.dart';

// 动画配置常量
class SwiperAnimationConfig {
  /// 卡片退出时的旋转系数，控制左侧卡片的旋转角度
  static const double exitRotationFactor = 1.2;

  /// 卡片进入时的旋转系数，控制右侧卡片的旋转角度
  static const double enterRotationFactor = 1.2;

  /// 卡片缩放系数，控制非当前卡片的缩放比例
  static const double scaleFactor = 0.6;

  /// 星星闪烁动画持续时间
  static const Duration starAnimationDuration = Duration(milliseconds: 3000);

  /// 魔法棒敲击动画持续时间
  static const Duration magicWandDuration = Duration(milliseconds: 800);
}

// 卡片数据模型
class SwiperCardData {
  final int index;
  final Color color;
  final String title;

  const SwiperCardData({
    required this.index,
    required this.color,
    required this.title,
  });
}

// Swiper状态模型
class SwiperState {
  final int currentIndex;
  final double pageOffset;
  final bool isScrolling;
  final bool showStars;
  final int? pendingAnimationIndex;
  final List<SwiperCardData> cards;

  const SwiperState({
    required this.currentIndex,
    required this.pageOffset,
    required this.isScrolling,
    required this.showStars,
    this.pendingAnimationIndex,
    required this.cards,
  });

  SwiperState copyWith({
    int? currentIndex,
    double? pageOffset,
    bool? isScrolling,
    bool? showStars,
    int? pendingAnimationIndex,
    List<SwiperCardData>? cards,
  }) {
    return SwiperState(
      currentIndex: currentIndex ?? this.currentIndex,
      pageOffset: pageOffset ?? this.pageOffset,
      isScrolling: isScrolling ?? this.isScrolling,
      showStars: showStars ?? this.showStars,
      pendingAnimationIndex:
          pendingAnimationIndex ?? this.pendingAnimationIndex,
      cards: cards ?? this.cards,
    );
  }
}

// 辅助方法：生成贝塞尔曲线控制点
List<Offset> _generateBezierCurvePoints(int random, double randomRadius) {
  final points = <Offset>[];

  // 减少控制点数量 (2-4个) - 减少方向变化
  final pointCount = 2 + (random % 3);

  for (int i = 0; i < pointCount; i++) {
    final angle = (i / pointCount) * 2 * math.pi;
    // 减少半径变化幅度，使轨迹更平滑
    final radiusVariation =
        0.9 + 0.2 * math.sin(angle * 2 + (random % 100) / 100.0 * math.pi);
    final radius = randomRadius * radiusVariation;

    // 减少角度偏移，使轨迹更规律
    final angleOffset = ((random + i * 137) % 15) / 200.0;
    final adjustedAngle = angle + angleOffset;

    final x = radius * math.cos(adjustedAngle);
    final y = radius * math.sin(adjustedAngle);

    points.add(Offset(x, y));
  }

  // 确保最后一个点接近第一个点，形成闭合轨迹，保证回到原始位置附近
  if (points.isNotEmpty) {
    final firstPoint = points.first;
    final lastIndex = points.length - 1;
    final lastPoint = points[lastIndex];

    // 调整最后一个点，使其更接近第一个点
    final adjustedLastPoint = Offset(
      (lastPoint.dx + firstPoint.dx) * 0.5,
      (lastPoint.dy + firstPoint.dy) * 0.5,
    );
    points[lastIndex] = adjustedLastPoint;
  }

  return points;
}

// 辅助方法：计算曲线位置
Offset _calculateCurvePosition(
    double t, List<Offset> curvePoints, double randomSpeed, bool clockwise) {
  if (curvePoints.isEmpty) return Offset.zero;

  // 使用贝塞尔曲线插值
  final adjustedT = clockwise ? t : 1.0 - t;
  final scaledT = (adjustedT * randomSpeed) % 1.0;

  if (curvePoints.length == 1) return curvePoints[0];

  // 使用三次贝塞尔曲线插值实现圆滑过渡
  final segmentCount = curvePoints.length;
  final segmentT = scaledT * segmentCount;
  final segmentIndex = segmentT.floor() % segmentCount;
  final localT = segmentT - segmentT.floor();

  // 获取四个控制点进行三次贝塞尔插值
  final p0 = curvePoints[(segmentIndex - 1 + segmentCount) % segmentCount];
  final p1 = curvePoints[segmentIndex];
  final p2 = curvePoints[(segmentIndex + 1) % segmentCount];
  final p3 = curvePoints[(segmentIndex + 2) % segmentCount];

  // Catmull-Rom样条插值，确保曲线圆滑
  final t2 = localT * localT;
  final t3 = t2 * localT;

  final x = 0.5 *
      ((2 * p1.dx) +
          (-p0.dx + p2.dx) * localT +
          (2 * p0.dx - 5 * p1.dx + 4 * p2.dx - p3.dx) * t2 +
          (-p0.dx + 3 * p1.dx - 3 * p2.dx + p3.dx) * t3);

  final y = 0.5 *
      ((2 * p1.dy) +
          (-p0.dy + p2.dy) * localT +
          (2 * p0.dy - 5 * p1.dy + 4 * p2.dy - p3.dy) * t2 +
          (-p0.dy + 3 * p1.dy - 3 * p2.dy + p3.dy) * t3);

  return Offset(x, y);
}

// Swiper状态管理Provider
@riverpod
class SwiperNotifier extends _$SwiperNotifier {
  @override
  SwiperState build() {
    return SwiperState(
      currentIndex: 0,
      pageOffset: 0.0,
      isScrolling: false,
      showStars: false,
      cards: [
        SwiperCardData(index: 0, color: Colors.blue.shade300, title: 'Card: 0'),
        SwiperCardData(
            index: 1, color: Colors.green.shade300, title: 'Card: 1'),
        SwiperCardData(
            index: 2, color: Colors.orange.shade300, title: 'Card: 2'),
        SwiperCardData(
            index: 3, color: Colors.purple.shade300, title: 'Card: 3'),
        SwiperCardData(index: 4, color: Colors.red.shade300, title: 'Card: 4'),
      ],
    );
  }

  void updatePageOffset(double offset) {
    state = state.copyWith(pageOffset: offset);
  }

  void updateCurrentIndex(int index) {
    if (state.currentIndex != index) {
      state = state.copyWith(
        currentIndex: index,
        showStars: false,
        pendingAnimationIndex: index,
      );
    }
  }

  void setScrolling(bool isScrolling) {
    state = state.copyWith(isScrolling: isScrolling);
  }

  void showStarsAnimation() {
    state = state.copyWith(
      showStars: true,
      pendingAnimationIndex: null,
    );
  }

  void hideStars() {
    state = state.copyWith(showStars: false);
  }

  // ignore: avoid_public_notifier_properties
  bool get hasPendingAnimation => state.pendingAnimationIndex != null;
}

// 动画控制器Provider
@riverpod
class AnimationControllers extends _$AnimationControllers {
  @override
  Map<String, AnimationController> build() {
    return {};
  }

  void registerController(String key, AnimationController controller) {
    state = {...state, key: controller};
  }

  AnimationController? getController(String key) {
    return state[key];
  }
}

// 主组件
class SwiperPageDemo extends HookConsumerWidget {
  const SwiperPageDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.appColors.mainBackground,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: SwiperCardWidget(),
      ),
    );
  }
}

// Swiper卡片组件
class SwiperCardWidget extends HookConsumerWidget {
  const SwiperCardWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final swiperState = ref.watch(swiperNotifierProvider);
    final swiperNotifier = ref.read(swiperNotifierProvider.notifier);
    final animationControllers =
        ref.read(animationControllersProvider.notifier);

    final pageController = usePageController();

    // 注册动画控制器
    final starAnimationController = useAnimationController(
      duration: SwiperAnimationConfig.starAnimationDuration,
    );
    final magicWandController = useAnimationController(
      duration: SwiperAnimationConfig.magicWandDuration,
    );

    useEffect(() {
      // 延迟注册动画控制器，避免在 widget 构建期间修改 provider
      Future.microtask(() {
        animationControllers.registerController(
            'star', starAnimationController);
        animationControllers.registerController(
            'magicWand', magicWandController);
      });
      return null;
    }, []);

    // 监听页面滚动
    useEffect(() {
      void listener() {
        if (pageController.hasClients) {
          // 延迟修改 provider 状态
          Future.microtask(() =>
              swiperNotifier.updatePageOffset(pageController.page ?? 0.0));
        }
      }

      pageController.addListener(listener);
      return () => pageController.removeListener(listener);
    }, [pageController]);

    // 处理动画执行
    void executeAnimationIfNeeded() {
      if (swiperNotifier.hasPendingAnimation) {
        swiperNotifier.showStarsAnimation();
        starAnimationController.reset();
        magicWandController.reset();
        magicWandController.forward().then((_) {
          starAnimationController.forward();
        });
      }
    }

    // 初始化动画
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // 延迟修改 provider 状态
        Future.microtask(() {
          swiperNotifier.showStarsAnimation();
          starAnimationController.reset();
          magicWandController.reset();
          magicWandController.forward().then((_) {
            starAnimationController.forward();
          });
        });
      });
      return;
    }, []);

    double cardWidth = MediaQuery.of(context).size.width - 32;
    double cardOffsetX = cardWidth * 0.80;

    return Container(
      height: 350,
      clipBehavior: Clip.none,
      child: Column(
        children: [
          Expanded(
            child: ClipRect(
              clipBehavior: Clip.none,
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  // 延迟修改 provider 状态，避免在构建期间修改
                  Future.microtask(() {
                    if (notification is ScrollStartNotification) {
                      swiperNotifier.setScrolling(true);
                      // 滑动开始时立即隐藏星星动画，避免抖动
                      swiperNotifier.hideStars();
                      starAnimationController.stop();
                      magicWandController.stop();
                    } else if (notification is ScrollEndNotification) {
                      swiperNotifier.setScrolling(false);
                      executeAnimationIfNeeded();
                    }
                  });
                  return false;
                },
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    // 延迟修改 provider 状态
                    Future.microtask(
                        () => swiperNotifier.updateCurrentIndex(index));
                  },
                  itemCount: swiperState.cards.length,
                  padEnds: false,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      margin: EdgeInsets.only(
                        left: 16,
                        top: MediaQuery.of(context).padding.top + 16,
                        right: 16,
                        bottom: 16,
                      ),
                      child: Stack(
                        children: [
                          SwiperCardBack(
                            index: index,
                            cardOffsetX: cardOffsetX,
                            enableFloatingAnimation:
                                index == swiperState.currentIndex &&
                                    swiperState.showStars,
                          ),
                          SwiperCardTop(
                            index: index,
                            starController: starAnimationController,
                            magicWandController: magicWandController,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SwiperIndicator(),
        ],
      ),
    );
  }
}

// 卡片背景组件
class SwiperCardBack extends HookConsumerWidget {
  final int index;
  final double cardOffsetX;
  final bool enableFloatingAnimation;

  // 浮动动画配置参数
  static const Duration _floatingAnimationDuration =
      Duration(milliseconds: 5000);
  static const double _floatingRotationAngle = 0.06; // 约3.4度的旋转
  static const double _floatingPerspective = 0.002; // 透视效果强度
  static const Duration _animationDelayDuration = Duration(milliseconds: 300);
  static const Curve _floatingCurve = Curves.easeInOut;

  const SwiperCardBack({
    super.key,
    required this.index,
    required this.cardOffsetX,
    this.enableFloatingAnimation = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final swiperState = ref.watch(swiperNotifierProvider);
    final cardData = swiperState.cards[index];

    // 始终创建浮动动画控制器，确保Hook顺序一致
    final floatingAnimationController = useAnimationController(
      duration: _floatingAnimationDuration,
    );

    // X轴旋转动画（前半段）- 控制上下边的浮动
    final floatingXRotationAnimation = Tween<double>(
      begin: 0.0,
      end: _floatingRotationAngle,
    ).animate(CurvedAnimation(
      parent: floatingAnimationController,
      curve: const Interval(0.0, 0.5, curve: _floatingCurve),
    ));

    // Y轴旋转动画（后半段）- 控制左右边的浮动
    final floatingYRotationAnimation = Tween<double>(
      begin: 0.0,
      end: _floatingRotationAngle,
    ).animate(CurvedAnimation(
      parent: floatingAnimationController,
      curve: const Interval(0.5, 1.0, curve: _floatingCurve),
    ));

    // Z轴透视动画（全程）- 创建向内向外的浮动效果
    final floatingPerspectiveAnimation = Tween<double>(
      begin: 0.0,
      end: _floatingPerspective,
    ).animate(CurvedAnimation(
      parent: floatingAnimationController,
      curve: _floatingCurve,
    ));

    // 启动循环动画
    useEffect(() {
      if (!enableFloatingAnimation || swiperState.isScrolling) {
        floatingAnimationController.stop();
        floatingAnimationController.reset();
        return null;
      }

      void startFloatingAnimation() {
        if (floatingAnimationController.isAnimating) return;
        floatingAnimationController.repeat(reverse: true);
      }

      // 延迟启动动画，避免与页面切换动画冲突
      final timer =
          Future.delayed(_animationDelayDuration, startFloatingAnimation);

      return () {
        timer.ignore();
        // 不需要手动dispose，useAnimationController会自动处理
      };
    }, [enableFloatingAnimation, swiperState.isScrolling]);

    // 计算变换参数
    final transformData = _calculateTransform(
      index: index,
      pageOffset: swiperState.pageOffset,
      cardOffsetX: cardOffsetX,
    );

    return AnimatedBuilder(
      animation: floatingAnimationController,
      builder: (context, child) {
        return Transform(
          alignment: transformData.rotationAlignment,
          transform: Matrix4.identity()
            ..setEntry(
                3,
                2,
                enableFloatingAnimation
                    ? 0.001 + floatingPerspectiveAnimation.value
                    : 0.001)
            ..translate(transformData.translateX, 0.0, 0.0)
            ..scale(transformData.scale)
            ..rotateZ(transformData.rotationAngle)
            // 添加浮动效果（仅在启用时应用）- 创建四个角的浮动效果
            ..rotateX(enableFloatingAnimation
                ? floatingXRotationAnimation.value
                : 0.0)
            ..rotateY(enableFloatingAnimation
                ? floatingYRotationAnimation.value
                : 0.0),
          child: _buildCardContainer(cardData),
        );
      },
    );
  }

  Widget _buildCardContainer(SwiperCardData cardData) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: cardData.color,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        cardData.title,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  CardTransformData _calculateTransform({
    required int index,
    required double pageOffset,
    required double cardOffsetX,
  }) {
    double offset = pageOffset - index;
    offset = offset.clamp(-1.0, 1.0);

    double rotationAngle = 0.0;
    double scale = 1.0;
    double translateX = 0.0;
    Alignment rotationAlignment = Alignment.center;

    bool isLeftCard = index < pageOffset;
    bool isRightCard = index > pageOffset;

    if (isLeftCard) {
      double leftOffset = pageOffset - index;
      rotationAngle = -leftOffset * SwiperAnimationConfig.exitRotationFactor;
      scale = 1.0 - (leftOffset * SwiperAnimationConfig.scaleFactor);
      translateX = cardOffsetX * leftOffset;
      rotationAlignment = Alignment.bottomLeft;

      if (offset < 0) {
        rotationAngle = -rotationAngle;
        scale = 2.0 - scale;
      }
    } else if (isRightCard) {
      double rightOffset = index - pageOffset;
      rotationAngle = -rightOffset * SwiperAnimationConfig.enterRotationFactor;
      scale = 1.0 - (rightOffset * SwiperAnimationConfig.scaleFactor);
      translateX = -cardOffsetX * rightOffset;
      rotationAlignment = Alignment.topRight;

      if (offset < 0) {
        double progress = 1.0 + offset;
        scale = (1.0 - SwiperAnimationConfig.scaleFactor) +
            (progress * SwiperAnimationConfig.scaleFactor);
      }
    }

    return CardTransformData(
      rotationAngle: rotationAngle,
      scale: scale,
      translateX: translateX,
      rotationAlignment: rotationAlignment,
    );
  }
}

// 变换数据模型
class CardTransformData {
  final double rotationAngle;
  final double scale;
  final double translateX;
  final Alignment rotationAlignment;

  const CardTransformData({
    required this.rotationAngle,
    required this.scale,
    required this.translateX,
    required this.rotationAlignment,
  });
}

// 卡片顶部内容组件
class SwiperCardTop extends ConsumerWidget {
  final int index;
  final AnimationController starController;
  final AnimationController magicWandController;

  const SwiperCardTop({
    super.key,
    required this.index,
    required this.starController,
    required this.magicWandController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final swiperState = ref.watch(swiperNotifierProvider);
    final swiperNotifier = ref.read(swiperNotifierProvider.notifier);

    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SwiperCardTitle(
                index: index,
                showStars:
                    index == swiperState.currentIndex && swiperState.showStars,
                starController: starController,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 16.0)),
              SwiperActionButton(
                onTap: () {
                  swiperNotifier.showStarsAnimation();
                  starController.reset();
                  magicWandController.reset();
                  magicWandController.forward().then((_) {
                    starController.forward();
                  });
                },
                magicWandController: magicWandController,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

// 卡片标题组件
class SwiperCardTitle extends StatelessWidget {
  final int index;
  final bool showStars;
  final AnimationController starController;

  const SwiperCardTitle({
    super.key,
    required this.index,
    required this.showStars,
    required this.starController,
  });

  // 生成唯一的动画key，确保每次showStars变化时都重新构建星星组件
  String get _animationKey =>
      '${DateTime.now().millisecondsSinceEpoch}_${showStars}_$index';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // 黑色描边文字（底层）
          Text(
            '宠物守护神',
            style: TextStyle(
              fontSize: 36,
              fontFamily: 'FZLanTingYuanS-EB-GB',
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 8
                ..color = Colors.black,
            ),
          ),
          // 白色填充文字（上层）
          const Text(
            '宠物守护神',
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontFamily: 'FZLanTingYuanS-EB-GB',
            ),
          ),
          // 星星动画
          if (showStars) ..._buildStars(),
          // 右上角引用
          Positioned(
            right: -12,
            top: -6,
            child: SvgPicture.asset(Assets.svg.makeSameQuote),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildStars() {
    // 使用唯一的动画key，确保每次动画重新开始时都会重新创建StarWidget实例
    return [
      // 左上角星星
      Positioned(
        left: -12,
        top: -26,
        child: StarWidget(
          key: ValueKey('star_top_left_$_animationKey'),
          controller: starController,
          asset: Assets.svg.makeSameTopLeftStar,
          scaleInterval: const Interval(0.0, 0.3, curve: Curves.elasticOut),
          opacityInterval: const Interval(0.0, 0.5, curve: Curves.easeInOut),
        ),
      ),
      // 右下角星星
      Positioned(
        right: -16,
        bottom: -12,
        child: StarWidget(
          key: ValueKey('star_bottom_right_$_animationKey'),
          controller: starController,
          asset: Assets.svg.makeSameBottomRightStar,
          scaleInterval: const Interval(0.2, 0.5, curve: Curves.elasticOut),
          opacityInterval: const Interval(0.2, 0.7, curve: Curves.easeInOut),
        ),
      ),
    ];
  }
}

// 星星动画组件
class StarWidget extends HookConsumerWidget {
  final AnimationController controller;
  final String asset;
  final Interval scaleInterval;
  final Interval opacityInterval;

  const StarWidget({
    super.key,
    required this.controller,
    required this.asset,
    required this.scaleInterval,
    required this.opacityInterval,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 使用useMemoized确保随机曲线数据在动画期间保持稳定，避免滑动时抖动
    // 当key变化时（即每次动画重新开始时）生成新的随机轨迹
    final curveData = useMemoized(() {
      final random = DateTime.now().millisecondsSinceEpoch + asset.hashCode;
      final seed = random % 1000;

      // 生成随机半径 (20-40像素) - 增大运动范围
      final randomRadius = 20.0 + (seed % 20);

      // 生成随机速度系数 (0.8-1.5)
      final randomSpeed = 0.8 + ((seed % 70) / 100.0);

      // 随机方向 (顺时针或逆时针)
      final clockwise = (seed % 2) == 0;

      // 生成贝塞尔曲线控制点
      final curvePoints = _generateBezierCurvePoints(random, randomRadius);

      return {
        'randomRadius': randomRadius,
        'randomSpeed': randomSpeed,
        'clockwise': clockwise,
        'curvePoints': curvePoints,
      };
    }, [key]); // 依赖key变化，每次StarWidget重新创建时生成新轨迹

    final randomSpeed = curveData['randomSpeed'] as double;
    final clockwise = curveData['clockwise'] as bool;
    final curvePoints = curveData['curvePoints'] as List<Offset>;

    // 缩放动画：出现放大 -> 消失缩小
    final scaleAnimation = TweenSequence<double>([
      // 出现阶段：从0放大到1
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 2),
      // 闪烁阶段：保持大小
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 4),
      // 消失阶段：从1缩小到0
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 2),
    ]).animate(controller);

    // 旋转动画：逐渐旋转出现
    final rotationAnimation = Tween<double>(begin: -0.5, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.25, curve: Curves.easeOut),
      ),
    );

    // 透明度动画：出现 -> 闪烁 -> 消失
    final opacityAnimation = TweenSequence<double>([
      // 出现阶段
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 2),
      // 闪烁阶段
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.3), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.3, end: 1.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.3), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.3, end: 1.0), weight: 1),
      // 消失阶段
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 2),
    ]).animate(controller);

    // 金色光效动画
    final goldEffectAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.25, 0.75, curve: Curves.easeInOut),
      ),
    );

    // 曲线轨迹动画 - 在出现和闪烁阶段进行环绕运动，使用easeInOut缓动
    final curveAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.8, curve: Curves.linear),
      ),
    );

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        // 计算当前曲线位置
        final curveOffset = _calculateCurvePosition(
            curveAnimation.value, curvePoints, randomSpeed, clockwise);

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..translate(curveOffset.dx, curveOffset.dy)
            ..scale(scaleAnimation.value)
            ..rotateZ(rotationAnimation.value + curveAnimation.value * 0.5),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: goldEffectAnimation.value > 0
                  ? [
                      BoxShadow(
                        color: Colors.amber.withValues(
                          alpha: goldEffectAnimation.value *
                              opacityAnimation.value *
                              0.8,
                        ),
                        blurRadius: 15 * goldEffectAnimation.value,
                        spreadRadius: 3 * goldEffectAnimation.value,
                        offset: const Offset(0, 0),
                      ),
                    ]
                  : null,
            ),
            child: Opacity(
              opacity: opacityAnimation.value,
              child: SvgPicture.asset(asset),
            ),
          ),
        );
      },
    );
  }
}

// 操作按钮组件
class SwiperActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final AnimationController magicWandController;

  const SwiperActionButton({
    super.key,
    required this.onTap,
    required this.magicWandController,
  });

  @override
  Widget build(BuildContext context) {
    final magicWandTapAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -8.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -8.0, end: 6.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 6.0, end: -2.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -2.0, end: 0.0), weight: 1),
    ]).animate(CurvedAnimation(
      parent: magicWandController,
      curve: Curves.easeInOut,
    ));

    final magicWandRotateAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -0.1), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -0.1, end: 0.15), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 0.15, end: -0.05), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -0.05, end: 0.0), weight: 1),
    ]).animate(CurvedAnimation(
      parent: magicWandController,
      curve: Curves.easeInOut,
    ));

    return UnconstrainedBox(
      child: CustomContainer(
        onTap: onTap,
        duration: const Duration(milliseconds: 200),
        child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Row(
              children: [
                const Text(
                  '立即制作同款',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'FZLanTingYuanS-EB-GB',
                    height: 1.2,
                  ),
                ),
                const SizedBox(width: 4),
                AnimatedBuilder(
                  animation: magicWandController,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..translate(0.0, magicWandTapAnimation.value, 0.0)
                        ..rotateZ(magicWandRotateAnimation.value),
                      child: SvgPicture.asset(Assets.svg.makeSameMagic),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 指示器组件
class SwiperIndicator extends ConsumerWidget {
  const SwiperIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final swiperState = ref.watch(swiperNotifierProvider);

    return Container(
      color: Colors.grey,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          swiperState.cards.length,
          (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: swiperState.currentIndex == index
                  ? Colors.black
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }
}
