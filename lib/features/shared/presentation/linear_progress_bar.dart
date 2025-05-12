import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/core.dart' show appColors;

// TODO: Change to work with provider for getting the profile data

class SignLinearProgressBar extends ConsumerWidget {
  final double progress;

  const SignLinearProgressBar({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: CustomPaint(
        willChange: true,
        painter: _LinearProgressBarPainter(
          progress: progress,
        ),
      ),
    );
  }
}

class _LinearProgressBarPainter extends CustomPainter {
  final double progress;

  _LinearProgressBarPainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFF4F1F9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );

    final progressPaint = Paint()
      ..shader = LinearGradient(
        colors: [appColors.black, appColors.gradientHigh],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width * progress, size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width * progress, size.height / 2),
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
