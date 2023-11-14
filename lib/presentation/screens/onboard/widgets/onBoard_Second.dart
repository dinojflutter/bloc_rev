part of 'onboard_widgets_imports.dart';

class OnBoardSecond extends StatefulWidget {
  const OnBoardSecond({super.key});

  @override
  State<OnBoardSecond> createState() => _OnBoardSecondState();
}

class _OnBoardSecondState extends State<OnBoardSecond> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          MyAssets.assetsImagesLogo3,
          height: 300.h,
          width: 300.w,
        ),
        10.heightBox,
        // "Customize your reading experience and join the conversation by creating an account.."
        //     .text
        //     .align(TextAlign.center)
        //     .make(),
        // "Customize your reading experience and join the conversation by creating an account.."
        //     .text
        //     .align(TextAlign.center)
        //     .make(),
        "Explore a wide selection of categories, or use the search bar to find specific topics"
            .text
            .align(TextAlign.center)
            .size(18.sp)
            .make(),
      ],
    );
  }
}
