import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui' as ui;

class TVStaticPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..strokeWidth = 1.0;
    final random = Random();

    for (int i = 0; i < 5000; i++) {
      final opacity = random.nextDouble() * 0.5;
      paint.color = Colors.white.withOpacity(opacity);

      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;

      canvas.drawPoints(ui.PointMode.points, [Offset(x, y)], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}