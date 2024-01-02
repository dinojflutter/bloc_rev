import 'dart:convert';

import 'package:bloc_revisions/data/models/message_model.dart';
import 'package:bloc_revisions/presentation/screens/auth/general/tags/tags_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../data_sources/remote/api_client.dart';
import '../data_sources/remote/api_endpoints_urls.dart';

class TagsRepo extends ApiClient {
  TagsRepo();

  Future<TagsModel> getAllTags() async {
    try {
      final response = await getRequest(path: ApiEndPoints.tags);
      if (response.statusCode == 200) {
        final responseData = tagsModelFromJson(jsonEncode(response.data));
        // Vx.log(response.data);
        return responseData;
      } else {
        TagsModel();
      }
    } on Exception catch (e) {
      Vx.log(e);
      TagsModel();
    }
    return TagsModel();
  }

  Future<MessageModel> addnewTags(String title, String slug) async {
    Map body = {"title": title, "slug": slug};
    try {
      final response = await postRequest(
          path: ApiEndPoints.addtags, body: body, isTokenRequired: true);
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

  Future<MessageModel> deleteTags(String id) async {
    try {
      final response = await postRequest(
          path: "${ApiEndPoints.deletetags}/$id", isTokenRequired: true);
      if (response.statusCode == 200) {
        final responseData = messageModelFromJson(jsonEncode(response.data));
        Vx.log(response.data);
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

  Future<MessageModel> updateTags(String id, String title, String slug) async {
    Map body = {"id": id, "title": title, "slug": slug};
    try {
      final response = await postRequest(
          path: ApiEndPoints.updatetags, body: body, isTokenRequired: true);
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
