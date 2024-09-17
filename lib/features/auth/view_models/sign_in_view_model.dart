import 'dart:async';

import 'package:app/di.dart';
import 'package:app/extensions/flutter_ext.dart';
import 'package:app/repositories/auth_repo.dart';
import 'package:app/services/routes.dart';
import 'package:flutter/material.dart';

class SignInViewModel with ChangeNotifier {
  var loader = false;

  void initViewModel() {}

  void disposeViewModel() => loader = false;

  Future<void> signIn(Map<String, dynamic> body) async {
    loader = true;
    notifyListeners();
    var response = await sl<AuthRepository>().signIn(body);
    if (response != null) unawaited(sl<Routes>().home().pushAndRemoveUntil());
    loader = false;
    notifyListeners();
  }
}
