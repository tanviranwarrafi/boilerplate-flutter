import 'package:app/themes/colors.dart';
import 'package:flutter/material.dart';

class RectangleIconBox extends StatelessWidget {
  final double radius;
  final Color border;
  final double size;
  final Widget icon;
  final Color background;
  final Function()? onTap;

  const RectangleIconBox({
    this.icon = const SizedBox.shrink(),
    this.onTap,
    this.radius = 4,
    this.border = transparent,
    this.background = transparent,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        child: icon,
        clipBehavior: Clip.antiAlias,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: border),
        ),
      ),
    );
  }
}
