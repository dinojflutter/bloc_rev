part of 'update_tags_imports.dart';

class UpdateTagsViewModel {
  final Repository repository;

  UpdateTagsViewModel({required this.repository});

  final TextEditingController textcontroller = TextEditingController();
  final VelocityBloc<bool> isloadingbloc = VelocityBloc<bool>(false);

  updateTags(context, String id) async {
    isloadingbloc.onUpdateData(true);
    var data = await repository.tagsRepo.updateTags(textcontroller.text, id,
        textcontroller.text.toLowerCase().replaceAll(" ", "-"));
    if (data.status == 1) {
      VxToast.show(context, msg: data.message.toString());
      var newdata = await repository.tagsRepo.getAllTags();
      isloadingbloc.onUpdateData(false);
      AutoRouter.of(context).pop<TagsModel>(newdata);
    }
  }
}
