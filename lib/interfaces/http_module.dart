import 'dart:convert';
import 'dart:io';

import 'package:app/di.dart';
import 'package:app/global_view_model.dart';
import 'package:app/helpers/enums.dart';
import 'package:app/interfaces/api_interceptor.dart';
import 'package:app/models/system/api_response.dart';
import 'package:app/services/auth_service.dart';
import 'package:app/utils/keys.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

const _200 = 200;
const _300 = 300;
const _400 = 400;
const _500 = 500;

class HttpModule implements ApiInterceptor {
  static String accessToken = 'null';

  static setToken({required String token}) => accessToken = 'Bearer $token';

  @override
  Future<ApiResponse> getRequest({required String endpoint, required Header header}) async {
    HttpClient client = HttpClient();
    if (kDebugMode) print('get: $endpoint');
    try {
      var uri = Uri.parse(endpoint);
      http.Response response = await http.get(uri, headers: _getHeader(header));
      return _returnResponse(response);
    } catch (error) {
      if (kDebugMode) print('ERROR::::::$error::::::$endpoint');
      client.close();
      return ApiResponse(status: _500, response: null);
    }
  }

  @override
  Future<ApiResponse> postRequest({required String endpoint, required Header header, var body}) async {
    HttpClient client = HttpClient();
    if (kDebugMode) print('post: $endpoint');
    try {
      var uri = Uri.parse(endpoint);
      var encodedBody = body == null ? null : json.encode(body);
      http.Response response = await http.post(uri, body: encodedBody, headers: _getHeader(header));
      return _returnResponse(response);
    } catch (error) {
      if (kDebugMode) print('ERROR::::::$error::::::$endpoint');
      client.close();
      return ApiResponse(status: _500, response: null);
    }
  }

  @override
  Future<ApiResponse> putRequest({required String endpoint, required Header header, var body}) async {
    HttpClient client = HttpClient();
    if (kDebugMode) print('put: $endpoint');
    try {
      var uri = Uri.parse(endpoint);
      var encodedBody = body == null ? null : json.encode(body);
      http.Response response = await http.put(uri, body: encodedBody, headers: _getAuthHeaders());
      return _returnResponse(response);
    } catch (error) {
      if (kDebugMode) print('ERROR::::::$error::::::$endpoint');
      client.close();
      return ApiResponse(status: _500, response: null);
    }
  }

  @override
  Future<ApiResponse> deleteRequest({required String endpoint, required Header header, var body}) async {
    HttpClient client = HttpClient();
    if (kDebugMode) print('delete: $endpoint');
    try {
      var uri = Uri.parse(endpoint);
      var encodedBody = body == null ? null : json.encode(body);
      http.Response response = await http.delete(uri, body: encodedBody, headers: _getAuthHeaders());
      return _returnResponse(response);
    } catch (error) {
      if (kDebugMode) print('ERROR::::::$error::::::$endpoint');
      client.close();
      return ApiResponse(status: _500, response: null);
    }
  }

  @override
  Future<ApiResponse> patchRequest({required String endpoint, required Header header, var body}) async {
    HttpClient client = HttpClient();
    if (kDebugMode) print('post: $endpoint');
    try {
      var uri = Uri.parse(endpoint);
      var encodedBody = body == null ? null : json.encode(body);
      http.Response response = await http.patch(uri, body: encodedBody, headers: _getHeader(header));
      return _returnResponse(response);
    } catch (error) {
      if (kDebugMode) print('ERROR::::::$error::::::$endpoint');
      client.close();
      return ApiResponse(status: _500, response: null);
    }
  }

  @override
  Future<ApiResponse> multipartRequest({required http.MultipartRequest request}) async {
    HttpClient client = HttpClient();
    try {
      http.StreamedResponse response = await request.send();
      var responseResult = await response.stream.bytesToString();
      var returnResponse = http.Response(responseResult, response.statusCode, headers: response.headers, request: response.request);
      return _returnResponse(returnResponse);
    } catch (error) {
      if (kDebugMode) print('ERROR::::::$error::::::${request.url.path}');
      client.close();
      return ApiResponse(status: _500, response: null);
    }
  }

  ApiResponse _returnResponse(http.Response response) {
    int statusCode = response.statusCode;
    // if (kDebugMode) print('status-code: $statusCode ::: endpoint: ${response.request?.url}');
    if (kDebugMode) print('status-code: $statusCode ::: endpoint: ${response.request?.url}\nresponse-body: ${response.body}');
    var jsonResponse = response.bodyBytes.isEmpty ? null : json.decode(utf8.decode(response.bodyBytes));
    if (statusCode >= 200 && statusCode <= 299) {
      return ApiResponse(status: _200, response: jsonResponse);
    } else if (statusCode >= 500 && statusCode <= 599) {
      return ApiResponse(status: _500, response: {});
    } else if (statusCode == 401) {
      if (sl<AuthService>().authStatus) _logoutUser();
      return ApiResponse(status: _400, response: {});
    } else if (statusCode == 404) {
      return ApiResponse(status: _300, response: jsonResponse);
    } else if (statusCode == 422) {
      return ApiResponse(status: _300, response: jsonResponse);
    } else {
      return ApiResponse(status: _300, response: jsonResponse);
    }
  }

  void _logoutUser() {
    var context = navigatorKey.currentState!.context;
    Provider.of<GlobalViewModel>(context, listen: false).onLogout();
  }

  Map<String, String> _getHeader(Header header) => header == Header.http ? _getHttpHeaders() : _getAuthHeaders();

  Map<String, String> _getHttpHeaders() {
    Map<String, String> headers = <String, String>{};
    headers['Accept'] = 'application/json';
    headers['Content-Type'] = 'application/json';
    return headers;
  }

  Map<String, String> _getAuthHeaders() {
    Map<String, String> headers = <String, String>{};
    headers['Authorization'] = accessToken;
    headers['Accept'] = 'application/json';
    headers['Content-Type'] = 'application/json';
    return headers;
  }

  Future<Map<String, String>> get getMultipartHeaders async {
    var authStatus = sl<AuthService>().authStatus;
    Map<String, String> headers = {};
    headers['Accept'] = 'application/json';
    headers['Content-Type'] = 'application/json';
    if (authStatus) headers['Authorization'] = accessToken;
    return headers;
  }
}
