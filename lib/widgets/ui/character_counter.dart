import 'package:app/themes/colors.dart';
import 'package:app/utils/assets.dart';
import 'package:app/utils/size_config.dart';
import 'package:app/widgets/library/svg_image.dart';
import 'package:flutter/material.dart';

class CharacterCounter extends StatelessWidget {
  final int count;
  final int total;

  CharacterCounter({required this.count, required this.total});

  @override
  Widget build(BuildContext context) {
    var isMobile = SizeConfig.isMobile;
    return Row(
      children: [
        SvgImage(image: Assets.svg.info, height: isMobile ? 12 : 16, color: offWhite1),
        const SizedBox(width: 6),
        Expanded(
          child:
              Text('$count/$total characters' /*, style: TextStyles.text12_400.copyWith(color: offWhite1, fontSize: isMobile ? 12 : 15)*/),
        ),
      ],
    );
  }
}
