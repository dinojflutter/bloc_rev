part of 'onboard_imports.dart';

@RoutePage()
class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  OnBoardViewModel onBoardViewModel = OnBoardViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Appcolor"),
      // ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                10.h.heightBox,
                Image.asset(
                  MyAssets.assetsImagesLogoGroup,
                  height: 40.h,
                  width: 150.w,
                  color: MyColors.appcolor,
                ).centered(),
                PageView(
                  controller: onBoardViewModel.pageController,
                  children: const [
                    OnBoardfirst(),
                    OnBoardSecond(),
                    OnBoardfirst(),
                  ],
                ).expand(),
                Primarybottom(
                  onpressed: () {
                    AutoRouter.of(context).push(const AuthRoute());
                  },
                  text: "Get started",
                ),
                10.heightBox,
                // Primarybottom(
                //   // onpressed: () {
                //   //   AutoRouter.of(context).push(const AuthRoute());
                //   // },
                //   onpressed: () {
                //     ApiClient().PostRequest(path: ApiEndPoints.addtags, body: );
                //   },
                //   text: "post request",
                // ),
                30.h.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          // AutoRouter.of(context).push()
                        },
                        child: "Skip"
                            .text
                            .bold
                            .color(MyColors.appcolor)
                            .size(18.sp)
                            .make()),
                    SmoothPageIndicator(
                        controller: onBoardViewModel.pageController,
                        count: 3,
                        effect: const WormEffect(
                            dotHeight: 10,
                            dotWidth: 10,
                            activeDotColor:
                                MyColors.appcolor), // your preferred effect
                        onDotClicked: (index) {}),
                    "Next"
                        .text
                        .size(18.sp)
                        .color(MyColors.appcolor)
                        .bold
                        .make(),
                  ],
                ),
                20.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
