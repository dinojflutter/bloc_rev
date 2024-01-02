import 'dart:convert';

import 'package:bloc_revisions/data/models/message_model.dart';
import 'package:bloc_revisions/presentation/screens/auth/general/home/home_model.dart';
import 'package:bloc_revisions/presentation/screens/auth/general/profile/profile_model.dart';
import 'package:dio/dio.dart';
import 'package:velocity_x/velocity_x.dart';

import '../data_sources/remote/api_client.dart';
import '../data_sources/remote/api_endpoints_urls.dart';

class PostRepo extends ApiClient {
  PostRepo();

  Future<HomeModel> getAllPosts() async {
    try {
      final response = await getRequest(path: ApiEndPoints.posts);
      if (response.statusCode == 200) {
        final responseData = homeModelFromJson(jsonEncode(response.data));
        // Vx.log(response.data);
        return responseData;
      } else {
        HomeModel();
      }
    } on Exception catch (e) {
      Vx.log(e);
      HomeModel();
    }
    return HomeModel();
  }

  Future<ProfileModel> getuserPosts() async {
    try {
      final response =
          await getRequest(path: ApiEndPoints.userposts, isTokenRequired: true);
      if (response.statusCode == 200) {
        final responseData = profileModelFromJson(jsonEncode(response.data));
        // Vx.log(response.data);
        return responseData;
      } else {
        ProfileModel();
      }
    } on Exception catch (e) {
      Vx.log(e);
      ProfileModel();
    }
    return ProfileModel();
  }

  Future<MessageModel> addnewPosts(
    String title,
    String slug,
    String tagId,
    String body,
    String userId,
    String filepath,
    String filename,
  ) async {
    final formData = FormData.fromMap({
      'title': title,
      'slug': slug,
      'tags': tagId,
      'body': body,
      'status': '1',
      'user_id': userId,
      'featuredimage':
          await MultipartFile.fromFile(filepath, filename: filename)
    });

    try {
      final response = await postRequest(
          path: ApiEndPoints.addposts, body: formData, isTokenRequired: true);
      if (response.statusCode == 200) {
        final responseData = messageModelFromJson(jsonEncode(response.data));
        // Vx.log(response.data);
        return responseData;
      } else {
        MessageModel();
      }
    } on Exception catch (e) {
      Vx.log(e);
      MessageModel();
    }
    return MessageModel();
  }
}
