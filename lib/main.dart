import 'dart:io';

import 'package:app/screen_craft.dart';
import 'package:app/services/http_overrides.dart';
import 'package:app/services/providers.dart';
import 'package:app/skan_trix_app.dart';
import 'package:app/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'di.dart' as dependency_injection;

/// flutter build appbundle --release
/// flutter build apk --split-per-abi
/// flutter pub run import_sorter:main lib

Future<void> main() async {
  await dependency_injection.init();
  await _initSkanTrixApp();
  runApp(MultiProvider(providers: providers, child: _screenCraft()));
}

Widget _screenCraft() => ScreenCraft(builder: (context, orientation) => SkanTrixApp());

Future<void> _initSkanTrixApp() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await portraitMode();
}
