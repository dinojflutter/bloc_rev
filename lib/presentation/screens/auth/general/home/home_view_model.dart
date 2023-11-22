part of 'home_imports.dart';

class HomeViewModel {
  final Repository repository;

  HomeViewModel({required this.repository});

  final VelocityBloc<HomeModel> postbloc = VelocityBloc<HomeModel>(HomeModel());

  fetchAllposts() async {
    var postsData = await repository.postRepo.getAllPosts();
    if (postsData.status == 1) {
      postbloc.onUpdateData(postsData);
    }
  }
}
