import 'package:app/themes/colors.dart';
import 'package:app/utils/assets.dart';
import 'package:app/widgets/library/svg_image.dart';
import 'package:flutter/material.dart';

class HamburgerMenu extends StatelessWidget {
  final Color color;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const HamburgerMenu({required this.scaffoldKey, this.color = grey3});

  @override
  Widget build(BuildContext context) {
    var size = 36.0;
    return InkWell(
      onTap: () => scaffoldKey.currentState!.openEndDrawer(),
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: grey1)),
        child: SvgImage(image: Assets.svg.hamburger, color: color, height: 20),
      ),
    );
  }
}
