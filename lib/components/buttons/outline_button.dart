import 'package:app/themes/colors.dart';
import 'package:app/themes/shadows.dart';
import 'package:app/themes/text_styles.dart';
import 'package:app/widgets/library/svg_image.dart';
import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget {
  final String label;
  final String? icon;
  final double? width;
  final double height;
  final double radius;
  final Color color;
  final Color? iconColor;
  final double padding;
  final Function()? onTap;

  const OutlineButton({
    this.onTap,
    this.label = '',
    this.width,
    this.icon,
    this.radius = 08,
    this.height = 48,
    this.padding = 12,
    this.color = dark,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(horizontal: padding),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [SHADOW_1],
          border: Border.all(color: offWhite4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) SvgImage(image: icon!, height: 20, color: iconColor),
            if (icon != null) const SizedBox(width: 08),
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.text15_500.copyWith(color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
