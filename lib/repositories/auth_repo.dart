import 'package:app/di.dart';
import 'package:app/helpers/enums.dart';
import 'package:app/interfaces/api_interceptor.dart';
import 'package:app/models/system/api_response.dart';
import 'package:app/models/user/auth_api.dart';
import 'package:app/services/auth_service.dart';
import 'package:app/utils/api_url.dart';

class AuthRepository {
  Future<AuthApi?> signIn(Map<String, dynamic> body) async {
    var endpoint = ApiUrl.auth.signIn;
    var apiResponse = await sl<ApiInterceptor>().postRequest(endpoint: endpoint, body: body, header: Header.http);
    if (apiResponse.status != 200) return null;
    var authApi = AuthApi.fromJson(apiResponse.response);
    if (authApi.user != null) sl<AuthService>().setUserInfo(authApi);
    sl<AuthService>().storeCredentials(body);
    return authApi;
  }

  Future<AuthApi?> signupBy(Map<String, dynamic> body) async {
    await Future.delayed(const Duration(seconds: 1));
    var apiResponse = ApiResponse(status: 200, response: {});
    if (apiResponse.status != 200) return null;
    sl<AuthService>().storeCredentials(body);
    return AuthApi();
  }
}
