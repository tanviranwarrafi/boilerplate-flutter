import 'package:app/features/auth/screens/sign_in_screen.dart';
import 'package:app/features/home/home_screen.dart';
import 'package:app/features/system/loader_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  Widget sign_in() => SignInScreen();
  Widget home() => HomeScreen();
  Widget loader() => LoaderScreen();
}
