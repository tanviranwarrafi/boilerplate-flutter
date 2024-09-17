import 'package:app/themes/colors.dart';
import 'package:app/utils/assets.dart';
import 'package:app/widgets/library/svg_image.dart';
import 'package:flutter/material.dart';

// TextStyles.text14_500.copyWith(color: grey4);

class RectangleCheckBox extends StatelessWidget {
  final Color color;
  final Color selectedColor;
  final bool isChecked;
  final String label;
  final TextStyle? style;
  final double size;
  final Function()? onTap;

  const RectangleCheckBox({
    this.size = 20,
    this.label = '',
    this.style,
    this.onTap,
    this.color = offWhite4,
    this.selectedColor = primary,
    this.isChecked = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgImage(image: isChecked ? Assets.svg.check_true : Assets.svg.check_false, height: size, color: isChecked ? null : color),
          const SizedBox(width: 06),
          Flexible(child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: style)),
        ],
      ),
    );
  }
}
