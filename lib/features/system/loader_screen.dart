import 'package:app/global_view_model.dart';
import 'package:app/themes/colors.dart';
import 'package:app/themes/gradients.dart';
import 'package:app/themes/text_styles.dart';
import 'package:app/utils/dimensions.dart';
import 'package:app/utils/size_config.dart';
import 'package:app/widgets/core/pop_scope_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoaderScreen extends StatefulWidget {
  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => _onLogout(context));
    super.initState();
  }

  Future<void> _onLogout(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    Provider.of<GlobalViewModel>(context, listen: false).onLogout();
  }

  @override
  Widget build(BuildContext context) {
    return PopScopeNavigator(
      canPop: false,
      child: Scaffold(
        body: Container(
          width: SizeConfig.width,
          height: SizeConfig.height,
          decoration: const BoxDecoration(gradient: PURPLE_GRADIENT),
          padding: EdgeInsets.symmetric(horizontal: Dimensions.screen_padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 72, height: 72, child: CircularProgressIndicator(color: white, backgroundColor: offWhite3)),
              const SizedBox(height: 20),
              Text('Logging out', textAlign: TextAlign.center, style: TextStyles.text20_500.copyWith(color: white)),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
