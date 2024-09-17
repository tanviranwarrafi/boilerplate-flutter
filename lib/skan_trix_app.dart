import 'package:app/constants/app_constants.dart';
import 'package:app/features/home/home_screen.dart';
import 'package:app/global_view_model.dart';
import 'package:app/services/lifecycle_observer.dart';
import 'package:app/themes/colors.dart';
import 'package:app/themes/light_theme.dart';
import 'package:app/utils/keys.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SkanTrixApp extends StatefulWidget {
  @override
  State<SkanTrixApp> createState() => _SkanTrixAppState();
}

class _SkanTrixAppState extends State<SkanTrixApp> {
  var _observer = LifecycleObserver();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => Provider.of<GlobalViewModel>(context, listen: false).initViewModel());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addObserver(_observer);
    return MaterialApp(
      color: primary,
      title: APP_NAME,
      theme: LIGHT_THEME,
      // home: DrawingRoomScreen(),
      home: HomeScreen(),
      navigatorKey: navigatorKey,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
    );
  }
}
