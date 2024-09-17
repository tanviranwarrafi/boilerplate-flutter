import 'package:app/components/menus/back_menu.dart';
import 'package:app/themes/colors.dart';
import 'package:app/themes/text_styles.dart';
import 'package:app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class SimpleAppBar extends StatelessWidget {
  final String label;
  SimpleAppBar({this.label = ''});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 34,
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.screen_padding),
          child: Text(label, style: TextStyles.text16_500.copyWith(color: grey2)),
        ),
        const Positioned(left: 20, top: 0, bottom: 0, child: BackMenu(background: transparent, border: grey1)),
      ],
    );
  }
}
