import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class AnalogWatch extends StatelessWidget {
  AnalogWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(180),
        border: Border.all(color: Theme.of(context).backgroundColor, width: 4),
        color: Theme.of(context).backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, -10),
          ),
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 15),
          ),
          BoxShadow(
            color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 2,
            inset: true,
            offset: Offset(0, -15),
          ),
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
            blurRadius: 7,
            spreadRadius: 2,
            inset: true,
            offset: Offset(0, 15),
          ),
        ],
      ),
      child: RotatedBox(
        quarterTurns: 3,
        child: Clock(),
      ),
    );
  }
}

class Clock extends StatefulWidget {
  Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime _now = DateTime.now();
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ClockPainter(context, _now),
    );
  }
}

class ClockPainter extends CustomPainter {
  final BuildContext context;
  final DateTime _now;

  ClockPainter(this.context, this._now);

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    var dotPaint = Paint()..color = Theme.of(context).primaryIconTheme.color!;
    var hourLinePaint = Paint()
      ..color = Theme.of(context).colorScheme.secondary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;
    var minutLinePaint = Paint()
      ..color = Theme.of(context).accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    var secondLinePaint = dotPaint;

    //minute line
    var minuteX = centerX + size.width * 0.36 * cos((_now.minute * 6) * pi / 180);
    var minuteY = centerY + size.width * 0.36 * sin((_now.minute * 6) * pi / 180);

    canvas.drawLine(center, Offset(minuteX, minuteY), minutLinePaint);

    //hour line
    var hourX = centerX + size.width * 0.26 * cos((_now.hour * 30 + _now.minute * 0.5) * pi / 180);
    var hourY = centerY + size.width * 0.26 * sin((_now.hour * 30 + _now.minute * 0.5) * pi / 180);

    canvas.drawLine(center, Offset(hourX, hourY), hourLinePaint);

    //second line
    var secondX = centerX + size.width * 0.4 * cos((_now.second * 6 + _now.millisecond * 0.00559) * pi / 180);
    var secondY = centerY + size.width * 0.4 * sin((_now.second * 6 + _now.millisecond * 0.00559) * pi / 180);

    var secondX2 = centerX + size.width * 0.06 * cos(((30 - _now.second).abs() * 6) * pi / 180);
    var secondY2 = centerY + size.width * 0.06 * sin(((30 - _now.second).abs() * 6) * pi / 180);

    canvas.drawLine(center, Offset(secondX, secondY), secondLinePaint);
    //canvas.drawLine(center, Offset(secondX2, secondY2), secondLinePaint);

    canvas.drawCircle(center, 8, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
