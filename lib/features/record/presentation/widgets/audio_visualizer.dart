library music_visualizer;

import 'package:flutter/material.dart';

/// Copied from https://github.com/Rajkumar07793/music_visualizer_package
class MusicVisualizer extends StatelessWidget {
  final List<Color> colors;
  final List<int> duration;
  final int barCount;
  final Curve curve;

  const MusicVisualizer({
    super.key,
    required this.colors,
    required this.duration,
    this.barCount = 20,
    this.curve = Curves.easeInQuad,
  })  : assert(colors.length != 0, 'Colors must not be empty'),
        assert(duration.length != 0, 'Duration must not be empty'),
        assert(barCount > 0, 'Bar count must be greater than 0');

  @override
  Widget build(BuildContext context) {
    return Row(
      key: const ValueKey('music_visualizer'),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<Widget>.generate(
        barCount,
        (index) => _VisualComponent(
          curve: curve,
          duration: duration[index % 5],
          color: colors[index % 4],
        ),
      ),
    );
  }
}

class _VisualComponent extends StatefulWidget {
  final int duration;
  final Color color;
  final Curve curve;

  const _VisualComponent({
    Key? key,
    required this.duration,
    required this.color,
    required this.curve,
  }) : super(key: key);

  @override
  __VisualComponentState createState() => __VisualComponentState();
}

class __VisualComponentState extends State<_VisualComponent> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animate();
  }

  @override
  void dispose() {
    animation.removeListener(() {});
    animation.removeStatusListener((status) {});
    animationController.stop();
    animationController.reset();
    animationController.dispose();
    super.dispose();
  }

  void animate() {
    animationController = AnimationController(duration: Duration(milliseconds: widget.duration), vsync: this);
    final curvedAnimation = CurvedAnimation(parent: animationController, curve: widget.curve);
    animation = Tween<double>(begin: 0, end: 40).animate(curvedAnimation)..addListener(update);
    animationController.repeat(reverse: true);
  }

  void update() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: animation.value,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
