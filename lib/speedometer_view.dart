import 'package:flutter/material.dart';
import 'dart:math' as math;

class SpeedometerView extends StatelessWidget {
  final double diameter;
  final Offset offset;
   const SpeedometerView({super.key, required this.diameter,required this.offset});

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
    
      final whiteCircle = Paint()
    ..strokeWidth = 10
      ..color = Colors.black
      ..style = PaintingStyle.stroke;
      final linePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    
        canvas.drawLine(const Offset(55,100), offset, linePaint);
        drawArcs(size, canvas);
    canvas.drawCircle(const Offset(55, 100),3,whiteCircle);
    paintText(canvas);
  }

  void paintText(Canvas canvas){
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

  void drawArcs(Size size,Canvas canvas){
    final redCircle = Paint()
    ..strokeWidth = 10
      ..color = Colors.red
      ..style = PaintingStyle.stroke;

      final greenCircle = Paint()
    ..strokeWidth = 10
      ..color = Colors.green
      ..style = PaintingStyle.stroke;

    drawArc(size,canvas,math.pi,redCircle);
        drawArc(size,canvas, math.pi*1.17 , redCircle);
        drawArc(size, canvas,math.pi*1.34,redCircle);
        drawArc(size,canvas, math.pi*1.52,greenCircle);
        drawArc(size,canvas,math.pi*1.69,greenCircle);
        drawArc(size,canvas, math.pi*1.86,greenCircle);
  }

  

  void drawArc(Size size,Canvas canvas,double startAngle,Paint circle){
    final arcRect = Rect.fromCircle(
        center: size.bottomCenter(Offset.zero), radius: size.shortestSide);
        canvas.drawArc(arcRect, startAngle,math.pi*0.15, false, circle);
  }


  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;
}

