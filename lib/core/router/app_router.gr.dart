// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthenticationRoute.name: (routeData) {
      final args = routeData.argsAs<AuthenticationRouteArgs>(
          orElse: () => const AuthenticationRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AuthenticationPage(key: args.key),
      );
    }
  };
}

/// generated route for
/// [AuthenticationPage]
class AuthenticationRoute extends PageRouteInfo<AuthenticationRouteArgs> {
  AuthenticationRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AuthenticationRoute.name,
          args: AuthenticationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AuthenticationRoute';

  static const PageInfo<AuthenticationRouteArgs> page =
      PageInfo<AuthenticationRouteArgs>(name);
}

class AuthenticationRouteArgs {
  const AuthenticationRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AuthenticationRouteArgs{key: $key}';
  }
}
