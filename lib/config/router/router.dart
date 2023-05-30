import 'package:askidapp/features/authentication/domain/entities/user_entity.dart';
import 'package:askidapp/features/authentication/presentation/pages/authentication_page.dart';
import 'package:askidapp/features/home/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final routes = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => AuthenticationPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => HomePage(
          userEntity: state.extra != null
              ? state.extra! as UserEntity
              : const UserEntity(email: 'email', password: 'password'),
        ),
      ),
    ],
  );
}
