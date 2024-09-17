import 'package:app/constants/app_constants.dart';
import 'package:app/extensions/flutter_ext.dart';
import 'package:app/utils/keys.dart';
import 'package:flutter/foundation.dart';
import 'package:new_version_plus/new_version_plus.dart';

class AppUpdater {
  Future<void> initAppUpdate() async {
    var context = navigatorKey.currentState?.context;
    if (context == null) return;
    try {
      var version = NewVersionPlus(androidId: ANDROID_ID, iOSId: IOS_ID);
      var status = await version.getVersionStatus();
      if (status != null && status.canUpdate) _showAppUpdateDialog(version, status);
    } catch (error) {
      if (kDebugMode) print(error);
    }
  }

  void _showAppUpdateDialog(NewVersionPlus version, VersionStatus status) {
    const available = 'A new version of $APP_NAME is available!';
    var versionData = 'Version ${status.storeVersion} is now available-you have ${status.localVersion} ☺️';
    var updateNow = 'Would you like to update it now?';
    version.showUpdateDialog(
      context: navigatorKey.currentState!.context,
      versionStatus: status,
      allowDismissal: false,
      dialogText: '$available $versionData\n\n$updateNow',
      updateButtonText: 'Update Now',
      dismissButtonText: 'No Thanks',
      dialogTitle: 'Update $APP_NAME?',
      dismissAction: backToPrevious,
    );
  }
}
