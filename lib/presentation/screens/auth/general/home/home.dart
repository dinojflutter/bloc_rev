part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(MyAssets.assetsImagesLogoNetflix).cornerRadius(18),
              15.h.heightBox,
              Row(
                children: [
                  "Latest Posts".text.size(16).make(),
                  const Spacer(),
                  "See More".text.size(16).make()
                ],
              ),
              10.h.heightBox,
              ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
                shrinkWrap: true,
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () => AutoRouter.of(context)
                            .push(const HomeDetailsRoute()),
                        child: Image.asset(
                          MyAssets.assetsImagesLogoNetflix,
                          // height: 250,
                          // width: 250,
                          height: 120,
                          width: 200,
                          fit: BoxFit.cover,
                        ).cornerRadius(18),
                      ),
                      2.w.widthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "One Piece Episode 1081 Release Date and Time"
                              .text
                              .maxLines(2)
                              .size(15)
                              .make(),
                          5.h.heightBox,
                          Row(
                            children: [
                              const Icon(FeatherIcons.clock),
                              5.w.widthBox,
                              "6 days ago".text.make(),
                            ],
                          ),
                          5.h.heightBox,
                          Row(
                            children: [
                              "68 views".text.make(),
                              5.w.widthBox,
                              const Icon(FeatherIcons.bookmark),
                            ],
                          )
                        ],
                      ).expand()
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
