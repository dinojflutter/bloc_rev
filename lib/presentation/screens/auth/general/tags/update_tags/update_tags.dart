part of 'update_tags_imports.dart';

@RoutePage<TagsModel>()
class UpdateTags extends StatefulWidget {
  const UpdateTags({super.key, required this.tag});

  final Tag tag;

  @override
  State<UpdateTags> createState() => _UpdateTagsState();
}

class _UpdateTagsState extends State<UpdateTags> {
  late UpdateTagsViewModel updateTagsViewModel;

  @override
  void initState() {
    updateTagsViewModel =
        UpdateTagsViewModel(repository: context.read<Repository>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white, // Set the desired back button color here
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: MyColors.appcolor,
        title: "Add Tags".text.color(Colors.white).make().centered(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              VxTextField(
                hint: "Title",
                controller: updateTagsViewModel.textcontroller,
                borderRadius: 10,
                fillColor: Colors.transparent,
                borderColor: MyColors.appcolor,
                borderType: VxTextFieldBorderType.roundLine,
              ),
              20.h.heightBox,
              VxTextField(
                hint: "Slug",
                controller: updateTagsViewModel.textcontroller,
                borderRadius: 10,
                fillColor: Colors.transparent,
                borderColor: MyColors.appcolor,
                borderType: VxTextFieldBorderType.roundLine,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                  bloc: updateTagsViewModel.isloadingbloc,
                  builder: (context, state) {
                    return Primarybottom(
                        isloading: state.data,
                        text: "Update Tags",
                        onpressed: () =>
                            updateTagsViewModel.updateTags(context, "1"));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
