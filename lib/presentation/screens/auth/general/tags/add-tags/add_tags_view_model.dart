part of 'add_tags_imports.dart';

class AddTagsViewModel {
  final Repository repository;

  AddTagsViewModel({required this.repository});

  final TextEditingController textcontroller = TextEditingController();
  final VelocityBloc<bool> isloadingbloc = VelocityBloc<bool>(false);

  addnewTags(context) async {
    isloadingbloc.onUpdateData(true);
    var data = await repository.tagsRepo.addnewTags(textcontroller.text,
        textcontroller.text.toLowerCase().replaceAll(" ", "-"));
    if (data.status == 1) {
      VxToast.show(context, msg: data.message.toString());
      var newdata = await repository.tagsRepo.getAllTags();
      isloadingbloc.onUpdateData(false);
      AutoRouter.of(context).pop<TagsModel>(newdata);
    }
  }
}
