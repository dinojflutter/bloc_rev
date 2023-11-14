part of 'registered_imports.dart';

@RoutePage()
class Registered extends StatefulWidget {
  const Registered({super.key});

  @override
  State<Registered> createState() => _RegisteredState();
}

class _RegisteredState extends State<Registered> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appcolor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                10.h.heightBox,
                Center(
                  child: Image.asset(
                    MyAssets.assetsImagesLogoGroup,
                    height: 50.h,
                  ),
                ),
                100.h.heightBox,
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.93.h,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        50.h.heightBox,
                        "Registered"
                            .text
                            .size(18)
                            .bold
                            .color(MyColors.appcolor)
                            .make()
                            .centered(),
                        20.h.heightBox,
                        "Email".text.size(15).color(Colors.black).make(),
                        const VxTextField(
                          hint: "Enter Email",
                          borderRadius: 10,
                          fillColor: Colors.transparent,
                          borderColor: MyColors.appcolor,
                          borderType: VxTextFieldBorderType.roundLine,
                          prefixIcon: Icon(Icons.email),
                        ),
                        20.h.heightBox,
                        "Password".text.size(15).color(Colors.black).make(),
                        const VxTextField(
                          isPassword: true,
                          obscureText: true,
                          hint: "Enter Password",
                          borderRadius: 10,
                          fillColor: Colors.transparent,
                          borderColor: MyColors.appcolor,
                          borderType: VxTextFieldBorderType.roundLine,
                          prefixIcon: Icon(Icons.lock),
                        ),
                        20.h.heightBox,
                        "Confirm Password"
                            .text
                            .size(15)
                            .color(Colors.black)
                            .make(),
                        const VxTextField(
                          isPassword: true,
                          obscureText: true,
                          hint: "Enter Password",
                          borderRadius: 10,
                          fillColor: Colors.transparent,
                          borderColor: MyColors.appcolor,
                          borderType: VxTextFieldBorderType.roundLine,
                          prefixIcon: Icon(Icons.lock),
                        ),
                        10.h.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 220.w,
                              child: CheckboxListTile(
                                value: false,
                                onChanged: (value) {},
                                title: "Remember Me".text.size(14).make(),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              ),
                            ),
                            "Forget Password ?".text.make()
                          ],
                        ),
                        10.h.heightBox,
                        Primarybottom(text: "Login", onpressed: () {}),
                        15.h.heightBox,
                        "Already have an account ?"
                            .richText
                            .color(MyColors.appcolor)
                            .size(16)
                            .withTextSpanChildren([
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => AutoRouter.of(context)
                                        .push(const LoginRoute()),
                                  text: " Login",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))
                            ])
                            .make()
                            .centered(),
                        40.h.heightBox,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
