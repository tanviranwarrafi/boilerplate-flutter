import 'package:app/models/user/user.dart';

class AuthApi {
  User? user;
  String? message;
  String? accessToken;
  bool status = true;

  AuthApi({this.user, this.message, this.accessToken, this.status = true});

  AuthApi.fromJson(json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    message = json['message'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) map['user'] = user?.toJson();
    map['message'] = message;
    map['access_token'] = accessToken;
    return map;
  }
}
