import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackoFieldLogo extends StatelessWidget {
  final double scale;
  final bool showTagline;

  const TrackoFieldLogo({
    super.key,
    this.scale = 1.0,
    this.showTagline = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Custom Logo Pin Graphic
        CustomPaint(
          size: Size(38 * scale, 44 * scale),
          painter: _LogoPinPainter(),
        ),
        SizedBox(width: 8 * scale),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              text: TextSpan(
                style: GoogleFonts.outfit(
                  fontSize: 19 * scale,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                ),
                children: const [
                  TextSpan(
                    text: 'TRACK',
                    style: TextStyle(color: Color(0xFF2C3258)),
                  ),
                  TextSpan(
                    text: 'OFIELD',
                    style: TextStyle(color: Color(0xFFD98E2A)),
                  ),
                ],
              ),
            ),
            if (showTagline)
              Text(
                'TRACK EVERY TASK',
                style: GoogleFonts.outfit(
                  fontSize: 8.2 * scale,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFD98E2A),
                  letterSpacing: 1.8,
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _LogoPinPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // 1. Folded origami base
    final basePaint = Paint()
      ..color = const Color(0xFF3B236E)
      ..style = PaintingStyle.fill;

    final basePath = Path()
      ..moveTo(w * 0.15, h * 0.72)
      ..lineTo(w * 0.5, h * 0.98)
      ..lineTo(w * 0.85, h * 0.72)
      ..lineTo(w * 0.5, h * 0.6)
      ..close();
    canvas.drawPath(basePath, basePaint);

    final foldPaint = Paint()
      ..color = const Color(0xFF553298)
      ..style = PaintingStyle.fill;
    final leftFold = Path()
      ..moveTo(w * 0.15, h * 0.72)
      ..lineTo(w * 0.5, h * 0.98)
      ..lineTo(w * 0.35, h * 0.82)
      ..close();
    canvas.drawPath(leftFold, foldPaint);

    // 2. Main Drop Pin
    final pinPaint = Paint()
      ..color = const Color(0xFF45277D)
      ..style = PaintingStyle.fill;

    final pinPath = Path();
    final center = Offset(w * 0.5, h * 0.34);
    final radius = w * 0.36;

    pinPath.addArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.14 * 0.8,
      3.14 * 1.6,
    );
    pinPath.lineTo(w * 0.5, h * 0.68);
    pinPath.close();

    canvas.drawPath(pinPath, pinPaint);

    // 3. Golden Smiling Face / Crescent in center
    final smileBgPaint = Paint()
      ..color = const Color(0xFFF5A623)
      ..style = PaintingStyle.fill;

    final smileCenter = Offset(w * 0.5, h * 0.32);
    canvas.drawCircle(smileCenter, radius * 0.65, smileBgPaint);

    // Eyes / Smile cutout (purple)
    final eyePaint = Paint()
      ..color = const Color(0xFF45277D)
      ..style = PaintingStyle.fill;
    
    // Smile curve
    final smileCurvePaint = Paint()
      ..color = const Color(0xFF45277D)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final smilePath = Path()
      ..addArc(
        Rect.fromCircle(center: Offset(w * 0.5, h * 0.30), radius: radius * 0.35),
        0.2,
        2.7,
      );
    canvas.drawPath(smilePath, smileCurvePaint);

    // Left & right eye dots
    canvas.drawCircle(Offset(w * 0.42, h * 0.28), 1.6, eyePaint);
    canvas.drawCircle(Offset(w * 0.58, h * 0.28), 1.6, eyePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
