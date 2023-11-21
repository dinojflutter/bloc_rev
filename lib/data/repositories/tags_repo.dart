import 'dart:convert';

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
        Vx.log(response.data);
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
}
