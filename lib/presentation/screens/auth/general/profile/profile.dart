part of 'profile_imports.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FeatherIcons.logOut,
                  color: Colors.white,
                )),
          ),
        ],
      ),
      body: ListView(
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
                  backgroundImage:
                      const AssetImage(MyAssets.assetsImagesLogoNetflix),
                  radius: 80.r,
                ).centered(),
                5.h.heightBox,
                "Dinoj Poudel".text.color(Colors.white).xl2.size(15).make(),
                "Dinojpoudel4@gmail.com"
                    .text
                    .color(Colors.white)
                    .xl
                    .size(13)
                    .make(),
                10.h.heightBox,
                "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups."
                    .text
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
                          "6".text.color(Colors.white).xl2.make(),
                          "Posts".text.color(Colors.white).xl.make(),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          "6".text.color(Colors.white).xl2.make(),
                          "Following".text.color(Colors.white).xl.make(),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          "6".text.color(Colors.white).xl2.make(),
                          "Followers".text.color(Colors.white).xl.make(),
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
              itemCount: 5,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Image.asset(MyAssets.assetsImagesLogoNetflix)
                          .cornerRadius(12),
                      5.h.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "One Piece Episode 1081 Release Date and Time"
                              .text
                              .make()
                              .expand(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(FeatherIcons.moreVertical))
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
}
