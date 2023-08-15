import 'package:flutter/material.dart';

import 'ripple_painter.dart';

class WRipple extends StatefulWidget {
  const WRipple({ Key? key, required this.color, required this.center, required this.onEnd }) : super(key: key);

  @override
  _WRippleState createState() => _WRippleState();


  final List<Color> color;
  final Offset center;
  final void Function(Widget widget) onEnd;
}

class _WRippleState extends State<WRipple> {
  @override
  Widget build(BuildContext context) {
    return _buildRadiusMultiplierTweenBuilder();
  }

  Widget _buildRadiusMultiplierTweenBuilder() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 300),
      onEnd: () => widget.onEnd(widget),
      builder: (context, value, child) => _buildRippleCustomPainter(value)
    );
  }

  Widget _buildRippleCustomPainter(final double radiusMultiplier) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth, height: constraints.maxHeight,
          child: CustomPaint(painter: RipplePainter(widget.color, radiusMultiplier, widget.center))
        );
      }
    );
  }  
}