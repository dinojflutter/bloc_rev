part of 'tags_imports.dart';

class TagsViewModel {
  final Repository repository;

  TagsViewModel({required this.repository});

  final VelocityBloc<TagsModel> tagsModelBloc =
      VelocityBloc<TagsModel>(TagsModel());

  fetchAllTags() async {
    var tagsData = await repository.tagsRepo.getAllTags();
    if (tagsData.status == 1) {
      tagsModelBloc.onUpdateData(tagsData);
    }
  }

  gotoTags(context) async {
    var updatedData =
        await AutoRouter.of(context).push<TagsModel>(const AddTagsRoute());
    // tagsModelBloc.onUpdateData(updatedData!);

    if (updatedData != null) {
      tagsModelBloc.onUpdateData(updatedData);
    }
  }

  gotoupdateTags(context, Tag tag) async {
    var addedData =
        await AutoRouter.of(context).push<TagsModel>(UpdateTagsRoute(tag: tag));
    // tagsModelBloc.onUpdateData(updatedData!);

    if (addedData != null) {
      tagsModelBloc.onUpdateData(addedData);
    }
  }

  deleteTags(String id, context, int index) async {
    var data = await repository.tagsRepo.deleteTags(id);
    if (data.status == 1) {
      VxToast.show(context, msg: data.message!);
      tagsModelBloc.state.data.tags!.removeAt(index);
      tagsModelBloc.onUpdateData(tagsModelBloc.state.data);
    }
  }
}
