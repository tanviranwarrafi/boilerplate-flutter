import 'package:app/extensions/number_ext.dart';
import 'package:app/themes/colors.dart';
import 'package:app/themes/text_styles.dart';
import 'package:app/utils/assets.dart';
import 'package:app/utils/size_config.dart';
import 'package:flutter/material.dart';

class NoSupportView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: offWhite1,
      child: Container(
        width: SizeConfig.width,
        height: SizeConfig.height,
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.svg_image.tab_support, width: 40.width),
            const SizedBox(height: 32),
            Text(
              'Sorry! Tab View Not Supported Yet!',
              textAlign: TextAlign.center,
              style: TextStyles.text26_600.copyWith(color: dark),
            ),
            const SizedBox(height: 16),
            Text(
              'We will soon bring the tab view for you.',
              textAlign: TextAlign.center,
              style: TextStyles.text18_500.copyWith(color: grey3),
            ),
          ],
        ),
      ),
    );
  }
}
