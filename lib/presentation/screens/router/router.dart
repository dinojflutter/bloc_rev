part of 'router_imports.dart';

@AutoRouterConfig(replaceInRouteName: "Routes")
class AppRouter extends $AppRouter {
  // @override
  // RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashScreenRoute.page, path: "/", initial: true),
        AutoRoute(page: OnBoardRoute.page),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisteredRoute.page),
        AutoRoute(page: GeneralRoute.page),
        AutoRoute(page: HomeDetailsRoute.page),
      ];
}
