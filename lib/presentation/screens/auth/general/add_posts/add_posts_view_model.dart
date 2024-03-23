part of 'add_posts_imports.dart';

class AddPostsViewModel {
  final Repository repository;

  AddPostsViewModel({required this.repository});

  final ImagePicker picker = ImagePicker();

  final QuillController _controller = QuillController.basic();
  final TextEditingController textEditingController = TextEditingController();

  final VelocityBloc<XFile?> selectedImagebloc = VelocityBloc<XFile?>(null);

  final VelocityBloc<Tag?> selectedTagbloc = VelocityBloc<Tag?>(null);

  final VelocityBloc<bool> isloadingbloc = VelocityBloc<bool>(false);
  pickImage(context) async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImagebloc.onUpdateData(image);
    } else {
      VxToast.show(context, msg: "No Image Selected");
    }
  }

  clear() {
    textEditingController.clear();
    selectedImagebloc.onUpdateData(null);
    selectedTagbloc.onUpdateData(null);
    _controller.clear();
  }

  addpost(context, userId) async {
    isloadingbloc.onUpdateData(true);
    var data = await repository.postRepo.addnewPosts(
      textEditingController.text,
      textEditingController.text.toLowerCase().replaceAll(" ", "-"),
      selectedTagbloc.state.data!.id.toString(),
      _controller.document.toPlainText(),
      userId,
      selectedImagebloc.state.data!.path,
      selectedImagebloc.state.data!.path.split("/").last,
    );
    if (data.status == 1) {
      isloadingbloc.onUpdateData(false);
      clear();

      VxToast.show(context, msg: data.message.toString());
    }
  }
}
