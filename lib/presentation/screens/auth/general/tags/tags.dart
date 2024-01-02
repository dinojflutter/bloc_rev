part of 'tags_imports.dart';

@RoutePage<Tag>()
class Tags extends StatefulWidget {
  const Tags({super.key});

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  late TagsViewModel tagsViewModel;

  @override
  void initState() {
    tagsViewModel = TagsViewModel(repository: context.read<Repository>());
    tagsViewModel.fetchAllTags();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.appcolor,
        automaticallyImplyLeading: false,
        title: "Tags".text.color(Colors.white).make().centered(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: () => tagsViewModel.gotoTags(context),
              icon: const Icon(
                FeatherIcons.plus,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<VelocityBloc<TagsModel>, VelocityState<TagsModel>>(
        bloc: tagsViewModel.tagsModelBloc,
        builder: (context, state) {
          if (state is VelocityInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is VelocityUpdateState) {
            return ListView.separated(
                itemCount: state.data.tags!.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemBuilder: (context, index) {
                  var tagsData = state.data.tags![index];

                  return Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: "${index + 1}".text.bold.make(),
                      title: tagsData.title!.text.size(16).make(),

                      // title: Text(tagsData.title.toString()),
                      trailing: SizedBox(
                        width: 100.w,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () => tagsViewModel.gotoupdateTags(
                                    context, tagsData),
                                icon: const Icon(
                                  FeatherIcons.edit2,
                                  color: Colors.green,
                                )),
                            IconButton(
                                onPressed: () => tagsViewModel.deleteTags(
                                    tagsData.id.toString(), context, index),
                                icon: const Icon(
                                  FeatherIcons.trash2,
                                  color: Colors.red,
                                )),
                          ],
                        ),
                      ),
                      onTap: () {
                        AutoRouter.of(context).pop<Tag>(tagsData);
                      },
                    ),
                  );
                });
          }
          return const SizedBox();
        },
      ),
    );
  }
}
