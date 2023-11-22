part of 'login_imports.dart';

class LoginViewModel {
  final Repository repository;

  LoginViewModel({required this.repository});

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();
  final VelocityBloc<bool> isloadingbloc = VelocityBloc<bool>(false);

  login(context) async {
    isloadingbloc.onUpdateData(true);
    var loginData = await repository.authRepo
        .userlogin(emailcontroller.text, passwordcontroller.text, context);
    if (loginData.accessToken != null) {
      Utiles.saveToken(loginData.accessToken.toString());
      AutoRouter.of(context).push(const GeneralRoute());
    }
    isloadingbloc.onUpdateData(false);
  }
}
