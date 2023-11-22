part of 'home_imports.dart';

@RoutePage()
class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key, required this.post, required this.imagepath});
  final Post post;
  final String imagepath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: post.title!.text.ellipsis.color(Colors.white).make(),
      ),
      body: ListView(
        children: [
          Hero(
            tag: post.id.toString(),
            child: CachedNetworkImage(
              imageUrl: imagepath,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          10.h.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                post.title!.text.bold.xl2.make(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(FeatherIcons.eye),
                    5.w.widthBox,
                    "${post.views} views".text.make(),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FeatherIcons.thumbsUp,
                        color: Colors.green,
                      ),
                    ),
                    "0".text.make(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FeatherIcons.thumbsDown,
                        color: Colors.red,
                      ),
                    ),
                    "0".text.make(),
                  ],
                ),
                HtmlWidget(post.body!)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
