import 'package:app/components/buttons/elevate_button.dart';
import 'package:app/components/buttons/outline_button.dart';
import 'package:app/di.dart';
import 'package:app/extensions/flutter_ext.dart';
import 'package:app/services/routes.dart';
import 'package:app/themes/colors.dart';
import 'package:app/themes/shadows.dart';
import 'package:app/themes/text_styles.dart';
import 'package:app/utils/assets.dart';
import 'package:app/utils/dimensions.dart';
import 'package:app/utils/keys.dart';
import 'package:app/utils/size_config.dart';
import 'package:app/widgets/core/pop_scope_navigator.dart';
import 'package:flutter/material.dart';

Future<void> logoutSheet() async {
  var context = navigatorKey.currentState!.context;
  await showModalBottomSheet(
    context: context,
    isDismissible: false,
    shape: BOTTOM_SHEET_SHAPE,
    isScrollControlled: true,
    clipBehavior: Clip.antiAlias,
    builder: (builder) => PopScopeNavigator(canPop: false, child: _BottomSheetView()),
  );
}

class _BottomSheetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width,
      child: _screenView(context),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(color: white, borderRadius: SHEET_RADIUS, boxShadow: [SHADOW_2]),
    );
  }

  Widget _screenView(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 28),
        Image.asset(Assets.png_image.door_open, height: 140),
        const SizedBox(height: 40),
        Text('Leaving So Soon?', textAlign: TextAlign.center, style: TextStyles.text22_600.copyWith(color: dark)),
        const SizedBox(height: 08),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Are you sure you want to log out from your account? You can login anytime you want',
            textAlign: TextAlign.center,
            style: TextStyles.text15_400.copyWith(color: grey2),
          ),
        ),
        const SizedBox(height: 32),
        OutlineButton(color: error, label: 'Yes, Log me out', width: double.infinity, onTap: _onLogout),
        const SizedBox(height: 12),
        ElevateButton(width: double.infinity, label: 'No, Keep', onTap: backToPrevious),
        const SizedBox(height: 12),
      ],
    );
  }

  void _onLogout() {
    backToPrevious();
    sl<Routes>().loader().push();
  }
}
