// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:bloc_revisions/presentation/screens/auth/auth_imports.dart'
    as _i2;
import 'package:bloc_revisions/presentation/screens/auth/general/general_imports.dart'
    as _i3;
import 'package:bloc_revisions/presentation/screens/auth/general/home/home_imports.dart'
    as _i4;
import 'package:bloc_revisions/presentation/screens/auth/general/home/home_model.dart'
    as _i13;
import 'package:bloc_revisions/presentation/screens/auth/general/tags/add-tags/add-tags_imports.dart'
    as _i1;
import 'package:bloc_revisions/presentation/screens/auth/general/tags/tags_imports.dart'
    as _i9;
import 'package:bloc_revisions/presentation/screens/auth/general/tags/tags_model.dart'
    as _i11;
import 'package:bloc_revisions/presentation/screens/auth/login/login_imports.dart'
    as _i5;
import 'package:bloc_revisions/presentation/screens/auth/registered/registered_imports.dart'
    as _i7;
import 'package:bloc_revisions/presentation/screens/onboard/onboard_imports.dart'
    as _i6;
import 'package:bloc_revisions/presentation/screens/splash/splash_import.dart'
    as _i8;
import 'package:flutter/material.dart' as _i12;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    AddTagsRoute.name: (routeData) {
      return _i10.AutoRoutePage<_i11.TagsModel>(
        routeData: routeData,
        child: const _i1.AddTags(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.Auth(),
      );
    },
    GeneralRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.General(),
      );
    },
    HomeDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<HomeDetailsRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.HomeDetails(
          key: args.key,
          post: args.post,
          imagepath: args.imagepath,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.Login(),
      );
    },
    OnBoardRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.OnBoard(),
      );
    },
    RegisteredRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.Registered(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SplashScreen(),
      );
    },
    TagsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.Tags(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddTags]
class AddTagsRoute extends _i10.PageRouteInfo<void> {
  const AddTagsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AddTagsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTagsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Auth]
class AuthRoute extends _i10.PageRouteInfo<void> {
  const AuthRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.General]
class GeneralRoute extends _i10.PageRouteInfo<void> {
  const GeneralRoute({List<_i10.PageRouteInfo>? children})
      : super(
          GeneralRoute.name,
          initialChildren: children,
        );

  static const String name = 'GeneralRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeDetails]
class HomeDetailsRoute extends _i10.PageRouteInfo<HomeDetailsRouteArgs> {
  HomeDetailsRoute({
    _i12.Key? key,
    required _i13.Post post,
    required String imagepath,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          HomeDetailsRoute.name,
          args: HomeDetailsRouteArgs(
            key: key,
            post: post,
            imagepath: imagepath,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeDetailsRoute';

  static const _i10.PageInfo<HomeDetailsRouteArgs> page =
      _i10.PageInfo<HomeDetailsRouteArgs>(name);
}

class HomeDetailsRouteArgs {
  const HomeDetailsRouteArgs({
    this.key,
    required this.post,
    required this.imagepath,
  });

  final _i12.Key? key;

  final _i13.Post post;

  final String imagepath;

  @override
  String toString() {
    return 'HomeDetailsRouteArgs{key: $key, post: $post, imagepath: $imagepath}';
  }
}

/// generated route for
/// [_i5.Login]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.OnBoard]
class OnBoardRoute extends _i10.PageRouteInfo<void> {
  const OnBoardRoute({List<_i10.PageRouteInfo>? children})
      : super(
          OnBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.Registered]
class RegisteredRoute extends _i10.PageRouteInfo<void> {
  const RegisteredRoute({List<_i10.PageRouteInfo>? children})
      : super(
          RegisteredRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisteredRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SplashScreen]
class SplashScreenRoute extends _i10.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.Tags]
class TagsRoute extends _i10.PageRouteInfo<void> {
  const TagsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          TagsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TagsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
