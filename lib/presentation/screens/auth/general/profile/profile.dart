part of 'profile_imports.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ProfileViewModel profileViewModel;

  @override
  void initState() {
    profileViewModel = ProfileViewModel(repository: context.read<Repository>());
    profileViewModel.getUserProfileData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: IconButton(
                onPressed: () => profileViewModel.logout(context),
                icon: const Icon(
                  FeatherIcons.logOut,
                  color: Colors.white,
                )),
          ),
        ],
      ),
      body:
          BlocBuilder<VelocityBloc<ProfileModel>, VelocityState<ProfileModel>>(
        bloc: profileViewModel.profilemodelbloc,
        builder: (context, state) {
          if (state is VelocityInitialState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is VelocityUpdateState) {
            return RefreshIndicator(
              onRefresh: () => profileViewModel.getUserProfileData(context),
              child: ListView(
                children: [
                  Container(
                    height: 450.h,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.r),
                        bottomRight: Radius.circular(40.r),
                      ),
                      color: MyColors.appcolor,
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            state.data.userDetails!.profilePhotoUrl.toString(),
                          ),
                          radius: 80.r,
                        ).centered(),
                        5.h.heightBox,
                        state.data.userDetails!.name!.text
                            .color(Colors.white)
                            .xl2
                            .size(15)
                            .make(),
                        state.data.userDetails!.email!.text
                            .color(Colors.white)
                            .xl
                            .size(13)
                            .make(),
                        10.h.heightBox,
                        state.data.userDetails!.about!.text
                            .color(Colors.white)
                            .xl
                            .center
                            .size(13)
                            .make()
                            .pSymmetric(h: 20.w),
                        15.h.heightBox,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 35.w),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  state.data.postsCount!.text
                                      .color(Colors.white)
                                      .xl2
                                      .make(),
                                  "Posts".text.color(Colors.white).xl.make(),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  "6".text.color(Colors.white).xl2.make(),
                                  "Following"
                                      .text
                                      .color(Colors.white)
                                      .xl
                                      .make(),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  "6".text.color(Colors.white).xl2.make(),
                                  "Followers"
                                      .text
                                      .color(Colors.white)
                                      .xl
                                      .make(),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  15.h.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: "My Posts".text.bold.xl.make(),
                  ),
                  15.h.heightBox,
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.data.posts!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        var userPostData = state.data.posts![index];
                        var imagepath = userPostData.featuredimage
                            .toString()
                            .prepend("https://techblog.codersangam.com/")
                            .replaceAll("public", "storage");
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Image.network(
                                imagepath,
                                fit: BoxFit.cover,
                                height: 130.h,
                                width: double.infinity,
                              ).cornerRadius(12),
                              5.h.heightBox,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  userPostData.title!.text
                                      .size(13.sp)
                                      .maxLines(3)
                                      .make()
                                      .expand(),
                                  IconButton(
                                      onPressed: () {},
                                      icon:
                                          const Icon(FeatherIcons.moreVertical))
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
