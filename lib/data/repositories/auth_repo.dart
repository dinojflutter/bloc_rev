import 'dart:convert';

import 'package:bloc_revisions/data/models/message_model.dart';
import 'package:bloc_revisions/presentation/screens/auth/login/login_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../data_sources/remote/api_client.dart';
import '../data_sources/remote/api_endpoints_urls.dart';

class AuthRepo extends ApiClient {
  AuthRepo();

  Future<LoginModel> userlogin(String email, String password, context) async {
    Map body = {"email": email, "password": password};
    try {
      final response = await postRequest(path: ApiEndPoints.login, body: body);
      if (response.statusCode == 200) {
        final responseData = loginModelFromJson(jsonEncode(response.data));

        return responseData;
      } else {
        LoginModel();
      }
    } on Exception catch (e) {
      VxToast.show(context, msg: e.toString());
      LoginModel();
    }
    return LoginModel();
  }

  Future<MessageModel> userlogout(context) async {
    try {
      final response = await postRequest(
        path: ApiEndPoints.logout,
      );
      if (response.statusCode == 200) {
        final responseData = messageModelFromJson(jsonEncode(response.data));

        return responseData;
      } else {
        MessageModel();
      }
    } on Exception catch (e) {
      VxToast.show(context, msg: e.toString());
      MessageModel();
    }
    return MessageModel();
  }
}
