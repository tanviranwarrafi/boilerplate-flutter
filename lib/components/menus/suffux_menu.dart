import 'package:app/themes/colors.dart';
import 'package:app/widgets/library/svg_image.dart';
import 'package:flutter/material.dart';

const _RADIUS = Radius.circular(08);

class SuffixMenu extends StatelessWidget {
  final String icon;
  final bool isFocus;
  final Function()? onTap;
  SuffixMenu({required this.icon, required this.isFocus, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        child: SvgImage(image: icon, height: 20, color: isFocus ? dark : grey2),
        decoration: const BoxDecoration(borderRadius: BorderRadius.only(topRight: _RADIUS, bottomRight: _RADIUS)),
      ),
    );
  }
}
