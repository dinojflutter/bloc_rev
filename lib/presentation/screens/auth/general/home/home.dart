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
                    VxSwiper.builder(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        itemCount: state.data.popularPosts!.length,
                        itemBuilder: (context, index) {
                          var latestpost = state.data.popularPosts![index];
                          var imagepath = latestpost.featuredimage
                              .toString()
                              .prepend("https://techblog.codersangam.com/")
                              .replaceAll("public", "storage");
                          return CachedNetworkImage(
                            imageUrl: imagepath,
                            fit: BoxFit.cover,
                          );
                        }).cornerRadius(18),
                    15.h.heightBox,
                    Row(
                      children: [
                        "Latest Posts"
                            .text
                            .color(MyColors.appcolor)
                            .size(16)
                            .make(),
                        const Spacer(),
                        "See More".text.color(MyColors.appcolor).size(16).make()
                      ],
                    ).pSymmetric(h: 15.w),
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
                        var imagepath = latestpost.featuredimage
                            .toString()
                            .prepend("https://techblog.codersangam.com/")
                            .replaceAll("public", "storage");

                        return FadedScaleAnimation(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () => AutoRouter.of(context).push(
                                    HomeDetailsRoute(
                                        post: latestpost,
                                        imagepath: imagepath)),
                                child: Hero(
                                  tag: latestpost.id.toString(),
                                  child: CachedNetworkImage(
                                    imageUrl: imagepath,
                                    // height: 250,
                                    // width: 250,
                                    height: 120,
                                    width: 200,
                                    fit: BoxFit.cover,
                                  ).cornerRadius(18),
                                ),
                              ),
                              10.w.widthBox,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  latestpost.title!.text
                                      .maxLines(3)
                                      .size(14)
                                      .make(),
                                  5.h.heightBox,
                                  Row(
                                    children: [
                                      const Icon(FeatherIcons.clock),
                                      5.w.widthBox,
                                      latestpost.createdAt!
                                          .timeAgo()
                                          .toString()
                                          .text
                                          .make(),
                                    ],
                                  ),
                                  5.h.heightBox,
                                  Row(
                                    children: [
                                      "${latestpost.views} views ".text.make(),
                                      5.w.widthBox,
                                      const Icon(FeatherIcons.bookmark),
                                    ],
                                  )
                                ],
                              ).expand()
                            ],
                          ),
                        );
                      },
                    ).pSymmetric(h: 10.w)
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
