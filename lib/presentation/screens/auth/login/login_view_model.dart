part of 'login_imports.dart';

class LoginViewModel {
  final Repository repository;

  LoginViewModel({required this.repository});

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  login(context) async {
    var loginData = await repository.authRepo
        .userlogin(emailcontroller.text, passwordcontroller.text);
    if (loginData.accessToken != null) {
      AutoRouter.of(context).push(const GeneralRoute());

      print(loginData);
    }
  }
}
