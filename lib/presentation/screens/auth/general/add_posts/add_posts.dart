part of 'add_posts_imports.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({super.key});

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  // final QuillController _controller = QuillController.basic();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: "Add Posts".text.color(Colors.white).make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.check,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Image.network(
                "https://www.ivins.com/wp-content/uploads/2020/09/placeholder-1.png",
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FeatherIcons.camera,
                  color: MyColors.appcolor,
                ),
              ),
            ],
          ),
          20.h.heightBox,
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const VxTextField(
              hint: "Enter Title",
              borderRadius: 10,
              fillColor: Colors.transparent,
              borderColor: MyColors.appcolor,
              borderType: VxTextFieldBorderType.roundLine,
            ),
          ),
          10.h.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const VxTextField(
              hint: "Slug",
              borderRadius: 10,
              fillColor: Colors.transparent,
              borderColor: MyColors.appcolor,
              borderType: VxTextFieldBorderType.roundLine,
            ),
          ),
          20.h.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(179, 199, 191, 191),
                  borderRadius: BorderRadius.circular(12)),
              height: 60,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    "Tags".text.make(),
                    const Spacer(),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.chevron_right))
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(179, 199, 191, 191),
                  borderRadius: BorderRadius.circular(12)),
              height: 60,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    "Categories".text.make(),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.chevron_right),
                    ),
                    10.h.heightBox,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
