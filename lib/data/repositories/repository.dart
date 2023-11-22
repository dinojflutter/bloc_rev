import 'package:bloc_revisions/data/repositories/auth_repo.dart';
import 'package:bloc_revisions/data/repositories/post_repo.dart';
import 'package:bloc_revisions/data/repositories/tags_repo.dart';

class Repository {
  Repository(
      {required this.tagsRepo, required this.authRepo, required this.postRepo});

  final TagsRepo tagsRepo;
  final AuthRepo authRepo;
  final PostRepo postRepo;
}
