part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeViewModel homeViewModel;

  @override
  void initState() {
    homeViewModel = HomeViewModel(repository: context.read<Repository>());
    homeViewModel.fetchAllposts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<VelocityBloc<HomeModel>, VelocityState<HomeModel>>(
          bloc: homeViewModel.postbloc,
          builder: (context, state) {
            if (state is VelocityInitialState) {
              const CircularProgressIndicator.adaptive();
            } else if (state is VelocityUpdateState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(MyAssets.assetsImagesLogoNetflix)
                        .cornerRadius(18),
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
                      itemCount: state.data.allPosts!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var latestpost = state.data.allPosts![index];

                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  latestpost.title!.text
                                      .maxLines(2)
                                      .size(15)
                                      .make(),
                                  5.h.heightBox,
                                  Row(
                                    children: [
                                      const Icon(FeatherIcons.clock),
                                      10.w.widthBox,
                                      latestpost.createdAt
                                          .toString()
                                          .text
                                          .make(),
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
                              ).expand(),
                            )
                          ],
                        );
                      },
                    )
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
