part of 'login_imports.dart';

@RoutePage()
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late LoginViewModel loginViewModel;

  @override
  void initState() {
    loginViewModel = LoginViewModel(repository: context.read<Repository>());
    super.initState();
  }

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
                  width: MediaQuery.sizeOf(context).width.w,
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
                        "Login"
                            .text
                            .size(18)
                            .bold
                            .color(MyColors.appcolor)
                            .make()
                            .centered(),
                        20.h.heightBox,
                        "Email".text.size(15).color(Colors.black).make(),
                        VxTextField(
                          hint: "Enter Email",
                          controller: loginViewModel.emailcontroller,
                          borderRadius: 10,
                          fillColor: Colors.transparent,
                          borderColor: MyColors.appcolor,
                          borderType: VxTextFieldBorderType.roundLine,
                          prefixIcon: Icon(Icons.email),
                        ),
                        20.h.heightBox,
                        "Password".text.size(15).color(Colors.black).make(),
                        VxTextField(
                          isPassword: true,
                          obscureText: true,
                          hint: "Enter Password",
                          controller: loginViewModel.passwordcontroller,
                          borderRadius: 10,
                          fillColor: Colors.transparent,
                          borderColor: MyColors.appcolor,
                          borderType: VxTextFieldBorderType.roundLine,
                          prefixIcon: Icon(Icons.lock),
                        ),
                        20.h.heightBox,
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
                        Primarybottom(
                            text: "Login",
                            onpressed: () {
                              loginViewModel.login(context);
                            }),
                        15.h.heightBox,
                        "Don`t have an account ?"
                            .richText
                            .color(MyColors.appcolor)
                            .size(16)
                            .withTextSpanChildren(
                              [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => AutoRouter.of(context)
                                        .push(const RegisteredRoute()),
                                  text: " Sign Up",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
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
