part of 'onboard_widgets_imports.dart';

class OnBoardfirst extends StatelessWidget {
  const OnBoardfirst({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          MyAssets.assetsImagesLogo2,
          height: 300.h,
          width: 300.w,
        ),
        10.heightBox,
        "Customize your reading experience and join the conversation by creating an account.."
            .text
            .size(18.sp)
            .align(TextAlign.center)
            .make(),
        // "Customize your reading experience and join the conversation by creating an account.."
        //     .text
        //     .align(TextAlign.center)
        //     .make(),
        // "Explore a wide selection of categories, or use the search bar to find specific topics"
        //     .text
        //     .align(TextAlign.center)
        //     .make(),
      ],
    );
  }
}
