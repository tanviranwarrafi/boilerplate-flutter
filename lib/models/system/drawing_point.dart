import 'package:app/themes/colors.dart';
import 'package:flutter/material.dart';

class DrawingPoint {
  int id;
  List<Offset> offsets;
  Color color;
  double width;

  DrawingPoint({this.id = -1, this.offsets = const [], this.color = black, this.width = 2});

  DrawingPoint copyWith({List<Offset>? offsets}) => DrawingPoint(id: id, color: color, width: width, offsets: offsets ?? this.offsets);
}
