part of 'add_tags_imports.dart';

@RoutePage<TagsModel>()
class AddTags extends StatefulWidget {
  const AddTags({super.key});

  @override
  State<AddTags> createState() => _AddTagsState();
}

class _AddTagsState extends State<AddTags> {
  late AddTagsViewModel addTagsViewModel;

  @override
  void initState() {
    addTagsViewModel = AddTagsViewModel(repository: context.read<Repository>());
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
                controller: addTagsViewModel.textcontroller,
                borderRadius: 10,
                fillColor: Colors.transparent,
                borderColor: MyColors.appcolor,
                borderType: VxTextFieldBorderType.roundLine,
              ),
              20.h.heightBox,
              VxTextField(
                hint: "Slug",
                controller: addTagsViewModel.textcontroller,
                borderRadius: 10,
                fillColor: Colors.transparent,
                borderColor: MyColors.appcolor,
                borderType: VxTextFieldBorderType.roundLine,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                  bloc: addTagsViewModel.isloadingbloc,
                  builder: (context, state) {
                    return Primarybottom(
                        isloading: state.data,
                        text: "Add Tags",
                        onpressed: () => addTagsViewModel.addnewTags(context));
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
