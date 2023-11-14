part of 'categories_imports.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.appcolor,
        automaticallyImplyLeading: false,
        title: "Categories".text.color(Colors.white).make().centered(),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 12),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FeatherIcons.plus,
                  color: Colors.white,
                ),
              )),
        ],
      ),
      body: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 10,
            );
          },
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              child: ListTile(
                leading: "${index + 1}".text.bold.make(),
                title: const Text("Enter the data"),
                trailing: SizedBox(
                  width: 100.w,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FeatherIcons.edit2,
                            color: Colors.green,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FeatherIcons.trash2,
                            color: Colors.red,
                          )),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
