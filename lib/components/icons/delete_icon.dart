import 'package:app/themes/colors.dart';
import 'package:app/utils/assets.dart';
import 'package:app/widgets/library/svg_image.dart';
import 'package:flutter/material.dart';

class DeleteIcon extends StatelessWidget {
  final double size;
  final double iconSize;
  final Function() onTap;

  DeleteIcon({required this.onTap, this.size = 28, this.iconSize = 16});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: error, shape: BoxShape.circle),
        child: SvgImage(image: Assets.svg.trash, color: white, height: iconSize),
      ),
    );
  }
}
