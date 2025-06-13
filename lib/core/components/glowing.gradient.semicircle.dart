import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:urban_match/core/theme/colors.dart';

class GlowingGradientSemicircle extends StatelessWidget {
  final double width;
  final double height;
  final double opacity;

  const GlowingGradientSemicircle({
    super.key,
    required this.width,
    required this.height,
    this.opacity = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: _GlowingGradientSemicirclePainter(opacity: opacity),
    );
  }
}

class _GlowingGradientSemicirclePainter extends CustomPainter {
  final double opacity;

  _GlowingGradientSemicirclePainter({required this.opacity});

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        Rect.fromLTWH(0, -size.height, size.width, size.height * 2);
    final Gradient gradient = _buildGradient();

    final Paint paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    // Draw the main semicircle
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, 0), radius: size.width),
      0,
      math.pi,
      true,
      paint,
    );

    // Add glow effect
    final Paint glowPaint = Paint()
      ..color = AppColors.tertiaryTangerine.withOpacity(0.3 * opacity)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8.0);

    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      0,
      math.pi,
      true,
      glowPaint,
    );
  }

  RadialGradient _buildGradient() {
    const primaryColor = AppColors.tertiaryTangerine;
    return RadialGradient(
      center: Alignment.topCenter,
      radius: 1.2,
      colors: [
        primaryColor.withOpacity(opacity),
        primaryColor.withOpacity(0.9 * opacity),
        primaryColor.withOpacity(0.8 * opacity),
        primaryColor.withOpacity(0.3 * opacity),
        primaryColor.withOpacity(0.15 * opacity),
        primaryColor.withOpacity(0.07 * opacity),
        Colors.transparent,
      ],
      stops: const [
        0.0,
        0.2,
        0.35,
        0.5,
        0.7,
        0.85,
        1.0,
      ],
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
