import 'package:app/themes/colors.dart';
import 'package:app/utils/assets.dart';
import 'package:app/widgets/library/svg_image.dart';
import 'package:flutter/material.dart';

class BookmarkMenu extends StatelessWidget {
  final bool status;
  final Function()? onTap;
  const BookmarkMenu({this.onTap, this.status = false});

  @override
  Widget build(BuildContext context) {
    var size = 36.0;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: status ? primary : transparent,
          shape: BoxShape.circle,
          border: status ? null : Border.all(color: grey1),
        ),
        child: SvgImage(
          color: status ? white : grey2,
          height: 20,
          image: status ? Assets.svg.bookmark_2 : Assets.svg.bookmark_1,
        ),
      ),
    );
  }
}
