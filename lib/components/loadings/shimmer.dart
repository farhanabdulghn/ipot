import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

@immutable
class Shimmer extends StatefulWidget {
  final Duration period;
  final int loop;
  final bool enabled;
  final Widget child;

  const Shimmer({
    super.key,
    this.period = const Duration(milliseconds: 1500),
    this.loop = 0,
    this.enabled = true,
    required this.child,
  });

  @override
  State<Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  int _count = 0;

  static final Gradient _defaultGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xFFD9D9D9),
      Color(0xFFD9D9D9),
      Color(0xFFECECEC),
      Color(0xFFD9D9D9),
      Color(0xFFD9D9D9),
    ],
    stops: <double>[0.0, 0.35, 0.5, 0.65, 1.0],
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.period)
      ..addStatusListener((status) {
        if (status != AnimationStatus.completed) return;
        _count++;
        if (widget.loop <= 0) {
          _controller.repeat();
        } else if (_count < widget.loop) {
          _controller.forward(from: 0.0);
        }
      });

    if (widget.enabled) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant Shimmer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enabled) {
      _controller.forward();
    } else {
      _controller.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) {
        return _Shimmer(
          percent: _controller.value,
          gradient: _defaultGradient,
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

@immutable
class _Shimmer extends SingleChildRenderObjectWidget {
  final double percent;
  final Gradient gradient;

  const _Shimmer({super.child, required this.percent, required this.gradient});

  @override
  _ShimmerFilter createRenderObject(BuildContext context) {
    return _ShimmerFilter(percent, gradient);
  }

  @override
  void updateRenderObject(BuildContext context, _ShimmerFilter renderObject) {
    renderObject
      ..percent = percent
      ..gradient = gradient;
  }
}

class _ShimmerFilter extends RenderProxyBox {
  double _percent;
  Gradient _gradient;

  _ShimmerFilter(this._percent, this._gradient);

  @override
  ShaderMaskLayer? get layer => super.layer as ShaderMaskLayer?;

  @override
  bool get alwaysNeedsCompositing => child != null;

  set percent(double value) {
    if (value == _percent) return;
    _percent = value;
    markNeedsPaint();
  }

  set gradient(Gradient value) {
    if (value == _gradient) return;
    _gradient = value;
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) {
      layer = null;
      return;
    }

    final width = child!.size.width;
    final height = child!.size.height;

    final dx = _lerp(-width, width, _percent);
    final rect = Rect.fromLTWH(dx - width, 0, 3 * width, height);

    layer ??= ShaderMaskLayer();
    layer!
      ..shader = _gradient.createShader(rect)
      ..maskRect = offset & size
      ..blendMode = BlendMode.srcIn;

    context.pushLayer(layer!, super.paint, offset);
  }

  double _lerp(double start, double end, double t) {
    return start + (end - start) * t;
  }
}
