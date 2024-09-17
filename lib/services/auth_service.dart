import 'package:app/constants/storage_keys.dart';
import 'package:app/di.dart';
import 'package:app/interfaces/http_module.dart';
import 'package:app/libraries/local_storage.dart';
import 'package:app/models/user/auth_api.dart';
import 'package:app/services/storage_service.dart';
import 'package:app/utils/keys.dart';

class AuthService {
  bool get authStatus => sl<StorageService>().authStatus;

  void clearMemory() => sl<LocalStorage>().removeAllData();

  void initStorageInLoginState() {
    var token = sl<StorageService>().accessToken;
    HttpModule.setToken(token: token);
  }

  void storeCredentials(var credentials) {
    sl<StorageService>().setUsername(credentials['email']!);
    sl<StorageService>().setPassword(credentials['password']!);
    sl<StorageService>().setRememberStatus(true);
  }

  void setUserInfo(AuthApi authApi, {bool isToken = true}) {
    if (isToken) HttpModule.setToken(token: authApi.accessToken!);
    if (isToken) sl<StorageService>().setAccessToken(authApi.accessToken!);
    if (isToken) sl<StorageService>().setAuthStatus(true);
    sl<StorageService>().setUser(authApi.user);
    // if (isToken) sl<StorageService>().setRefreshToken(authApi.refreshToken!);
  }

  void signOutUpdate() {
    var context = navigatorKey.currentState?.context;
    if (context == null) return;
    HttpModule.setToken(token: '');
    sl<StorageService>().removeData(key: AUTH_STATUS);
    sl<StorageService>().removeData(key: ACCESS_TOKEN);
    sl<StorageService>().removeData(key: REFRESH_TOKEN);
    sl<StorageService>().removeData(key: USER);
  }

  void clearUserData() {
    /*var context = navigatorKey.currentState?.context;
    if (context == null) return;
    Provider.of<AudioPlayerViewModel>(context, listen: false).clearStates();
    Provider.of<HomeViewModel>(context, listen: false).clearStates();
    Provider.of<CategoryViewModel>(context, listen: false).clearStates();*/
  }

  void removeCredentials() {
    sl<StorageService>().removeData(key: USERNAME);
    sl<StorageService>().removeData(key: PASSWORD);
  }
}
