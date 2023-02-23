import 'package:flutter/material.dart';
import 'dart:math' as math;

class ArcView extends StatelessWidget {
  final double diameter;
  final Offset offset;
   const ArcView({super.key, required this.diameter,required this.offset});

  @override
  Widget build(BuildContext context) {
    

    return  CustomPaint(
      painter: MyPainter(offset: offset),
      size: Size(diameter, diameter),
    );
  }
}

class MyPainter extends CustomPainter {
   final Offset offset;
   MyPainter({required this.offset});
  final num radius = 0;
  @override
  void paint(Canvas canvas, Size size) {
    final redCircle = Paint()
    ..strokeWidth = 10
      ..color = Colors.red
      ..style = PaintingStyle.stroke;

      final greenCircle = Paint()
    ..strokeWidth = 10
      ..color = Colors.green
      ..style = PaintingStyle.stroke;

      final whiteCircle = Paint()
    ..strokeWidth = 10
      ..color = Colors.black
      ..style = PaintingStyle.stroke;
      final linePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    final arcRect = Rect.fromCircle(
        center: size.bottomCenter(Offset.zero), radius: size.shortestSide);
        canvas.drawLine(const Offset(55,100), offset, linePaint);
    canvas.drawArc(arcRect, math.pi,math.pi*0.15, false, redCircle);
    canvas.drawArc(arcRect, math.pi*1.17,math.pi*0.15, false, redCircle);
    canvas.drawArc(arcRect, math.pi*1.34,math.pi*0.15, false, redCircle);
     canvas.drawArc(arcRect, math.pi*1.52,math.pi*0.15, false, greenCircle);
    canvas.drawArc(arcRect, math.pi*1.69,math.pi*0.15, false, greenCircle);
    canvas.drawArc(arcRect, math.pi*1.86,math.pi*0.15, false, greenCircle);
    canvas.drawCircle(const Offset(55, 100),3,whiteCircle);
    textPaint(canvas,const Offset(-55, 100),"5");
    textPaint(canvas,const Offset(-60, 40),"10");
    textPaint(canvas,const Offset(-20, -5),"15");
    textPaint(canvas,const Offset(45, -20),"20");
    textPaint(canvas,const Offset(100, -8),"25");
    textPaint(canvas,const Offset(145, 40),"30");
    textPaint(canvas,const Offset(140, 105),"35");
  }

  void textPaint(Canvas canvas,Offset offset,String text){
    TextSpan span =  TextSpan(
        style: const TextStyle(color: Colors.black, fontSize: 14.0,
            ), text: text);
    TextPainter tp = TextPainter(
        text: span, textAlign: TextAlign.left,textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, offset);
    
  }


  @override
  bool shouldRepaint(MyPainter oldDelegate) => true;
}

