part of 'auth_imports.dart';

@RoutePage()
class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(MyAssets.assetsImagesLogoBacgroundImage),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      MyAssets.assetsImagesLogoGroup,
                      height: 50.h,
                    ),
                  ),
                  const Spacer(),
                  "Explore the World,"
                      .text
                      .color(Colors.white)
                      .bold
                      .size(25)
                      .make(),
                  "Billions of Thoughts."
                      .text
                      .color(Colors.white)
                      .bold
                      .size(25)
                      .make(),
                  25.h.heightBox,
                  Primarybottom(
                      text: "Login",
                      onpressed: () {
                        AutoRouter.of(context).push(const LoginRoute());
                      }),
                  20.h.heightBox,
                  Secondarybottom(
                      text: "Registered",
                      onpressed: () {
                        AutoRouter.of(context).push(const RegisteredRoute());
                      }),
                  30.h.heightBox,
                ],
              ),
            ),
          ),
        ));
  }
}
