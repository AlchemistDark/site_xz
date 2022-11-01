import 'dart:async';
import 'package:flutter/material.dart';
import 'package:site_xz/month_circular_face.dart';

class MonthlyPlanner extends StatefulWidget {
  final String title;
  final double mineWidth;
  final double mineHeight;
  final double scaleFactor;

  const MonthlyPlanner(
    this.title,
    this.mineWidth,
    this.mineHeight,
    this.scaleFactor,
    {Key? key}
  ) : super(key: key);

  @override
  State<MonthlyPlanner> createState() => _MonthlyPlannerState();
}

class _MonthlyPlannerState extends State<MonthlyPlanner> {

  _MonthlyPlannerState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: Center(
        child: Container(
          width: widget.mineWidth,
          height: widget.mineWidth,
          color: Color(0xFF24262D),
          child: CircleClockFace(widget.scaleFactor)
        )
      )
    );
  }
}
