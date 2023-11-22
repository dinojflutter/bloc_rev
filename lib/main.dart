import 'package:bloc_revisions/core/themes/app_themes.dart';
import 'package:bloc_revisions/data/repositories/auth_repo.dart';
import 'package:bloc_revisions/data/repositories/post_repo.dart';
import 'package:bloc_revisions/data/repositories/tags_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data/repositories/repository.dart';
import 'presentation/screens/router/router_imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(RepositoryProvider(
    create: (context) => Repository(
      postRepo: PostRepo(),
      authRepo: AuthRepo(),
      tagsRepo: TagsRepo(),
    ),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',

        theme: AppThemes.light,
        darkTheme: AppThemes.dark,
        routerConfig: _appRouter.config(),
        // home: const MyHomePage(title: MyStrings.appname),
      ),
    );
  }
}
