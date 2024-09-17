import 'package:app/extensions/flutter_ext.dart';
import 'package:app/models/system/data_model.dart';
import 'package:app/themes/colors.dart';
import 'package:app/themes/shadows.dart';
import 'package:app/themes/text_styles.dart';
import 'package:app/utils/assets.dart';
import 'package:app/utils/dimensions.dart';
import 'package:app/utils/keys.dart';
import 'package:app/utils/size_config.dart';
import 'package:app/widgets/core/pop_scope_navigator.dart';
import 'package:app/widgets/library/svg_image.dart';
import 'package:flutter/material.dart';

Future<void> imageOptionSheet({required Function() onCamera, required Function() onGallery}) async {
  var context = navigatorKey.currentState!.context;
  await showModalBottomSheet(
    context: context,
    isDismissible: false,
    shape: BOTTOM_SHEET_SHAPE,
    isScrollControlled: true,
    clipBehavior: Clip.antiAlias,
    builder: (builder) => PopScopeNavigator(canPop: false, child: _BottomSheetView(onCamera, onGallery)),
  );
}

class _BottomSheetView extends StatelessWidget {
  final Function() onCamera;
  final Function() onGallery;
  _BottomSheetView(this.onCamera, this.onGallery);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width,
      child: _screenView(context),
      decoration: BoxDecoration(color: white, borderRadius: SHEET_RADIUS, boxShadow: [SHADOW_2]),
    );
  }

  Widget _screenView(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Row(
          children: [
            const SizedBox(width: 20),
            Expanded(child: Text('Select an Option', style: TextStyles.text18_500.copyWith(color: dark))),
            const SizedBox(width: 10),
            InkWell(onTap: backToPrevious, child: SvgImage(image: Assets.svg.close, height: 22, color: grey2)),
            const SizedBox(width: 20),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 28),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: _ImageUploadItem(type: camera_option, onTap: _onCamera),
        ),
        const SizedBox(height: 20),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 24), child: Divider()),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: _ImageUploadItem(type: gallery_option, onTap: _onGallery),
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  void _onCamera() {
    backToPrevious();
    onCamera();
  }

  void _onGallery() {
    backToPrevious();
    onGallery();
  }
}

class _ImageUploadItem extends StatelessWidget {
  final Function() onTap;
  final DataModel type;
  const _ImageUploadItem({required this.onTap, required this.type});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SvgImage(image: type.icon, color: grey2, height: 22),
          const SizedBox(width: 14),
          Expanded(child: Text(type.label, style: TextStyles.text15_500.copyWith(color: grey2))),
          const SizedBox(width: 14),
          SvgImage(image: Assets.svg.caret_right, color: grey1, height: 20),
        ],
      ),
    );
  }
}
