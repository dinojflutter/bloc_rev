part of 'add_posts_imports.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({super.key});

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  late AddPostsViewModel addPostsViewModel;

  @override
  void initState() {
    addPostsViewModel =
        AddPostsViewModel(repository: context.read<Repository>());

    super.initState();
  }

  @override
  void dispose() {
    addPostsViewModel._controller.dispose();
    addPostsViewModel.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: "Add Posts".text.color(Colors.white).make(),
        actions: [
          BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
            bloc: addPostsViewModel.isloadingbloc,
            builder: (context, state) {
              return IconButton(
                onPressed: () => addPostsViewModel.addpost(
                    context,
                    context
                        .read<VelocityBloc<ProfileModel>>()
                        .state
                        .data
                        .userDetails!
                        .id
                        .toString()),
                icon: state.data == true
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Icon(
                        FeatherIcons.check,
                        color: Colors.white,
                      ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          10.h.heightBox,
          BlocBuilder<VelocityBloc<XFile?>, VelocityState<XFile?>>(
            bloc: addPostsViewModel.selectedImagebloc,
            builder: (context, state) {
              return Stack(
                alignment: Alignment.bottomRight,
                children: [
                  state.data != null
                      ? Image.file(
                          File(state.data!.path),
                          height: 250,
                          width: 1.sw,
                          fit: BoxFit.cover,
                        ).cornerRadius(18)
                      : Image.network(
                          "https://addlogo.imageonline.co/image.jpg",
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ).cornerRadius(18),
                  IconButton(
                    onPressed: () => addPostsViewModel.pickImage(context),
                    icon: const Icon(
                      FeatherIcons.camera,
                      color: Colors.red,
                    ),
                  ),
                ],
              );
            },
          ),
          20.h.heightBox,
          VxTextField(
            hint: "Enter Title",
            borderRadius: 10,
            fillColor: Colors.transparent,
            borderColor: MyColors.appcolor,
            borderType: VxTextFieldBorderType.roundLine,
            controller: addPostsViewModel.textEditingController,
          ),
          10.h.heightBox,
          VxTextField(
            hint: "Slug",
            borderRadius: 10,
            fillColor: Colors.transparent,
            borderColor: MyColors.appcolor,
            borderType: VxTextFieldBorderType.roundLine,
            controller: addPostsViewModel.textEditingController,
          ),
          20.h.heightBox,
          BlocBuilder<VelocityBloc<Tag?>, VelocityState<Tag?>>(
            bloc: addPostsViewModel.selectedTagbloc,
            builder: (context, state) {
              return InkWell(
                onTap: () async {
                  var data = await AutoRouter.of(context)
                      .push<Tag>(TagsRoute(navigateType: NavigateType.inner));
                  addPostsViewModel.selectedTagbloc.onUpdateData(data);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(179, 199, 191, 191),
                      borderRadius: BorderRadius.circular(12)),
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        state.data != null
                            ? state.data!.title!.text.make()
                            : "Tags".text.make(),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.chevron_right))
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          12.h.heightBox,
          QuillToolbar.simple(
            configurations: QuillSimpleToolbarConfigurations(
              controller: addPostsViewModel._controller,
              sharedConfigurations: const QuillSharedConfigurations(
                locale: Locale('de'),
              ),
            ),
          ),
          QuillEditor.basic(
            configurations: QuillEditorConfigurations(
              controller: addPostsViewModel._controller,
              sharedConfigurations: const QuillSharedConfigurations(
                locale: Locale('de'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
