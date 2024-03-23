part of 'profile_imports.dart';

class ProfileViewModel {
  final Repository repository;

  ProfileViewModel({required this.repository});

  final VelocityBloc<ProfileModel> profilemodelbloc =
      VelocityBloc<ProfileModel>(ProfileModel());

  getUserProfileData(BuildContext context) async {
    var userProfileData = await repository.postRepo.getuserPosts();
    if (userProfileData.status == 1) {
      if (context.mounted) {
        context
            .read<VelocityBloc<ProfileModel>>()
            .onUpdateData(userProfileData);
      }

      profilemodelbloc.onUpdateData(userProfileData);
    }
  }

  logout(context) async {
    var data = await repository.authRepo.userlogout(context);
    if (data.message.isNotEmptyAndNotNull) {
      Utiles.clearAllsaveData();
      VxToast.show(context, msg: data.message.toString());
      AutoRouter.of(context).push(const AuthRoute());
    }
  }
}
