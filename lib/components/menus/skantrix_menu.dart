import 'package:app/themes/colors.dart';
import 'package:app/utils/assets.dart';
import 'package:app/widgets/library/svg_image.dart';
import 'package:flutter/material.dart';

class SkantrixMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgImage(image: Assets.app_icon.skantrix, width: 32, height: 26, color: primary),
        const SizedBox(width: 08),
        Image.asset(Assets.app_icon.skantrix_name, width: 118, height: 20, color: primary),
      ],
    );
  }
}
