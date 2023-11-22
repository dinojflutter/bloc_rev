part of 'splash_import.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    moveToonBoard();
    super.initState();
  }

  moveToonBoard() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Utiles.loginManipulation(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.appcolor,
        body: FadedScaleAnimation(
          child: Center(
            child: Image.asset(
              MyAssets.assetsImagesLogoGroup,
              height: 50,
              width: 150,
            ),
            // child: Image(
            //   image: AssetImage(
            //     "assets/images/logo/Group 2.png",
            //   ),
          ),
        ));
  }
}
