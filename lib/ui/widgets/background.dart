import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  Color fondo, blur;

  BackgroundPainter({required this.fondo, required this.blur});

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = fondo;
    canvas.drawPath(mainBackground, paint);

    // final circle = Paint()
    //   ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3)
    //   ..shader = LinearGradient(
    //       begin: Alignment.topLeft,
    //       end: Alignment.bottomRight,
    //       colors: <Color>[
    //         blur,
    //         Color(0xFFFDFDFD),
    //       ]).createShader(Rect.fromLTRB(-110, 0, 110, 200));
    // canvas.drawCircle(Offset(0.0, 100), 100, circle);

    // final circulo = Paint()
    //   ..maskFilter = MaskFilter.blur(BlurStyle.normal, 3)
    //   ..shader = LinearGradient(
    //       begin: Alignment.topLeft,
    //       end: Alignment.bottomRight,
    //       colors: <Color>[
    //         blur,
    //         Color(0xFFFDFDFD),
    //       ]).createShader(Rect.fromLTRB(0, -110, 220, 110));
    // canvas.drawCircle(Offset(100, 0), 100, circulo);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
